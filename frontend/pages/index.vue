<template lang="pug">
.wrapper
  input(v-model="newDone")
  button(@click="createDone") 投稿
  div(v-if="isEditing")
    input(v-model="editingDone")
    button(@click="updateDone") 更新
  p プレビュー
  | {{ newDone }}
  p 一覧
  ul(v-for="(done, index) in dones", :key="index")
    li {{ done.content }}
      button(@click="editDone(done)") 編集
      button(@click="destroyDone(done.id)") 削除
</template>

<script>
export default {
  head () {
    return {
      title: 'ホーム'
    }
  },

  data: () => ({
    isEditing: false,
    editingDone: '',
    editingDoneId: 0,
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
    editDone (done) {
      this.isEditing = true
      this.editingDone = done.content
      this.editingDoneId = done.id
    },

    updateDone () {
      const params = {
        content: this.editingDone
      }

      this.$axios.$patch(`/api/v1/dones/${this.editingDoneId}`, params).then((res) => {
        this.getDones()
        this.isEditing = false
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
