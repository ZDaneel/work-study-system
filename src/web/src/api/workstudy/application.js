import request from '@/utils/request'

// 查询候选名单列表
export function listCandidate(query) {
    return request({
      url: '/workstudy/application/candidate-list',
      method: 'get',
      params: query
    })
  }