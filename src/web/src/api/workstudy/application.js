import request from "@/utils/request";

// 查询候选名单列表
export function listCandidate(query) {
  return request({
    url: "/workstudy/application/candidate-list",
    method: "get",
    params: query,
  });
}

// 新增合同信息
export function addApplication(data) {
  return request({
    url: "/workstudy/application",
    method: "post",
    data: data,
  });
}

// 查询合同列表
export function listApplied(query) {
  return request({
    url: "/workstudy/application/applied-list",
    method: "get",
    params: query,
  });
}

// 查询合同详细
export function getApplication(id) {
  return request({
    url: '/workstudy/application/' + id,
    method: 'get'
  })
}

// 修改合同状态
export function terminateApplication(data) {
  return request({
    url: '/workstudy/application',
    method: 'put',
    data: data
  })
}