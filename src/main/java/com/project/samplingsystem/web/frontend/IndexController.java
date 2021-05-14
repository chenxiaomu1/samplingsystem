package com.project.samplingsystem.web.frontend;

import com.project.samplingsystem.dao.repository.*;
import com.project.samplingsystem.model.constant.SampleSystemConstant;
import com.project.samplingsystem.model.entity.NBArticle;
import com.project.samplingsystem.model.entity.NBComment;
import com.project.samplingsystem.model.entity.NBParam;
import com.project.samplingsystem.model.entity.NBTag;
import com.project.samplingsystem.model.pojo.bo.ArticleQueryBO;
import com.project.samplingsystem.model.pojo.framework.NBR;
import com.project.samplingsystem.model.pojo.framework.Pagination;
import com.project.samplingsystem.service.content.ArticleService;
import com.project.samplingsystem.service.content.TagService;
import com.project.samplingsystem.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.util.stream.Collectors.toMap;
import static com.project.samplingsystem.model.constant.SampleSystemConstant.ParamValue.PAGE_MODERN_BUTTON;
import static com.project.samplingsystem.model.constant.SampleSystemConstant.ParamValue.PAGE_MODERN_DEFAULT;

/**
 * created by Wuwenbin on 2018/7/31 at 21:33
 *
 * @author wuwenbin
 */
@Controller
public class IndexController extends BaseController {

    private final ParamRepository paramRepository;
    private final ArticleRepository articleRepository;
    private final CateRepository cateRepository;
    private final ArticleService articleService;
    private final CommentRepository commentRepository;
    private final UserRepository userRepository;
    private final TagService tagService;
    private final TagRepository tagRepository;

    @Autowired
    public IndexController(ParamRepository paramRepository,
                           ArticleRepository articleRepository, CateRepository cateRepository,
                           ArticleService articleService, CommentRepository commentRepository,
                           UserRepository userRepository, TagService tagService, TagRepository tagRepository) {
        this.paramRepository = paramRepository;
        this.articleRepository = articleRepository;
        this.cateRepository = cateRepository;
        this.articleService = articleService;
        this.commentRepository = commentRepository;
        this.userRepository = userRepository;
        this.tagService = tagService;
        this.tagRepository = tagRepository;
    }

    @RequestMapping(value = {"", "/index"})
    public String index(Model model) {
        String pageModern = paramRepository.findByName(SampleSystemConstant.Param.PAGE_MODERN).getValue();
        model.addAttribute("articleCount", articleRepository.countByDraft(false));
        model.addAttribute("cateList", cateRepository.findAll());
        return handleStyle(
                "frontend/index/index_simple",
                () -> {
                    model.addAttribute("randomArticles", articleRepository.findRandomArticles(10));
                    model.addAttribute("tagList", tagService.findTagsTab());
                    if (PAGE_MODERN_DEFAULT.equalsIgnoreCase(pageModern)) {
                        return "frontend/index/index_flow";
                    } else if (PAGE_MODERN_BUTTON.equalsIgnoreCase(pageModern)) {
                        return "frontend/index/index_pagination";
                    } else {
                        return "redirect:/error?errorCode=404";
                    }
                }, paramRepository
        );
    }

    @RequestMapping(value = {"/next", "/index/next"})
    @ResponseBody
    public NBR nextPageArticle(Pagination<NBArticle> pagination, ArticleQueryBO articleQueryBO) {
        Map<String, String> orders = new HashMap<>(2);
        orders.put("top", "desc");
        orders.put("post", "desc");
        Sort sort = getJpaSortWithOther(pagination, orders);
        NBParam pageParam = paramRepository.findByName(SampleSystemConstant.Param.BLOG_INDEX_PAGE_SIZE);
        NBParam modernParam = paramRepository.findByName(SampleSystemConstant.Param.PAGE_MODERN);
        int modern = Integer.valueOf(modernParam.getValue());
        int pageSize = Integer.valueOf(pageParam.getValue());
        pageSize = modern == 0 ? pageSize > 10 ? pageSize : pagination.getLimit() : pagination.getLimit();
        Pageable pageable = PageRequest.of(pagination.getPage() - 1, pageSize, sort);
        Page<NBArticle> page = articleService.findBlogArticles(pageable, articleQueryBO);
        Map<Long, Long> commentCounts = page.getContent().stream()
                .collect(toMap(
                        NBArticle::getId,
                        article -> commentRepository.count(Example.of(NBComment.builder().articleId(article.getId()).build()))
                ));
        Map<Long, String> articleAuthorNames = page.getContent().stream()
                .collect(toMap(
                        NBArticle::getId,
                        article -> userRepository.getOne(article.getAuthorId()).getNickname()
                ));
        Map<Long, List<NBTag>> articleTagsMap = page.getContent().stream()
                .collect(toMap(
                        NBArticle::getId,
                        article -> tagRepository.findArticleTags(article.getId(), true)
                ));
        Map<String, Object> resultMap = new HashMap<>(4);
        resultMap.put("pageArticle", page);
        resultMap.put("articleComments", commentCounts);
        resultMap.put("articleAuthors", articleAuthorNames);
        resultMap.put("articleTagsMap", articleTagsMap);
        return NBR.ok("获取成功", resultMap);
    }

}
