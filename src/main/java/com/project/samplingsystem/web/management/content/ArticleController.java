package com.project.samplingsystem.web.management.content;

import com.project.samplingsystem.config.application.NBContext;
import com.project.samplingsystem.config.permission.NBAuth;
import com.project.samplingsystem.dao.repository.ArticleRepository;
import com.project.samplingsystem.dao.repository.CateRepository;
import com.project.samplingsystem.exception.ArticleFetchFailedException;
import com.project.samplingsystem.model.constant.SampleSystemConstant;
import com.project.samplingsystem.model.constant.TagType;
import com.project.samplingsystem.model.entity.NBArticle;
import com.project.samplingsystem.model.entity.permission.NBSysResource;
import com.project.samplingsystem.model.entity.permission.NBSysUser;
import com.project.samplingsystem.model.pojo.framework.LayuiTable;
import com.project.samplingsystem.model.pojo.framework.NBR;
import com.project.samplingsystem.model.pojo.framework.Pagination;
import com.project.samplingsystem.service.content.ArticleService;
import com.project.samplingsystem.service.content.TagService;
import com.project.samplingsystem.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Optional;

/**
 * created by Wuwenbin on 2018/8/2 at 21:24
 *
 * @author wuwenbin
 */
@Controller
@RequestMapping("/management")
public class ArticleController extends BaseController {

    private final CateRepository cateRepository;
    private final NBContext context;
    private final ArticleService articleService;
    private final ArticleRepository articleRepository;
    private final TagService tagService;

    @Autowired
    public ArticleController(CateRepository cateRepository, NBContext context, ArticleService articleService, ArticleRepository articleRepository, TagService tagService) {
        this.cateRepository = cateRepository;
        this.context = context;
        this.articleService = articleService;
        this.articleRepository = articleRepository;
        this.tagService = tagService;
    }

    @RequestMapping("/article/post")
    @NBAuth(value = "management:article:post_page", remark = "??????????????????", type = NBSysResource.ResType.NAV_LINK, group = NBAuth.Group.ROUTER)
    public String article(Model model) {
        model.addAttribute("cateList", cateRepository.findAll());
        return "management/content/article_post";
    }

    @RequestMapping(value = "/article", method = RequestMethod.GET)
    @NBAuth(value = "management:article:list_page", remark = "??????????????????", type = NBSysResource.ResType.NAV_LINK, group = NBAuth.Group.ROUTER)
    public String articleList() {
        return "management/content/article_list";
    }

    @RequestMapping("/article/edit")
    @NBAuth(value = "management:article:edit_page", remark = "?????????????????????", type = NBSysResource.ResType.OTHER, group = NBAuth.Group.ROUTER)
    public String edit(Model model, Long id) {
        model.addAttribute("cateList", cateRepository.findAll());
        Optional<NBArticle> article = articleRepository.findById(id);
        model.addAttribute("editArticle", article.orElseThrow(ArticleFetchFailedException::new));
        return "management/content/article_edit";
    }

    @RequestMapping("/article/edit/tags")
    @ResponseBody
    @NBAuth(value = "management:article:edit_article_tags", remark = "?????????????????????tag?????????????????????(selected)", type = NBSysResource.ResType.OTHER, group = NBAuth.Group.AJAX)
    public NBR editPageArticleTags(Long id) {
        if (StringUtils.isEmpty(id)) {
            return NBR.custom(-1);
        } else {
            return NBR.custom(0, tagService.findSelectedTagsByReferId(id, TagType.article));
        }
    }

    @RequestMapping(value = "/article/list", method = RequestMethod.GET)
    @NBAuth(value = "management:article:list_data", remark = "????????????????????????????????????", group = NBAuth.Group.AJAX)
    @ResponseBody
    public LayuiTable<NBArticle> articleList(Pagination<NBArticle> pagination, String title, @CookieValue(SampleSystemConstant.Session.SESSION_ID_COOKIE) String uuid) {
        NBSysUser user = context.getSessionUser(uuid);
        Pageable pageable = getPageable(pagination);
        Page<NBArticle> page = articleService.findPageInfo(pageable, title, user.getId());
        return layuiTable(page, pageable);
    }

    @RequestMapping("/article/create")
    @NBAuth(value = "management:article:create", remark = "????????????????????????", group = NBAuth.Group.AJAX)
    @ResponseBody
    public NBR articleCreate(@Valid NBArticle article, BindingResult result, String tagNames, @CookieValue(SampleSystemConstant.Session.SESSION_ID_COOKIE) String uuid) {
        if (result.getErrorCount() == 0) {
            NBSysUser user = context.getSessionUser(uuid);
            article.setAuthorId(user.getId());
            articleService.createArticle(article, tagNames);
            return NBR.ok("?????????????????????");
        } else {
            return ajaxJsr303(result.getFieldErrors());
        }
    }

    @RequestMapping("/article/update")
    @NBAuth(value = "management:article:update", remark = "??????????????????", group = NBAuth.Group.AJAX)
    @ResponseBody
    public NBR articleUpdate(@Valid NBArticle article, BindingResult result, String tagNames, @CookieValue(SampleSystemConstant.Session.SESSION_ID_COOKIE) String uuid) {
        if (result.getErrorCount() == 0) {
            NBSysUser user = context.getSessionUser(uuid);
            article.setAuthorId(user.getId());
            try {
                articleService.updateArticle(article, tagNames);
                return NBR.ok("?????????????????????");
            } catch (RuntimeException e) {
                return NBR.error(e.getMessage());
            }
        } else {
            return ajaxJsr303(result.getFieldErrors());
        }
    }


    @RequestMapping("/article/update/appreciable/{id}")
    @ResponseBody
    @NBAuth(value = "management:article:update_appreciable", remark = "??????????????????????????????", group = NBAuth.Group.AJAX)
    public NBR appreciable(@PathVariable("id") Long id, Boolean appreciable) {
        return ajaxDone(
                () -> articleRepository.updateAppreciableById(appreciable, id) == 1
                , () -> "??????????????????"
        );
    }

    @RequestMapping("/article/update/commented/{id}")
    @ResponseBody
    @NBAuth(value = "management:article:update_commented", remark = "??????????????????????????????", group = NBAuth.Group.AJAX)
    public NBR commented(@PathVariable("id") Long id, Boolean commented) {
        return ajaxDone(
                () -> articleRepository.updateCommentedById(commented, id) == 1
                , () -> "??????????????????"
        );
    }

    @RequestMapping("/article/update/top/{id}")
    @ResponseBody
    @NBAuth(value = "management:article:update_top", remark = "???????????????????????????", group = NBAuth.Group.AJAX)
    public NBR top(@PathVariable("id") Long id, Boolean top) {
        return ajaxDone(
                () -> articleService.updateTopById(id, top)
                , () -> "??????????????????"
        );
    }

    @RequestMapping("/article/delete/{id}")
    @ResponseBody
    @NBAuth(value = "management:article:delete", remark = "??????????????????", group = NBAuth.Group.AJAX)
    public NBR delete(@PathVariable("id") Long id) {
        return ajaxDone(id
                , articleRepository::deleteById
                , () -> "????????????"
        );
    }

}
