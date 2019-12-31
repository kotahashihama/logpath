<template lang="pug">
.index-registration
  form(@submit.prevent="createUser")
    input(type="text", placeholder="名前", v-model="newUser.name")
    input(type="email", placeholder="メールアドレス", v-model="newUser.email")
    input(type="password", placeholder="パスワード", v-model="newUser.password")
    button(type="submit") 新規登録
</template>

<script>
export default {
  data: () => ({
    newUser: {
      name: '',
      email: '',
      password: ''
    }
  }),

  methods: {
    createUser () {
      const params = this.newUser

      this.$axios.$post('/api/v1/auth', params).then((res) => {
        console.log(res)
      })
    }
  }
}
</script>
