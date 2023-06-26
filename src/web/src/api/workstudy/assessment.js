import request from "@/utils/request";

// 查询考核列表
export function listAssessment(query) {
  return request({
    url: "/workstudy/assessment/list",
    method: "get",
    params: query,
  });
}

// 新增考核列表
export function addAssessment(data) {
  return request({
    url: '/workstudy/assessment',
    method: 'post',
    data: data
  })
}