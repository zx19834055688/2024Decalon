<!--
 * 用户注册页面
-->
<template>
  <div class="register-window">
    <div class="register-window-index">
      <div class="register-window-index-left">
        <img src="../resource/img/注册页面左.png">
      </div>
      <div class="register-window-index-right">
        <h2>注册账号</h2>
        <div class="register-window-index-right-textarea">
          <input v-model="user.username" type="text" placeholder="请输入账号">
          <input v-model="user.password" type="password" placeholder="请输入密码">
          <input v-model="user.confirmPassword" type="password" placeholder="请确认密码">
          <button class="button1" type="success" @click="onSubmit">注册</button>
          <button class="button2" @click="$router.push('/login')">返回</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import md5 from "js-md5";

export default {
  name: "Login",
  data(){
    return {
      user: {},
    }
  },
  methods: {
    onSubmit() {
      if(this.user.username==='' || this.user.password==='' ||this.user.confirmPassword===''){
        this.$message.error("账号或密码不能为空")
        return false;
      }
      if(this.user.password!==this.user.confirmPassword){
        this.$message.error("两次密码不一致")
        return false;
      }
      this.user.password = md5(this.user.password); //对输入的密码进行md5加密
      this.request.post("/register",this.user).then(res=>{
        if(res.code==='200'){
          this.$message.success("注册成功")
          this.$router.push("/login")
        }else{
          this.$message.error(res.msg)
        }
      })
    }
  }
}
</script>

<style scoped>
.register-window {
  width: 100%;
  height: 100%;
  background-color: rgba(255,255,255,1);
  display: flex;
  justify-content: center;
  align-items: center;
}

.register-window-index {
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
.register-window-index-right{

}
.register-window-index-right h2{
  font-size: 30px;
  margin-top: 70px;
}
.register-window-index-right-textarea{
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 30px;
}
.register-window-index-right-textarea input{
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
.register-window-index-right-textarea button{
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
.register-window-index-left{
  display: flex;
  align-items: center;
  overflow: hidden;
  border-top-left-radius: 30px;
  border-bottom-left-radius: 30px;
}
.register-window-index-left img{
  width: 100%;
  height: auto;
  object-fit: cover; /* 保持纵横比填充容器 */
}
</style>
