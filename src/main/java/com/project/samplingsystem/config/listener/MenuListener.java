package com.project.samplingsystem.config.listener;

import com.project.samplingsystem.dao.repository.MenuRepository;
import com.project.samplingsystem.dao.repository.ParamRepository;
import com.project.samplingsystem.dao.repository.ResourceRepository;
import com.project.samplingsystem.dao.repository.RoleRepository;
import lombok.extern.slf4j.Slf4j;
import com.project.samplingsystem.model.entity.NBParam;
import com.project.samplingsystem.model.entity.permission.NBSysMenu;
import com.project.samplingsystem.model.entity.permission.NBSysMenu.MenuType;
import com.project.samplingsystem.model.entity.permission.NBSysResource;
import com.project.samplingsystem.model.entity.permission.NBSysRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.core.annotation.Order;
import org.springframework.core.env.Environment;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.Optional;

import static com.project.samplingsystem.model.constant.SampleSystemConstant.Init.INIT_NOT;
import static com.project.samplingsystem.model.constant.SampleSystemConstant.Init.INIT_STATUS;
import static com.project.samplingsystem.model.entity.permission.NBSysMenu.MenuType.LEAF;
import static com.project.samplingsystem.model.entity.permission.NBSysMenu.MenuType.PARENT;

/**
 * created by Wuwenbin on 2018/8/1 at 20:25
 *
 * @author wuwenbin
 */
@Component
@Order(2)
@Slf4j
public class MenuListener implements ApplicationListener<ApplicationReadyEvent> {

    private final MenuRepository menuRepository;
    private final RoleRepository roleRepository;
    private final ResourceRepository resourceRepository;
    private final ParamRepository paramRepository;
    private final Environment environment;

    @Autowired
    public MenuListener(MenuRepository menuRepository, RoleRepository roleRepository,
                        ParamRepository paramRepository, ResourceRepository resourceRepository,
                        Environment environment) {
        this.menuRepository = menuRepository;
        this.roleRepository = roleRepository;
        this.paramRepository = paramRepository;
        this.resourceRepository = resourceRepository;
        this.environment = environment;
    }

    @Override
    public void onApplicationEvent(ApplicationReadyEvent event) {
        NBParam nbParam = paramRepository.findByName(INIT_STATUS);
        long cnt = menuRepository.count();
        long rootCnt = menuRepository.countByType(MenuType.ROOT.name());
        if (nbParam == null || StringUtils.isEmpty(nbParam.getValue())) {
            throw new RuntimeException("????????????????????????????????? init_status ?????????");
        } else if (nbParam.getValue().equals(INIT_NOT) && cnt == 1 && rootCnt == 1) {
            log.info("?????????????????????????????????...");
            Object[][] folderMenus = new Object[][]{
                    {"????????????", "layui-icon layui-icon-auz", new String[][]{
                            {"/management/menu", "????????????", "fa fa-list-ul"}
                            , {"/management/role", "????????????", "fa fa-user-o"}
                            , {"/management/users", "????????????", "fa fa-users"}
                    }},
                    {"????????????", "layui-icon layui-icon-edit", new String[][]{
                            {"/management/article/post", "????????????", "fa fa-send-o"}
                            , {"/management/note/post", "????????????", "fa fa-file-text-o"}
                    }},
                    {"????????????", "layui-icon layui-icon-template-1", new String[][]{
                            {"/management/article", "????????????", "fa fa-newspaper-o"}
                            , {"/management/note", "????????????", "fa fa-file-o"}
                    }},
                    {"????????????", "layui-icon layui-icon-read", new String[][]{
                            {"/management/dictionary/cate", "????????????", "fa fa-clone"}
                            , {"/management/dictionary/projectCate", "??????????????????", "fa fa-hdd-o"}
                            , {"/management/dictionary/cloudFileCate", "?????????????????????", "fa fa-hdd-o"}
                            , {"/management/dictionary/keyword", "???????????????", "fa fa-dot-circle-o"}
                            , {"/management/dictionary/tag", "????????????", "fa fa-tags"}
                    }},
                    {"????????????", "layui-icon layui-icon-set", new String[][]{
                            {"/management/settings/qrcode", "???????????????", "fa fa-qrcode"}
                            , {"/management/settings/common", "??????????????????", "fa fa-cogs"}
                            , {"/management/settings/theme", "??????????????????", "fa fa-cog"}
                            , {"/management/settings/profile", "????????????", "fa fa-address-card-o"}
                            , {"/management/settings/mail", "???????????????", "fa fa-server"}
                    }},
                    {"????????????", "layui-icon layui-icon-diamond", new String[][]{
                            {"/management/profile", "????????????", "fa fa-hdd-o"}
                            , {"/management/project", "??????????????????", "fa fa-laptop"}
                            , {"/management/cloudFile", "???????????????", "fa fa-file-archive-o"}
                    }}
                    ,
                    {"????????????", "layui-icon layui-icon-username", new String[][]{
                            {"/management/comment", "????????????", "fa fa-comments-o"}
                            , {"/management/message", "????????????", "fa fa-globe"}
                    }}
                    ,
                    {"????????????","layui-icon layui-icon-edit", new String[][]{
                            {"management/sample/page","????????????","fa fa-file-o"}
                    }}

            };

            setUpMenuSystem(folderMenus);

        }
//        hideAuthMenu();
        log.info("?????????????????????");
    }

