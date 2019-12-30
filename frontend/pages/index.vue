<template>
  <div>
    <button @click="showMsg">
      Hello
    </button>
    {{ msg }}
  </div>
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
