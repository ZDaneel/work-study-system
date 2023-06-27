import request from '@/utils/request'

// 查询学生申请列表
export function listStudent(query) {
  return request({
    url: '/workstudy/student/list',
    method: 'get',
    params: query
  })
}

// 查询学生申请详细
export function getStudent(id) {
  return request({
    url: '/workstudy/student/' + id,
    method: 'get'
  })
}

// 新增学生申请
export function addStudent(data) {
  return request({
    url: '/workstudy/student',
    method: 'post',
    data: data
  })
}

// 修改学生申请
export function updateStudent(data) {
  return request({
    url: '/workstudy/student',
    method: 'put',
    data: data
  })
}

// 删除学生申请
export function delStudent(id) {
  return request({
    url: '/workstudy/student/' + id,
    method: 'delete'
  })
}

// 获取学生对岗位的意向
export function getStudentIntention() {
  return request({
    url: '/workstudy/student/intention',
    method: 'get'
  })
}