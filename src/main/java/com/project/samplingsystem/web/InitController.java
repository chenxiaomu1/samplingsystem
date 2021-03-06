package com.project.samplingsystem.web;

import com.project.samplingsystem.config.permission.NBAuth;
import com.project.samplingsystem.dao.repository.ParamRepository;
import com.project.samplingsystem.model.constant.SampleSystemConstant;
import com.project.samplingsystem.model.entity.permission.NBSysResource.ResType;
import com.project.samplingsystem.model.pojo.framework.NBR;
import com.project.samplingsystem.service.authority.AuthorityService;
import com.project.samplingsystem.service.param.ParamService;
import com.project.samplingsystem.util.FontAwesomeUtil;
import com.project.samplingsystem.util.NBUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static com.project.samplingsystem.config.permission.NBAuth.Group;

/**
 * created by Wuwenbin on 2018/7/16 at 14:10
 *
 * @author wuwenbin
 */
@Controller
public class InitController {

    private final ParamService paramService;
    private final ParamRepository paramRepository;
    private final AuthorityService authorityService;

    @Autowired
    public InitController(ParamService paramService, AuthorityService authorityService, ParamRepository paramRepository) {
        this.paramService = paramService;
        this.authorityService = authorityService;
        this.paramRepository = paramRepository;
    }

    @RequestMapping("/init")
    public String init() {
        boolean initialization =
                paramService.getValueByName(SampleSystemConstant.Param.INIT_STATUS)
                        .equals(SampleSystemConstant.Init.INIT_NOT);
        return initialization ? "init" : "redirect:/";
    }

    @RequestMapping("/init/submit")
    @ResponseBody
    public NBR initSubmit(HttpServletRequest request, String username, String password, String email) {
        paramService.saveInitParam(request.getParameterMap());
        authorityService.initMasterAccount(username, password, email);
        paramRepository.updateValueByName(SampleSystemConstant.Param.MAIL_SERVER_ACCOUNT, email);
        paramRepository.updateInitParam("1", "init_status");
        return NBR.ok("????????????????????????");
    }

    @NBAuth(value = "user:font:page", remark = "??????????????????", group = Group.PAGE, type = ResType.NAV_LINK)
    @RequestMapping("/font/list")
    public String b(HttpServletRequest request) {
        String fontAwesome = NBUtils.getFilePathInClassesPath("static/plugins/font-awesome/css/font-awesome.css");
        List<String> a = FontAwesomeUtil.getAllFonts(fontAwesome);
        request.setAttribute("fonts", a);
        return "fonts";
    }

}
