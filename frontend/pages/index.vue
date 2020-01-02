<template lang="pug">
.index(v-if="$store.state.isLoggedIn")
  .wrapper
    button(@click="logoutUser") ログアウト

    input(v-model="newTask")
    button(@click="createTask") 投稿
    div(v-if="isEditing")
      input(v-model="editingTask")
      button(@click="updateTask") 更新
    p プレビュー
    | {{ newTask }}
    p 一覧
    ul(v-for="(task, index) in tasks", :key="index")
      li {{ task.content }}
        button(@click="editTask(task)") 編集
        button(@click="destroyTask(task.id)") 削除
    button(@click="getTasks") Task一覧を取得

Registration(v-else)
</template>

<script>
import Registration from '@/components/molecules/IndexRegistration'

export default {
  components: {
    Registration
  },

  head () {
    return {
      title: 'ホーム'
    }
  },

  data: () => ({
    isEditing: false,
    editingTask: '',
    editingTaskId: 0,
    newTask: '',
    tasks: []
  }),

  mounted () {
    this.getTasks()
  },

  methods: {
    getTasks () {
      this.$axios.$get('/api/v1/tasks').then((res) => {
        this.tasks = res
      })
    },
    createTask () {
      const params = {
        content: this.newTask
      }

      this.$axios.$post('/api/v1/tasks', params).then((res) => {
        this.getTasks()
      })
    },
    editTask (task) {
      this.isEditing = true
      this.editingTask = task.content
      this.editingTaskId = task.id
    },
    updateTask () {
      const params = {
        content: this.editingTask
      }

      this.$axios.$patch(`/api/v1/tasks/${this.editingTaskId}`, params).then((res) => {
        this.getTasks()
        this.isEditing = false
      })
    },
    destroyTask (id) {
      const result = confirm('削除してもよろしいですか？')

      if (result) {
        this.$axios.$delete(`/api/v1/tasks/${id}`).then((res) => {
          this.getTasks()
        })
      }
    },

    logoutUser () {
      localStorage.removeItem('requestHeader')
      this.$store.commit('logout')
    }
  }
}
</script>
