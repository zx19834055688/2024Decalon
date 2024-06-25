<!--
 * 用户登录页
 *
 * @Author: ZX
 * @Date: 2024-5-28
-->
<template>
 <div class="login-window">
   <div class="login-window-index">
     <div class="login-window-index-left">
       <h2>欢迎回来</h2>
       <h1>LOGO</h1>
       <div class="login-window-index-left-textarea">
          <input v-model="user.username" type="text" placeholder="请输入账号">
          <input v-model="user.password" type="password" placeholder="请输入密码">
          <button class="button1" type="success" @click="onSubmit">登录</button>
          <button class="button2" @click="$router.push('/register')">注册</button>
       </div>
     </div>
     <div class="login-window-index-right">
       <img src="../resource/img/登录页面右.png">
     </div>
   </div>
</div>
</template>

<script>
import md5 from 'js-md5'
export default {
  name: "Login",
  //初始化数据
  data(){
    return {
      to: '/',//登陆成功跳转的页面
      user: {},
      backgroundDiv: {
        backgroundImage:
            "url(" + require("@/resource/img/login_back.png") + ")",
        backgroundRepeat: "no-repeat",
        backgroundSize: "100% 100%",
      },
    }
  },
  //页面创建
  created() {
      this.to = this.$route.query.to ? this.$route.query.to : "/"
    },
  //方法
  methods: {
    //登录提交
    onSubmit() {
      if(this.user.username==='' || this.user.password===''){
        this.$message.error("账号或密码不能为空")
        return false;
      }
      this.user.password = md5(this.user.password);
      this.request.post("/login",this.user).then(res=>{
        console.log(res.data);
        if(res.code==='200'){
          this.$message.success({message: "登陆成功",showClose: true})
          // this.$message.success({message: res.data,showClose: true})
          this.$router.push(this.to)
          localStorage.setItem("user",JSON.stringify(res.data))
        }else{
          this.$message.error(res.msg)
        }
      })
    }
  }
}
</script>

<style scoped>
.login-window {
  width: 100%;
  height: 100%;
  background-color: rgba(255,255,255,1);
  display: flex;
  justify-content: center;
  align-items: center;
}

.login-window-index {
  width: 85%;
  height: 85%;
  line-height: 20px;
  border-radius: 30px;
  background-color: rgba(255,255,255,1);
  color: rgba(16,16,16,1);
  font-size: 14px;
  text-align: center;
  box-shadow: 5px 5px 11px 0px rgba(0,0,0,0.4);
  font-family: Roboto;
  border: 1px solid rgba(187,187,187,1);
  display: grid;
  grid-template-columns: 1fr 1fr; /* 这会创建两个等宽的列 */
  justify-content: space-between;
}
.login-window-index-left{

}
.login-window-index-left h2{
  margin-top: 70px;
}
.login-window-index-left-textarea{
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 30px;
}
.login-window-index-left-textarea input{
  width: 300px;
  height: 60px;
  line-height: 20px;
  border-radius: 50px;
  background-color: rgba(255,255,255,1);
  color: rgba(136,136,136,1);
  font-size: 14px;
  text-align: left;
  font-family: Microsoft Yahei;
  border: 1px solid rgba(187,187,187,1);
  padding: 10px; /* 可以调整这个值来设置边距的大小 */
  box-sizing: border-box; /* 确保边距和边框不会影响元素总宽度 */
}
.login-window-index-left-textarea button{
  width: 300px;
  height: 60px;
  left: 317px;
  top: 659px;
  line-height: 20px;
  border-radius: 50px;
  font-size: 20px;
  text-align: center;
  font-style: italic;
  border: 1px solid rgba(187,187,187,1);
}
.button1{
  margin-top: 30px;
  background-color: #DFE1F2;
  color: #323894;
}
.button2{
  background-color: #323894;
  color: #DFE1F2;
}
.button1:hover{
  background-color: #CFD1E2;
  color: #222884;
}
.button2:hover{
  background-color: #222884;
  color: #CFD1E2;
}
.button1:active{
  background-color: #DFE1F2;
  color: #323894;
}
.button2:active{
  background-color: #323894;
  color: #DFE1F2;
}
.login-window-index-right{
  display: flex;
  align-items: center;
  overflow: hidden;
  border-top-right-radius: 30px;
  border-bottom-right-radius: 30px;
}
.login-window-index-right img{
  width: 100%;
  height: auto;
  object-fit: cover; /* 保持纵横比填充容器 */
}
.title {
  text-align: center;
  margin: 30px auto;
  font-size: 25px;
}
</style>
