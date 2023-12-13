import '../models/devices_entity.dart';
import '../utils/http.dart';

class HttpManager {
  static Future<List<DevicesData>> devicesList() async {
    var response = await HttpUtils.post("/devices/list", "");
    return DevicesEntity.fromJson(response).data!;
  }
  static Future<Map<String, dynamic>> getTheme() async {
    return await HttpUtils.get("/config/getTheme", "");
  }
  static Future<Map<String, dynamic>> setTheme(bool isDask) async {
    return await HttpUtils.get("/config/setTheme?theme=$isDask",'');
  }
  static Future<Map<String, dynamic>> getCodeUrl() async {
    return await HttpUtils.get("/config/getCodeUrl",'');
  }
}
