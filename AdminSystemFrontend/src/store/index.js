import Vue from 'vue'
import Vuex from 'vuex'
import getters from './getters'
import app from './modules/app'
import settings from './modules/settings'
import user from './modules/user'
import tagsView from './modules/tagsView'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    app,
    settings,
    user,
    tagsView
  },
  state: {
    username: localStorage.getItem('username') || '' // 通过 localStorage 获取 username
  },
  mutations: {
    setUsername(state, username) {
      state.username = username
      localStorage.setItem('username', username) // 将 username 存储在 localStorage 中
    }
  },
  getters
})

export default store

