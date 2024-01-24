import axios, { AxiosInstance } from '@ohos/axios';
import { UserApi, UserApiImpl } from './UserApi';

export default interface RemoteSource {
  getUserApi(): UserApi;
}

export class RemoteSourceImpl implements RemoteSource {
  private axios: AxiosInstance;
  private userApi: UserApi;

  constructor() {
    this.axios = this.createAxios();
    this.userApi = new UserApiImpl(this.axios);
  }

  createAxios(): AxiosInstance {
    const instance = axios.create();
    instance.defaults.baseURL = 'http://localhost:3000';
    instance.defaults.timeout = 10000;
    return instance;
  }

  getUserApi(): UserApi {
    return this.userApi;
  }
}