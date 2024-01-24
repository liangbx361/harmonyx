import http from '@ohos.net.http';
import axios, { AxiosInstance } from '@ohos/axios';
import User from '../../models/remote/User';
import ApiPath from './ApiPath';

export interface UserApi {
  loginByAccount(account: string, password: string): Promise<User>;
}

export class UserApiImpl implements UserApi {
  private axios: AxiosInstance;

  constructor(axios: AxiosInstance) {
    this.axios = axios;
  }

  loginByAccount(account: string, password: string): Promise<User> {
    return this.axios.post(ApiPath.USER_LOGIN_ACCOUNT, {
      account,
      password,
    }).then((response) => {
      return JSON.parse(response.data);
    });
  }
}