import distributedKVStore from '@ohos.data.distributedKVStore';

export default interface LocalSource {

  setConfig(key: string, value: boolean | string | number | Uint8Array): Promise<void>;

  getConfig(key: string): Promise<boolean | string | number | Uint8Array>;
}

export class LocalSourceImpl implements LocalSource {
  private static readonly configKey: string = "config";
  private readonly kvManager: distributedKVStore.KVManager;
  private readonly kvOptions: distributedKVStore.Options;

  constructor(context: Context) {
    try {
      this.kvManager = distributedKVStore.createKVManager({
        bundleName: context.applicationInfo.name + ".local",
        context: context,
      });

      this.kvOptions = {
        createIfMissing: true, // 当数据库文件不存在时是否创建数据库，默认创建
        encrypt: false, // 设置数据库文件是否加密，默认不加密
        backup: false, // 设置数据库文件是否备份，默认备份
        kvStoreType: distributedKVStore.KVStoreType.SINGLE_VERSION, // 设置要创建的数据库类型，默认为多设备协同数据库
        securityLevel: distributedKVStore.SecurityLevel.S2 // 设置数据库安全级别
      };
    } catch (e) {
      console.error(`Failed to create KVManager. Code:${e.code},message:${e.message}`);
    }
  }

  getConfig(key: string): Promise<boolean | string | number | Uint8Array> {
    return this.getConfigStore().then((store) => {
      return store.get(key);
    });
  }

  setConfig(key: string, value: boolean | string | number | Uint8Array): Promise<void> {
    return this.getConfigStore().then((store) => {
      return store.put(key, value);
    });
  }

  getConfigStore(): Promise<distributedKVStore.SingleKVStore> {
    return this.kvManager.getKVStore(LocalSourceImpl.configKey, this.kvOptions);
  }
}