    /**
     * ??????root ????????? id
     *
     * @return
     */
    private long findRootId() {
        return menuRepository.findByType(MenuType.ROOT).getId();
    }

    /**
     * ????????????
     *
     * @param icon
     * @param name
     * @param orderIndex
     * @param parentId
     * @param roleId
     * @param type
     * @return
     */
    private NBSysMenu fixMenu(String icon, String name, int orderIndex,
                              long parentId, long roleId, MenuType type) {
        return NBSysMenu.builder()
                .icon(icon)
                .name(name)
                .parentId(parentId)
                .type(type)
                .enable(true)
                .orderIndex(orderIndex)
                .roleId(roleId)
                .build();

    }

    /**
     * ?????????????????????
     */
    private void setUpMenuSystem(Object[][] folderMenus) {
        Optional<NBSysRole> role = roleRepository.findOne(Example.of(NBSysRole.builder().name("ROLE_MASTER").build()));
        long roleId = role.orElseThrow(() -> new RuntimeException("??????????????????ROLE_MASTER???")).getId();
        long rootId = findRootId();

        saveTopMenu("layui-icon layui-icon-console", "?????????", "/management/dashboard", rootId, roleId);

        for (int i = 0; i < folderMenus.length; i++) {
            Object[] parent = folderMenus[i];
            NBSysMenu parentMenu = fixMenu(parent[1].toString(), parent[0].toString(), i + 1, rootId, roleId, PARENT);
            NBSysMenu genMenuLoop = menuRepository.save(parentMenu);
            long genMenuId = genMenuLoop.getId();
            String[][] leafMenus = (String[][]) parent[2];
            for (int j = 0; j < leafMenus.length; j++) {
                String[] leafMenu = leafMenus[j];
                String url = leafMenu[0];
                NBSysMenu lm = fixMenu(leafMenu[2], leafMenu[1], j, genMenuId, roleId, LEAF);
                NBSysMenu genLeafMenu = menuRepository.save(lm);
                NBSysResource res = resourceRepository.findByUrl(url);
                menuRepository.updateResourceById(genLeafMenu.getId(), res.getName(), res);
            }
        }

    }

    /**
     * ????????????????????????
     */
    private void hideAuthMenu() {
        String[] menus = new String[]{
                "/management/menu",
                "/management/role",
                "/management/users"
        };
        boolean enable = environment.getProperty("noteblog.menu.auth", Boolean.class, false);
        for (String menu : menus) {
            NBSysResource r = resourceRepository.findByUrl(menu);
            NBSysMenu m = menuRepository.findByResourceId(r.getId());
            menuRepository.updateEnableById(enable, m.getId());
        }
        menuRepository.updateAuthParentMenu(enable);
    }


    /**
     * ????????????????????????
     *
     * @param icon
     * @param name
     * @param url
     * @param rootId
     * @param roleId
     */
    private void saveTopMenu(String icon, String name, String url, long rootId, long roleId) {
        NBSysMenu menu = fixMenu(icon, name, 0, rootId, roleId, PARENT);
        NBSysMenu genMenu = menuRepository.save(menu);
        NBSysResource genMenuRes = resourceRepository.findByUrl(url);
        menuRepository.updateResourceById(genMenu.getId(), genMenuRes.getName(), genMenuRes);
    }
}
