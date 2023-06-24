import request from "@/utils/request";

// 查询候选名单列表
export function listCandidate(query) {
  return request({
    url: "/workstudy/application/candidate-list",
    method: "get",
    params: query,
  });
}

// 新增用工计划
export function addApplication(data) {
  return request({
    url: "/workstudy/application",
    method: "post",
    data: data,
  });
}
