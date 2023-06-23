import request from '@/utils/request'

// 查询岗位列表
export function listJob(query) {
  return request({
    url: '/workstudy/job/list',
    method: 'get',
    params: query
  })
}

// 新增岗位
export function addJobs(data) {
    return request({
      url: '/workstudy/job',
      method: 'post',
      data: data
    })
  }