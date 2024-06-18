package com.shanzhu.em.config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Mybatis - plus 配置
 *
 * 什么是MybatisPlus? （https://blog.csdn.net/qq_52922453/article/details/127196313）
 *
 */
@Configuration
public class MybatisPlusConfig {

    /**
     * 分页插件配置
     *
     * @return MybatisPlusInterceptor
     * 拦截器截取数据
     */
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
        return interceptor;
    }
}
