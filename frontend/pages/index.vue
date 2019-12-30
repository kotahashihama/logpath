<template lang="pug">
  .wrapper
    input(v-model="newDone")
    button(@click="createDone") 投稿
    p プレビュー
    | {{ newDone }}
    p 一覧
    ul(v-for="(done, index) in dones", :key="index")
      li {{ done.content }}
        button(@click="destroyDone(done.id)") 削除
</template>

<script>
export default {
  data: () => ({
    newDone: '',
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
    },
    createDone () {
      const params = {
        content: this.newDone
      }

      this.$axios.$post('/api/v1/dones', params).then((res) => {
        this.getDones()
      })
    },
    destroyDone (id) {
      this.$axios.$delete(`/api/v1/dones/${id}`).then((res) => {
        this.getDones()
      })
    }
  }
}
</script>
