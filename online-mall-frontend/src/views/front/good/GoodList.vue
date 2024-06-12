<!--
 * 商品列表
 *
-->
<template>
  <div>
    <div class="left-box">

      <h2>商品分类</h2>
      <el-tree

      />
    </div>
    <div class="right-box">

    </div>
  </div>
</template>

<script>
import search from "../../../components/Search";
export default {
  name: "GoodList",
  data() {
    return {
      //分类icon，每个icon包含id、value、categories对象数组.category：id，name
      icons: [],
      total: 0,
      pageSize: 9,
      currentPage: 1,
      //选择的分类
      categoryId: Number,
      //搜索的内容
      searchText: "",
      good: [],
      baseApi: this.$store.state.baseApi,
    };
  },
  components: {
    search,
  },
  created() {
    //二者一般不同时存在
    this.searchText = this.$route.query.searchText;
    this.categoryId = this.$route.query.categoryId;

    this.loadCategories();
    this.load();
  },
  methods: {
    loadCategories() {
      this.request.get("/api/icon").then((res) => {
        if (res.code === "200") {
          this.icons = res.data;
        }
      });
    },
    handleCurrentPage(currentPage) {
      this.currentPage = currentPage;
      this.load();
    },
    handleSearch(text) {
      this.searchText = text;
      this.load();
    },
    load(categoryId) {
      if (categoryId != undefined) {
        this.categoryId = categoryId;

        this.$router.push({
          path: "/goodlist",
          query: { categoryId: this.categoryId },
        });
      }
      this.request
        .get("/api/good/page", {
          params: {
            pageNum: this.currentPage,
            pageSize: this.pageSize,
            searchText: this.searchText,
            categoryId: this.categoryId,
          },
        })
        .then((res) => {
          if (res.code === "200") {
            this.total = res.data.total;
            this.good = res.data.records;
          }
        });
    },
  },
};

</script>

<style scoped>


.black {
  color: black;
}

.grey {
  color: grey;
}
</style>
