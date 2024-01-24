// interceptors.ts
import { AxiosRequestConfig, AxiosResponse } from '@ohos/axios';
import GlobalData from '../../GlobalData';

const addInterceptors = (axios: any) => {
  // 添加请求拦截器
  axios.interceptors.request.use(requestInterceptor, requestInterceptorError);
  // 添加响应拦截器
  axios.interceptors.response.use(responseInterceptor, responseInterceptorError);
};

export const requestInterceptor = (config: AxiosRequestConfig) => {
  // 在发送请求之前做些什么，例如添加 token 到 headers
  const toke = GlobalData.getInstance().get(GlobalData.KEY_TOKEN);
  if (toke) {
    config.headers.Authorization = `Bearer ${toke}`;
  }
  return config;
};

export const requestInterceptorError = (error: any) => {
  // 对请求错误做些什么
  return Promise.reject(error);
};

export const responseInterceptor = (response: AxiosResponse) => {
  // 对响应数据做点什么，例如根据状态码进行处理
  if (response.status === 200) {
    return response.data;
  } else {
    // 可以在这里添加你的错误处理
    return Promise.reject(response);
  }
};

export const responseInterceptorError = (error: any) => {
  // 对响应错误做点什么
  return Promise.reject(error);
};