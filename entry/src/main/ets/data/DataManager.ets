import LocalSource, { LocalSourceImpl } from './sources/local/LocalSource';
import RemoteSource, { RemoteSourceImpl } from './sources/remote/RemoteSource';
export default  class DataManager {
  private static instance: DataManager;

  private readonly localSource: LocalSource;
  private readonly remoteSource: RemoteSource;

  public static init(context: Context) {
    if (!DataManager.instance) {
      DataManager.instance = new DataManager(context);
    }
  }

  public static getInstance(): DataManager {
    return DataManager.instance;
  }

  private constructor(context: Context) {
    this.localSource = new LocalSourceImpl(context);
    this.remoteSource = new RemoteSourceImpl();
  }

  public getLocalSource(): LocalSource {
    return this.localSource;
  }

  public getRemoteSource(): RemoteSource {
    return this.remoteSource;
  }
}