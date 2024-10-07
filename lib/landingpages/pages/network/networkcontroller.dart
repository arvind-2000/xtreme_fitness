import 'dart:developer';

import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:universal_html/html.dart' as html;
import 'package:xtreme_fitness/config/apis.dart';

class NetworkController extends GetxController {
  var connectionStatus = ConnectivityResult.none.obs;
  final Connectivity _connectivity = Connectivity();
  var isWaiting = false.obs; // Add isWaiting

  bool _isinternetok = true;
  bool get isinternetok => _isinternetok;

  bool _isserverok = true;
  bool get isserverok => _isserverok;
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
    if (connectionStatus.value == ConnectivityResult.none) {
      _isinternetok = false;

      // Emit no internet state
      isWaiting.value = false; // Stop waiting
      update();
    } else {
      _isinternetok = true;
      update();
      getContactDetails();
    }
    update();
  }
  // void updateConnectionStatus(List<ConnectivityResult> result) {
  //   connectionStatus.value = result[0];
  //   getContactDetails();
  // }

  void getContactDetails() async {
    log('get contacts');
    isWaiting.value = true; // Start waiting
    update();
    try {
      var response = await html.HttpRequest.request(
        '$api/api/Contacts',
        method: 'GET',
      );

      if (response.status == 200) {
        _isserverok = true;
        update();
        // Emit data fetched
      } else {
        _isserverok = false;
        update();
        // Emit server error
      }
    } on html.ProgressEvent catch (e) {
      _isserverok = false;
      update();
      // Emit no internet
    } catch (e) {
      _isserverok = false;
      update();
    } finally {
      isWaiting.value = false; // Stop waiting after fetching
      log('FINALLLLLY');
      log(isWaiting.value.toString());
    }
    update();
  }
}
