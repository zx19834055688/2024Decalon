
<template>
<div>
<!--  轮播图-->
  <div>
    <el-carousel trigger="click" height="600px">
      <el-carousel-item v-for="carousel in carousels" :key="carousel.id">
        <img style="height: 600px; width: fit-content"
             :src="baseApi + carousel.img"
        />
      </el-carousel-item>
    </el-carousel>
  </div>
<!--  商品分类列表-->
  <div class="block" style="margin-top: 50px; margin-left: 100px; margin-right: 100px;">
    <h2>乐享运动</h2>
    <!--商品分类-->
    <div style="margin: 20px auto">

      <el-row :gutter="20">
        <el-col :span="6" v-for="item in firstIconItems" :key="item.id">
          <el-card>
            <img
                :src="baseApi + item.imgs"/>
            <h1>{{item.name}}</h1>
          </el-card>
        </el-col>
<!--        <el-col-->
<!--            :span="6"-->
<!--            v-for="good in good"-->
<!--            :key="good.id"-->
<!--            style="margin-bottom: 20px"-->
<!--        >-->

<!--          <router-link :to="'goodview/' + good.id">-->

<!--            <el-card :body-style="{ padding: '0px', background: '#3472a6' }">-->
<!--              <img-->
<!--                  :src="baseApi + good.imgs"-->
<!--                  style="width: 100%; height: 300px"-->
<!--              />-->
<!--              <div style="padding: 5px 10px">-->
<!--                &lt;!&ndash;商品名称&ndash;&gt;-->
<!--                <span style="font-size: 18px; color: #ffffff">{{ good.name }}</span><br/>-->
<!--                &lt;!&ndash;商品价格&ndash;&gt;-->
<!--                <span style="color: #ffffff; font-size: 15px">￥{{ good.price }}</span>-->
<!--              </div>-->
<!--            </el-card>-->

<!--          </router-link>-->

<!--        </el-col>-->
      </el-row>

    </div>
  </div>
<!--  关于-->
  <div class="block" style="margin-top: 100px; margin-left: 100px;">
    <h2>关于迪卡侬</h2>
  </div>
</div>
</template>

<script>
import search from "../../components/Search";
export default {
  name: "TopView",
  //页面初始化数据
  data() {
    return {
      //轮播图
      carousels: [],
      //推荐商品
      good: [],
      baseApi: this.$store.state.baseApi,

      //分类icon，每个icon包含id、value、categories对象数组.category：id，name
      icons: [],
      //搜索内容
      searchText: "",
      // baseApi: this.$store.state.baseApi,
      message: ''
    };
  },
  mounted() {
    const hello = 'Hello World!'
    debugger
    this.message = hello
  },
  components: {
    search,
  },
  //页面创建
  created() {
    this.request.get("/api/good").then((res) => {
      if (res.code === "200") {
        this.good = res.data;
      } else {
        this.$message.error(res.msg);
      }
    });
    this.request.get("/api/icon").then((res) => {
      if (res.code === "200") {
        this.icons = res.data;
        if(this.icons.length > 6) {
          // 截取前六个分类
          this.icons = this.icons.slice(0, 6);
        }
      }
    });
    this.request.get("/api/carousel").then((res) => {
      if (res.code === "200") {
        this.carousels = res.data;
      }
    });
  },
  computed:{
    firstIconItems(){
      console.log(this.icons[0])
      return this.icons[0]?.categories || [];// 使用可选链操作符以避免潜在的null
    }
  },
  //方法
  methods: {
    //搜索按钮触发
    handleSearch(text) {
      this.searchText = text;
      this.$router.push({
        path: "/goodList",
        query: { searchText: this.searchText },
      });
    },

  },
};

</script>

<style scoped>
.el-carousel__item h3 {
  text-align: center;
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 600px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n+1) {
  background-color: #d3dce6;
}
.block{
  width: fit-content;
}
.good-menu {
  float: left;
  height: 370px;
  margin-right: 130px;
}
.good-menu li {
  list-style: none;
  overflow: hidden;
  margin-bottom: 35px;
}
.good-menu li a,
span {
  font-size: 20px;
  color: #6c6969;
}
.good-menu a span:hover {
  color: #00b7ff;
}
</style>
