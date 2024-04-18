import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/Home.vue'
import RefvsReactive from '@/views/RefvsReactive.vue'
import Search from '@/views/Search.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/RefvsReactive',
    name: 'ref-vs-reactive',
    component: RefvsReactive
  },
  {
    path: '/Search',
    name: 'search',
    component: Search
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
