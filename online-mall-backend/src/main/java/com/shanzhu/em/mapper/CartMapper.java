package com.shanzhu.em.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shanzhu.em.entity.Cart;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 购物车 持久层（mapper）
 */
@Mapper
public interface CartMapper extends BaseMapper<Cart> {

    @MapKey("id")
    List<Map<String, Object>> selectByUserId(Long userId);
}
//该函数是一个Java接口，继承了BaseMapper<Cart>，用于操作数据库中的购物车信息。其中，@Mapper注解表示该接口是一个MyBatis的Mapper接口，用于和数据库进行交互。
//接口中定义了一个方法selectByUserId(Long userId)，用于根据用户ID查询购物车信息。该方法返回值为一个List<Map<String, Object>>，表示返回一个包含多个购物车信息的列表，每个购物车信息以Map的形式表示，其中Map的键为"id"，表示购物车的ID。
//在方法上使用了@MapKey("id")注解，表示将查询结果按照购物车的ID作为键进行映射，方便后续根据购物车ID快速查找购物车信息