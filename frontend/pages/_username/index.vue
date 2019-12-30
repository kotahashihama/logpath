<template lang="pug">
  .wrapper
    | {{ username }}
</template>

<script>
export default {
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
      })
    }
  }
}
</script>
