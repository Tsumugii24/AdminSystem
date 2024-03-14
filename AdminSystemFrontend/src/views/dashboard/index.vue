<!--<template>-->
<!--  <div class="dashboard-container">-->
<!--    <div class="dashboard-text">name: {{ name }}</div>-->
<!--  </div>-->
<!--</template>-->
<template>
  <div>
    <div class="welcome-message">Welcome Back, <span class="username">{{ username }}</span> !</div>
    <div class="explain-message">System Management Section is for Data Addition, Deletions, Modifications and Querying😄</div>
    <div class="explain-message">Test Module is reserved for future expanding👻</div>
    <div class="explain-message">Form Section and Nested Section are part of the original template, no business logic interactions now😂</div>
    <div class="explain-message">External Link can dive to Developer's GitHub Homepage🤗</div>
    <div class="current-time">Current Time Display 👉 {{ currentTime }}</div>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'Dashboard',
  data() {
    return {
      currentTime: null,
      intervalId: null
    }
  },
  computed: {
    ...mapState([
      'username'
    ])
  },
  mounted() {
    // Update time initially
    this.currentTime = this.getCurrentTime()

    // Set up interval for automatic updates (adjust interval as needed)
    this.intervalId = setInterval(() => {
      this.currentTime = this.getCurrentTime()
    }, 1000) // Update every second
  },
  beforeDestroy() {
    // Clear the interval when component is destroyed
    clearInterval(this.intervalId)
  },
  methods: {
    getCurrentTime() {
      // Get the current date and time
      const now = new Date()

      // Format the time as before
      return now.toLocaleString('zh-CN', {
        year: 'numeric',
        month: 'numeric',
        day: 'numeric',
        hour: 'numeric',
        minute: 'numeric',
        second: 'numeric',
        hour12: false // Use 24-hour format
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.dashboard {
  &-container {
    margin: 30px;
  }
  &-text {
    font-size: 30px;
    line-height: 46px;
  }
}
.welcome-message {
  text-align: center;
  font-size: 24px;
  font-weight: bold;
  color: #333;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin-top: 100px;
}
.explain-message {
  text-align: left;
  font-size: 20px;
  font-weight: bold;
  color: #338bc6;
  padding: 18px;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin-top: 10px;
}
.current-time {
  text-align: center;
  font-size: 16px;
  font-weight: bold;
  color: #999;
  margin-top: 150px; /* Add some margin from above content */
}
.username {
  font-size: 30px;
  font-weight: bold;
  color: slateblue;
  text-align: center;
}

</style>
