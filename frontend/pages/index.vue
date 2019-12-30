<template lang="pug">
  .wrapper
    ul(v-for="(done, index) in dones", :key="index")
      li {{ done.content }}
</template>

<script>
export default {
  data: () => ({
    dones: []
  }),

  mounted () {
    this.getDones()
  },

  methods: {
    getDones () {
      this.$axios.$get('/api/v1/dones').then((res) => {
        this.dones = res
      })
    }
  }
}
</script>
