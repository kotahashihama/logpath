<template lang="pug">
  .wrapper
    button(@click="showMsg")
      | Hello
    | {{ msg }}aaba
</template>

<script>
export default {
  data: () => ({
    msg: ''
  }),

  methods: {
    showMsg () {
      this.$axios.$get('/api/v1/dones').then(res => (this.msg = res.msg))
    }
  }
}
</script>
