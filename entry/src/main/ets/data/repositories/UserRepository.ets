import DataManager from '../DataManager';
import User from '../models/remote/User';
export default class UserRepository {
  private static instance: UserRepository;

  public static getInstance() {
    if (!UserRepository.instance) {
      UserRepository.instance = new UserRepository();
    }
    return UserRepository.instance;
  }

  public loginByAccount(account: string, password: string): Promise<User> {
    return DataManager.getInstance().getRemoteSource().getUserApi().loginByAccount(account, password);
  }
}