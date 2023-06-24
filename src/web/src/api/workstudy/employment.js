import request from '@/utils/request'

// 查询用工计划列表
export function listEmployment(query) {
  return request({
    url: '/workstudy/employment/list',
    method: 'get',
    params: query
  })
}

// 查询用工计划详细
export function getEmployment(id) {
  return request({
    url: '/workstudy/employment/' + id,
    method: 'get'
  })
}

// 新增用工计划
export function addEmployment(data) {
  return request({
    url: '/workstudy/employment',
    method: 'post',
    data: data
  })
}

// 修改用工计划
export function updateEmployment(data) {
  return request({
    url: '/workstudy/employment',
    method: 'put',
    data: data
  })
}

// 删除用工计划
export function delEmployment(id) {
  return request({
    url: '/workstudy/employment/' + id,
    method: 'delete'
  })
}

// 查询所有有效的用工计划和岗位列表
export function listAllValidEmployment() {
  return request({
    url: '/workstudy/employment/list-all-valid',
    method: 'get',
  })
}