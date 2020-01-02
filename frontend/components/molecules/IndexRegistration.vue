<template lang="pug">
.index-registration
  form(@submit.prevent="createUser")
    input(type="text", placeholder="名前", v-model="newUser.name")
    input(type="email", placeholder="メールアドレス", v-model="newUser.email")
    input(type="password", placeholder="パスワード", v-model="newUser.password")
    button(type="submit") 新規登録

  form(@submit.prevent="loginUser")
    input(type="email", placeholder="メールアドレス", v-model="existingUser.email")
    input(type="password", placeholder="パスワード", v-model="existingUser.password")
    button(type="submit") ログイン

  button(@click="logoutUser") ログアウト
</template>

<script>
export default {
  data: () => ({
    newUser: {
      name: '',
      email: '',
      password: ''
    },
    existingUser: {
      email: '',
      password: ''
    }
  }),

  methods: {
    createUser () {
      const params = this.newUser

      this.$axios.$post('/api/v1/auth', params)
    },
    loginUser () {
      const params = this.existingUser

      this.$axios.post('/api/v1/auth/sign_in', params).then((res) => {
        const requestHeaderByResponse = {
          'access-token': res.headers['access-token'],
          client: res.headers.client,
          uid: res.headers.uid
        }
        localStorage.setItem('requestHeader', JSON.stringify(requestHeaderByResponse))
        this.$store.commit('login')
      })
    },
    logoutUser () {
      localStorage.removeItem('requestHeader')
      this.$store.commit('logout')
    }
  }
}
</script>
