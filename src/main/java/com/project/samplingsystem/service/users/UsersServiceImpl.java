package com.project.samplingsystem.service.users;

import com.project.samplingsystem.dao.repository.RoleRepository;
import com.project.samplingsystem.dao.repository.UserRepository;
import com.project.samplingsystem.dao.repository.UserRoleRepository;
import com.project.samplingsystem.model.constant.SampleSystemConstant;
import com.project.samplingsystem.model.entity.permission.NBSysUser;
import com.project.samplingsystem.model.entity.permission.NBSysUserRole;
import com.project.samplingsystem.model.entity.permission.pk.UserRoleKey;
import com.project.samplingsystem.model.pojo.framework.NBR;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.transaction.Transactional;
import java.util.Date;

/**
 * created by Wuwenbin on 2018/7/29 at 1:06
 *
 * @author wuwenbin
 */
@Service
@Transactional(rollbackOn = Exception.class)
public class UsersServiceImpl implements UsersService {

    private final UserRepository userRepository;
    private final UserRoleRepository userRoleRepository;
    private final RoleRepository roleRepository;

    @Autowired
    public UsersServiceImpl(UserRepository userRepository, UserRoleRepository userRoleRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.userRoleRepository = userRoleRepository;
        this.roleRepository = roleRepository;
    }

    @Override
    public Page<NBSysUser> findUserPage(Pageable pageable, NBSysUser user) {
        if (StringUtils.isEmpty(user.getNickname()) && StringUtils.isEmpty(user.getUsername())) {
            return userRepository.findAll(pageable);
        } else {
            Example<NBSysUser> userExample = Example.of(
                    NBSysUser.builder()
                            .nickname(user.getNickname() == null ? "" : user.getNickname())
                            .username(user.getUsername() == null ? "" : user.getUsername())
                            .build(),
                    ExampleMatcher.matching()
                            .withMatcher("nickname", ExampleMatcher.GenericPropertyMatcher::contains)
                            .withMatcher("username", ExampleMatcher.GenericPropertyMatcher::contains)
                            .withIgnorePaths("enable", "defaultRoleId", "create")
                            .withIgnoreCase());
            return userRepository.findAll(userExample, pageable);
        }
    }

    @Override
    public void updateUserRoleIds(Long userId, String roleIds) {
        userRoleRepository.deleteRolesByUserId(userId);
        String[] roleIdArray = roleIds.split(",");
        for (String roleId : roleIdArray) {
            long rId = Long.parseLong(roleId);
            UserRoleKey urk = new UserRoleKey();
            urk.setUserId(userId);
            urk.setRoleId(rId);
            NBSysUserRole ur = NBSysUserRole.builder().pk(urk).build();
            userRoleRepository.saveAndFlush(ur);
        }
    }

    @Override
    public void updateUserRolesStr(Long userId, String roleNames) {
        userRoleRepository.deleteRolesByUserId(userId);
        String[] roleNameArray = roleNames.split(",");
        for (String roleName : roleNameArray) {
            long rId = roleRepository.findByName(roleName).getId();
            UserRoleKey urk = new UserRoleKey();
            urk.setUserId(userId);
            urk.setRoleId(rId);
            NBSysUserRole ur = NBSysUserRole.builder().pk(urk).build();
            userRoleRepository.saveAndFlush(ur);
        }
    }

    @Override
    public NBR createUser(NBSysUser user) {
        if (org.springframework.util.StringUtils.isEmpty(user.getPassword())) {
            return NBR.error("密码格式错误！");
        }
        else {
            NBSysUser u = userRepository.findByAccountNo(user.getAccountNo());
            if (u != null) {
                return NBR.error("用户账号已存在！");
            } else {
                user.setEnable(true);
                user.setCreate(new Date());
                userRepository.save(user);
                return NBR.ok("新建用户成功！");
            }
        }
    }
}
