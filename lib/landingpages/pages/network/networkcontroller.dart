import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:universal_html/html.dart' as html;
import 'package:xtreme_fitness/config/apis.dart';

class NetworkController extends GetxController {
  var connectionStatus = ConnectivityResult.none.obs;
  final Connectivity _connectivity = Connectivity();
  var hasServerError = false.obs;
  var isWaiting = false.obs; // Add isWaiting

  bool _isinternetok = true;
  bool get isinternetok => _isinternetok;

  bool _isserverok = true;
  bool get isserverok => _isserverok;

  final networkStateStream = StreamController<NetworkState>();

  StreamController<NetworkState>? networkStateController;

  // Stream getter

  void _initializeStream() {
    networkStateController =
        StreamController<NetworkState>.broadcast(); // Reset stream
    getContactDetails();
  }

  @override
  void onInit() {
    super.onInit();
    _initializeStream();
    _checkInitialConnection();

    getContactDetails();
    _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  Future<void> _checkInitialConnection() async {
    var status = await _connectivity.checkConnectivity();
    connectionStatus.value = status[0];
    updateConnectionStatus(status);
  }

  void updateConnectionStatus(List<ConnectivityResult> result) {
    connectionStatus.value = result[0];
    if (connectionStatus.value == ConnectivityResult.none) {
      _isinternetok = false;
      networkStateStream.add(NetworkState.noInternet); // Emit no internet state
      isWaiting.value = false; // Stop waiting
    } else {
      _isinternetok = true;
      getContactDetails();
    }
    update();
  }

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
        networkStateStream.add(NetworkState.dataFetched); // Emit data fetched
      } else {
        _isserverok = false;
        networkStateStream.add(NetworkState.serverError); // Emit server error
      }
    } on html.ProgressEvent catch (e) {
      _isinternetok = false;
      networkStateStream.add(NetworkState.serverError); // Emit no internet
    } catch (e) {
      _isserverok = false;
      networkStateStream.add(NetworkState.serverError); // Emit server error
    } finally {
      isWaiting.value = false; // Stop waiting after fetching
    }
    update();
  }

  void resetStream() {
    // Close the old stream and initialize a new one when navigating back to the page

    Get.offAllNamed('/');
  }

  @override
  void onClose() {
    networkStateController?.close();
    super.onClose();
  }
}

enum NetworkState {
  noInternet,
  serverError,
  dataFetched,
}
