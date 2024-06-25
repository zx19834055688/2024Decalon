package com.shanzhu.em.entity.vo;

import lombok.Data;

/**
 * 用户信息
 *
 * @author: ZX
 * @date: 2024-6-12
 */
@Data
public class UserVo {

    /**
     * 用户id
     */
    private int id;

    /**
     * 用户名
     */
    private String username;

    /**
     * 用户昵称
     */
    private String nickname;

    /**
     * 头像
     */
    private String avatarUrl;

    /**
     * token
     */
    private String token;

    /**
     * 角色
     */
    private String role;

}
