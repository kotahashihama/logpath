<template lang="pug">
.header
  .wrapper
    .logo Logpath
    |  {{ loginState }}
</template>

<script>
export default {
  computed: {
    loginState () {
      if (this.$store.state.isLoggedIn) {
        return 'ログイン中'
      } else {
        return 'ログアウト済'
      }
    }
  }
}
</script>>

<style lang="stylus" scoped>
.header
  padding 8px 0
  border-bottom solid 1px #6ebede
  background #77c9ea
.logo
  color #fff
  font-size 30px
  font-weight bold
</style>
