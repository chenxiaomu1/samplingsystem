package com.project.samplingsystem.web.management.authority;

import com.project.samplingsystem.config.permission.NBAuth;
import com.project.samplingsystem.dao.repository.MenuRepository;
import com.project.samplingsystem.dao.repository.ResourceRepository;
import com.project.samplingsystem.dao.repository.RoleRepository;
import com.project.samplingsystem.dao.repository.RoleResourceRepository;
import com.project.samplingsystem.model.constant.SampleSystemConstant;
import com.project.samplingsystem.model.entity.permission.NBSysMenu;
import com.project.samplingsystem.model.entity.permission.NBSysResource;
import com.project.samplingsystem.model.entity.permission.NBSysRole;
import com.project.samplingsystem.model.entity.permission.NBSysRoleResource;
import com.project.samplingsystem.model.entity.permission.pk.RoleResourceKey;
import com.project.samplingsystem.model.pojo.framework.LayuiTable;
import com.project.samplingsystem.model.pojo.framework.NBR;
import com.project.samplingsystem.service.authority.AuthorityService;
import com.project.samplingsystem.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.List;

/**
 * created by Wuwenbin on 2018/7/23 at 10:50
 *
 * @author wuwenbin
 */
@Controller
@RequestMapping("/management")
public class AuthorityController extends BaseController {

    private final RoleRepository roleRepository;
    private final AuthorityService authorityService;
    private final RoleResourceRepository roleResourceRepository;
    private final MenuRepository menuRepository;
    private final ResourceRepository resourceRepository;

    @Autowired
    public AuthorityController(RoleRepository rr, AuthorityService ups,
                               RoleResourceRepository rrr,
                               MenuRepository mr, ResourceRepository resR) {
        this.roleRepository = rr;
        this.authorityService = ups;
        this.roleResourceRepository = rrr;
        this.menuRepository = mr;
        this.resourceRepository = resR;
    }


    @RequestMapping("/role")
    @NBAuth(value = "permission:role:router", remark = "????????????????????????", type = NBSysResource.ResType.NAV_LINK, group = NBAuth.Group.ROUTER)
    public String roleRouter(Model model) {
        List<NBSysRole> roles = roleRepository.findAll();
        model.addAttribute("roleList", roles);
        return "management/authority/role";
    }


    @RequestMapping("/menu")
    @NBAuth(value = "permission:menu:router", remark = "??????????????????", type = NBSysResource.ResType.NAV_LINK, group = NBAuth.Group.ROUTER)
    public String menuIndex(Model model, Long roleId) {
        List<NBSysRole> roles = roleRepository.findAll();
        List<NBSysMenu> menus = menuRepository.findAll();
        model.addAttribute("roleList", roles);
        model.addAttribute("menuList", menus);
        if (!StringUtils.isEmpty(roleId)) {
            model.addAttribute("roleId", roleId);
        }
        return "management/authority/menu";
    }


    @RequestMapping("/resource/tree")
    @ResponseBody
    @NBAuth(value = "permission:role:resource_tree", remark = "????????????????????????????????????", group = NBAuth.Group.AJAX)
    public NBR resourcesTree(Long roleId) {
        return NBR.ok(authorityService.findResourceTreeByRoleId(roleId));
    }


    @RequestMapping("/update/role/resource")
    @ResponseBody
    @NBAuth(value = "permission:role:update_role_resource", remark = "????????????????????????????????????", group = NBAuth.Group.AJAX)
    public NBR updateRoleResource(Long roleId, @RequestParam(value = "resourceIds[]", required = false) Long[] resourceIds) {
        roleResourceRepository.deleteRrByRoleId(roleId);
        if (resourceIds != null && resourceIds.length > 0) {
            for (Long resource : resourceIds) {
                if (!StringUtils.isEmpty(resource)) {
                    NBSysRoleResource rr = NBSysRoleResource.builder()
                            .pk(new RoleResourceKey(roleId, resource)).build();
                    roleResourceRepository.saveAndFlush(rr);
                }
            }
        }
        return NBR.ok("?????????????????????????????????");
    }


    @ResponseBody
    @RequestMapping("/role/create")
    @NBAuth(value = "permission:role:create", remark = "?????????????????????", group = NBAuth.Group.AJAX)
    public NBR addRole(@Valid NBSysRole role, BindingResult result) {
        if (result.getErrorCount() == 0) {
            roleRepository.saveAndFlush(role);
            return NBR.formatOk("???????????? [{}] ?????????", role.getCnName());
        } else {
            return ajaxJsr303(result.getFieldErrors());
        }
    }


