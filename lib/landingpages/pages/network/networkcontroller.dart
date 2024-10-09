import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart' as html;
import 'package:xtreme_fitness/config/apis.dart';

class NetworkController extends GetxController {
  var connectionStatus = ConnectivityResult.none.obs;
  final Connectivity _connectivity = Connectivity();
  bool _isWaiting = false; // Add isWaiting
  bool get isWaiting => _isWaiting;

  bool _isinternetok = true;
  bool get isinternetok => _isinternetok;

  bool _isserverok = true;
  bool get isserverok => _isserverok;
  @override
  // void onInit() {
  //   super.onInit();
  //   // _checkInitialConnection();
  //   // getContactDetails();
  //   // _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  // }

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
      _isWaiting = false; // Stop waiting
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
    _isWaiting = true; // Start waiting
    update();
    log("Starting :$_isWaiting");
    Future.delayed(const Duration(seconds: 3));
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
      _isWaiting = false; // Stop waiting after fetching
      log('FINALLLLLY');
      log("Ending :$_isWaiting");
    }
    update();
  }
}
