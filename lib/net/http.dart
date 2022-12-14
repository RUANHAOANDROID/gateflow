import '../models/devices_entity.dart';
import '../utils/http.dart';

class HttpManager {
  static Future<List<DevicesData>> devicesList() async {
    var response = await HttpUtils.post("/devices/list", "");
    return DevicesEntity.fromJson(response).data!;
  }
}