    @ResponseBody
    @RequestMapping("/role/delete")
    @NBAuth(value = "permission:role:delete", remark = "??????????????????", group = NBAuth.Group.AJAX)
    public NBR deleteRole(Long roleId) {
        roleRepository.deleteById(roleId);
        return NBR.ok("?????????????????????");
    }


    @ResponseBody
    @RequestMapping("/role/update")
    @NBAuth(value = "permission:role:update", remark = "??????????????????", group = NBAuth.Group.AJAX)
    public NBR updateRole(@Valid NBSysRole role, BindingResult result) {
        if (result.getErrorCount() == 0) {
            roleRepository.saveAndFlush(role);
            return NBR.formatOk("???????????? [{}] ?????????", role.getCnName());
        } else {
            return ajaxJsr303(result.getFieldErrors());
        }
    }


    @RequestMapping("/menu/list")
    @ResponseBody
    @NBAuth(value = "permission:menu:table_list", remark = "?????????????????????????????????", group = NBAuth.Group.AJAX)
    public LayuiTable<NBSysMenu> roleMenuList(Long roleId) {
        List<NBSysMenu> menus = menuRepository.findAllByRoleId(roleId);
        menus.add(menuRepository.findByParentId(0L));
        return new LayuiTable<>(menus.size(), menus);
    }


    @RequestMapping("/menu/add")
    @NBAuth(value = "permission:menu:add", remark = "????????????????????????", group = NBAuth.Group.ROUTER)
    public String addMenu(Model model, Long roleId, String parentId) {
        if (StringUtils.isEmpty(roleId)) {
            return SampleSystemConstant.Session.ERROR_ROUTER;
        }
        model.addAttribute("roleId", roleId);
        model.addAttribute("parentId", parentId);
        List<Long> resIds = roleResourceRepository.findResourceIdByRoleId(roleId);
        if (resIds != null && resIds.size() > 0) {
            model.addAttribute("resources", resourceRepository.findAllByTypeAndIdIn(NBSysResource.ResType.NAV_LINK, resIds));
        }
        return "management/authority/menu_add";
    }


    @RequestMapping("/menu/edit")
    @NBAuth(value = "permission:menu:edit", remark = "????????????????????????", group = NBAuth.Group.ROUTER)
    public String addMenu(Model model, Long menuId, Long roleId) {
        if (StringUtils.isEmpty(menuId) || StringUtils.isEmpty(roleId)) {
            return SampleSystemConstant.Session.ERROR_ROUTER;
        }
        List<Long> resIds = roleResourceRepository.findResourceIdByRoleId(roleId);
        if (resIds != null && resIds.size() > 0) {
            model.addAttribute("resources", resourceRepository.findAllByTypeAndIdIn(NBSysResource.ResType.NAV_LINK, resIds));
        }
        model.addAttribute("menu", menuRepository.getOne(menuId));
        return "management/authority/menu_edit";
    }


    @ResponseBody
    @NBAuth(value = "permission:menu:create", remark = "???????????????????????????", group = NBAuth.Group.AJAX)
    @RequestMapping("/menu/create")
    public NBR createMenu(@Valid NBSysMenu menu, BindingResult result) {
        if (result.getErrorCount() == 0) {
            menuRepository.saveAndFlush(menu);
            return NBR.formatOk("???????????? [{}] ?????????", menu.getName());
        } else {
            return ajaxJsr303(result.getFieldErrors());
        }
    }


    @ResponseBody
    @NBAuth(value = "permission:menu:update", remark = "??????????????????", group = NBAuth.Group.AJAX)
    @RequestMapping("/menu/update")
    public NBR modifyMenu(@Valid NBSysMenu menu, BindingResult result) {
        if (result.getErrorCount() == 0) {
            if (StringUtils.isEmpty(menu.getId())) {
                return NBR.error("id???????????????");
            }
            menuRepository.saveAndFlush(menu);
            return NBR.formatOk("???????????? [{}] ?????????", menu.getName());
        } else {
            return ajaxJsr303(result.getFieldErrors());
        }
    }


    @ResponseBody
    @NBAuth(value = "permission:menu:delete", remark = "??????????????????", group = NBAuth.Group.AJAX)
    @RequestMapping("/menu/delete")
    public NBR deleteMenu(Long id) {
        authorityService.deleteMenu(id);
        return NBR.ok("?????????????????????");
    }


}
