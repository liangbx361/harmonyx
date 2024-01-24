export default class GlobalData {
  public static readonly KEY_TOKEN = 'token';

  private static instance: GlobalData;
  private data: Record<string, any> = {};

  private constructor() {}

  public static getInstance(): GlobalData {
    if (!GlobalData.instance) {
      GlobalData.instance = new GlobalData();
    }
    return GlobalData.instance;
  }

  public set(key: string, value: any): void {
    this.data[key] = value;
  }

  public get(key: string): any {
    return this.data[key];
  }
}