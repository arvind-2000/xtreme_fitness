import 'dart:developer';

import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:universal_html/html.dart' as html;
import 'package:xtreme_fitness/config/apis.dart';

class NetworkController extends GetxController {
  var connectionStatus = ConnectivityResult.none.obs;
  final Connectivity _connectivity = Connectivity();
  var hasServerError = false.obs;
  @override
  void onInit() {
    super.onInit();
    _checkInitialConnection();
    getContactDetails();
    _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  Future<void> _checkInitialConnection() async {
    var status = await _connectivity.checkConnectivity();
    print(status.toString());
    connectionStatus.value = status[0];
  }

  void updateConnectionStatus(List<ConnectivityResult> result) {
    connectionStatus.value = result[0];
    getContactDetails();
  }

  void getContactDetails() async {
    log('get contacts');
    // Make the request using universal_html's HttpRequest with withCredentials set to true
    var response = await html.HttpRequest.request(
      '$api/api/Contacts',
      method: 'GET',
    );
    log(response.status.toString());
    if (response.status == 200) {
      hasServerError.value = false;

      update();
    } else {
      hasServerError.value = true;
      update();
    }
  }
}
