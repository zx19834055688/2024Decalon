
<template>
<div>
<!--  轮播图-->
  <div>
    <el-carousel trigger="click" height="600px">
      <el-carousel-item v-for="item in 4" :key="item">
        <h3 class="small">{{ item }}</h3>
      </el-carousel-item>
    </el-carousel>
  </div>
<!--  商品分类列表-->
  <div class="block" style="margin-top: 100px; margin-left: 100px;">
    <h2>乐享运动</h2>
    <!--商品分类-->
    <div class="good-menu">
      <ul v-for="(item, index) in icons" :key="index">
        <li>

          <i class="iconfont" v-html="item.value"></i>

          <!--跳转到商品分类对应列表-->
          <span v-for="(category, index2) in item.categories" :key="index2">
                <router-link
                    :to="{
                    path: '/goodlist',
                    query: { categoryId: category.id },
                  }"
                >
                  <a href="/person"><span style="color: #3186cb">{{ category.name }}</span></a>
                </router-link>

                <span v-if="index2 != item.categories.length - 1">/</span>

              </span>

        </li>
      </ul>
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
