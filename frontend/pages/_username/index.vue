<template lang="pug">
.wrapper
  | {{ username }}
</template>

<script>
export default {
  head () {
    return {
      title: this.username
    }
  },

  data: () => ({
    username: ''
  }),

  mounted () {
    this.getUser()
  },

  methods: {
    getUser () {
      this.$axios.$get(`/api/v1/users/${this.$route.params.username}`).then((res) => {
        this.username = res.username
      }).catch((err) => {
        return this.$nuxt.error({
          statusCode: err.response.status,
          message: err.response.message
        })
      })
    }
  }
}
</script>
