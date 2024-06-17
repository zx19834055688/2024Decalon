package com.shanzhu.em.interceptor;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.shanzhu.em.constants.RedisConstants;
import com.shanzhu.em.constants.Status;
import com.shanzhu.em.entity.User;
import com.shanzhu.em.exception.BizException;
import com.shanzhu.em.utils.UserHolder;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.TimeUnit;

/**
 * jwt拦截器
 *
 * 处理token检验等
 *
 */
@Component
public class JwtInterceptor implements HandlerInterceptor {

    @Resource
    RedisTemplate<String, User> redisTemplate;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        String token = request.getHeader("token");
        //如果不是映射到方法，直接通过。
        //这里的“映射到方法”指的是在Web框架（如Spring MVC）中，一个请求通常会被映射到一个特定的方法上进行处理，这个方法封装在HandlerMethod类中。
        if(!(handler instanceof HandlerMethod)){
            return true;
        }
        //验证是否有token
        if(!StringUtils.hasLength(token)){
            throw  new BizException(Status.TOKEN_ERROR,"token失效,请重新登陆");
        }
        //通过token，将redis中的user存到threadlocal（UserHolder）
        User user = redisTemplate.opsForValue().get(RedisConstants.USER_TOKEN_KEY + token);

        if(user == null){
            throw  new BizException(Status.TOKEN_ERROR,"token失效,请重新登陆");
        }
        UserHolder.saveUser(user);
        //重置过期时间
        redisTemplate.expire(RedisConstants.USER_TOKEN_KEY +token, RedisConstants.USER_TOKEN_TTL, TimeUnit.MINUTES);

        //验证token
        JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(user.getUsername())).build();
        try {
            jwtVerifier.verify(token);
        }catch (JWTVerificationException e){
            throw new BizException(Status.TOKEN_ERROR,"token验证失败，请重新登陆");
        }

        return true;
    }
}
//拦截器功能的详细分解：
//组件注解:
//使用@Component注解，使得Spring框架能够自动发现并管理这个Bean。
//引入了RedisTemplate依赖，用于操作Redis数据库，特别是存储和检索与用户身份验证相关的数据。
//预处理请求方法 (preHandle):
//请求处理判断: 检查传入的handler是否为HandlerMethod实例，即判断请求是否映射到一个具体的处理方法。如果不是，则直接放行，返回true。
//Token提取与验证:
//从HTTP请求头中提取名为"token"的字段值作为JWT令牌。
//判断token是否存在，若不存在，则抛出BizException异常，状态码为TOKEN_ERROR，提示用户token已失效需重新登录。
//用户信息加载:
//使用从请求头获取的token作为键，在Redis中查找对应的用户信息（User对象），键的格式为RedisConstants.USER_TOKEN_KEY + token。
//若Redis中找不到对应用户信息，则同样抛出BizException异常，指示token失效。
//找到用户信息后，利用UserHolder工具类将其保存至线程局部变量中，便于后续业务逻辑中直接使用用户信息。
//刷新token有效期:
//通过redisTemplate.expire方法更新token在Redis中的过期时间，延长其有效时长，参数包括键、过期时间（来自RedisConstants.USER_TOKEN_TTL）以及时间单位（分钟）。
//JWT令牌验证:
//构建一个JWT验证器JWTVerifier，使用HMAC256算法和用户名作为密钥对token进行校验。
//尝试验证token，如果验证过程中捕获到JWTVerificationException异常，说明token无效或被篡改，此时抛出BizException，提示用户token验证失败。
//结果返回:
//如果上述所有验证步骤均通过，表明请求携带的token合法且用户身份已成功验证，函数最终返回true，允许请求继续向目标处理器方法传递。
//综上所述，此JwtInterceptor拦截器实现了对HTTP请求中携带的JWT令牌的全面验证流程，包括token的存在性检查、用户信息的Redis缓存读取、token有效期的动态管理，以及严格的JWT令牌内容验证，是保障系统接口安全的重要防线。