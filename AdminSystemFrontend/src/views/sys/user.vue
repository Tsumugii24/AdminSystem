<template>
  <div>
    <!-- 搜索栏 -->
    <el-card id="search">
      <el-row>
        <el-col :span="20">
          <el-input v-model="searchModel.username" placeholder="UseName" clearable></el-input>
          <el-input v-model="searchModel.phone" placeholder="PhoneNumber" clearable></el-input>
          <el-button @click="getUserList" type="primary" round icon="el-icon-search">search</el-button>
        </el-col>
        <el-col :span="4" align="right">
          <el-button @click="openEditUI(null)" type="primary" icon="el-icon-plus" circle></el-button>
        </el-col>
      </el-row>
    </el-card>

    <!-- 结果列表 -->
    <el-card>
      <el-table
        :data="userList"
        style="width: 100%">
        <el-table-column
          label="#"
          width="80">
          <template slot-scope="scope">
            <!-- (pageNo - 1) * pageSize + index + 1 -->
            {{(searchModel.pageNo-1) * searchModel.pageSize + scope.$index + 1}}
          </template>
        </el-table-column>
        <el-table-column
          prop="id"
          label="UID"
          width="100">
        </el-table-column>
        <el-table-column
          prop="username"
          label="UserName"
          width="180">
        </el-table-column>
        <el-table-column
          prop="phone"
          label="PhoneNumber"
          width="180">
        </el-table-column>
        <el-table-column
          prop="status"
          label="Status"
          width="100">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.status == 1">Normal</el-tag>
            <el-tag v-if="scope.row.status == 0" type="danger">Danger</el-tag>
          </template>
        </el-table-column>
        <el-table-column
          prop="email"
          label="Email Address">
        </el-table-column>
        <el-table-column
          label="Operation"
          width="180">
          <template slot-scope="scope">
            <el-button @click="openEditUI(scope.row.id)" type="primary" icon="el-icon-edit" size="mini" circle></el-button>
            <el-button @click="deleteUser(scope.row)" type="danger" icon="el-icon-delete" size="mini" circle></el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
    <!-- 分页组件 -->
    <el-pagination
      :current-page="searchModel.pageNo"
      :page-sizes="[5, 10, 20, 50]"
      :page-size="searchModel.pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="total"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange">
    </el-pagination>
    <!-- 用户信息编辑对话框 -->
    <el-dialog @close="clearForm" :title="title" :visible.sync="dialogFormVisible">
      <el-form :model="userForm" ref="userFormRef" :rules="rules">
        <el-form-item label="UserName" prop="username" :label-width="formLabelWidth">
          <el-input v-model="userForm.username" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item v-if="userForm.id == null || userForm.id == undefined" label="Password" prop="password" :label-width="formLabelWidth">
          <el-input type="password" v-model="userForm.password" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="PhoneNumber" prop="phone" :label-width="formLabelWidth">
          <el-input v-model="userForm.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="Status" :label-width="formLabelWidth">
          <el-switch
            v-model="userForm.status"
            :active-value = "1"
            :inactive-value = "0"
          >
          </el-switch>
        </el-form-item>
        <el-form-item label="Email Address" prop="email" :label-width="formLabelWidth">
          <el-input v-model="userForm.email" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">Cancel</el-button>
        <el-button type="primary" @click="saveUser">Apply</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import userApi from '@/api/userManage'
import user from '@/store/modules/user'
export default {
  computed: {
    user() {
      return user
    }
  },
  data() {
    const checkEmail = (rule, value, callback) => {
      const reg = /^[\w\.-]+@[\w\.-]+\.\w+$/
      if (!reg.test(value)) {
        return callback(new Error('The mailbox format is incorrect'))
      }
      callback()
    }
    return {
      formLabelWidth: '130px',
      userForm: {},
      dialogFormVisible: false,
      title: '',
      total: 0,
      searchModel: {
        pageNo: 1,
        pageSize: 10
      },
      userList: [],
      rules: {
        username: [
          { required: true, message: 'Please enter a username', trigger: 'blur' },
          { min: 1, max: 20, message: 'The length should be between 1 and 20 characters', trigger: 'blur' }
        ],
        password: [
          { required: true, message: 'Please enter an initial password', trigger: 'blur' },
          { min: 6, max: 20, message: 'The length should be between 6 and 20 characters', trigger: 'blur' }
        ],
        phone: [
          { required: true, message: 'Please enter a phone number', trigger: 'blur' },
          { min: 11, max: 11, message: 'The length should be 11 characters', trigger: 'blur' }
        ],
        email: [
          { required: true, message: 'Please enter an email address', trigger: 'blur' },
          { validator: checkEmail, trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    deleteUser(user) {
      this.$confirm(`Do you confirm to delete this user and its data ${user.username} ?`, '提示', {
        confirmButtonText: 'Confirm',
        cancelButtonText: 'Cancel',
        type: 'warning'
      }).then(() => {
        userApi.deleteUserById(user.id).then(response => {
          this.$message({
            type: 'success',
            message: response.message
          })
          this.getUserList()
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: 'The delete operation has been canceled'
        })
      })
    },
    saveUser() {
      // 触发表单验证
      this.$refs.userFormRef.validate((valid) => {
        if (valid) {
          // 提交请求给后台
          userApi.saveUser(this.userForm).then(response => {
            // 成功提示
            this.$message({
              message: response.message,
              type: 'success'
            })
            // 关闭对话框
            this.dialogFormVisible = false
            // 刷新表格显示
            this.getUserList()
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    clearForm() {
      this.userForm = {}
      this.$refs.userFormRef.clearValidate()
    },
    openEditUI(id) {
      if (id == null) {
        this.title = 'Add New User Information'
      } else {
        this.title = 'Update User Information'
        // 根据id查询用户数据
        userApi.getUserById(id).then(response => {
          this.userForm = response.data
        })
      }
      this.dialogFormVisible = true
    },
    handleSizeChange(pageSize) {
      this.searchModel.pageSize = pageSize
      this.getUserList()
    },
    handleCurrentChange(pageNo) {
      this.searchModel.pageNo = pageNo
      this.getUserList()
    },
    getUserList() {
      userApi.getUserList(this.searchModel).then(response => {
        this.userList = response.data.rows
        this.total = response.data.total
      })
    }
  },
  created() {
    this.getUserList()
  }
}
</script>

<style>
#search .el-input {
  width: 200px;
  margin-right: 15px;
}
.el-dialog .el-input{
  width: 85%
}
</style>
