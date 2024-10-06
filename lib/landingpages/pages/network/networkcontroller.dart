import 'dart:developer';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:universal_html/html.dart' as html;
import 'package:xtreme_fitness/config/apis.dart';
import 'dart:async';

class NetworkController extends GetxController {
  final StreamController<NetworkState> _networkStateController =
      StreamController<NetworkState>();

  Stream<NetworkState> get networkStateStream => _networkStateController.stream;

  final Connectivity _connectivity = Connectivity();
  bool _isinternetok = true;
  bool _isserverok = true;

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnection();
    getContactDetails(); // Fetch initial contact details

    // Listen to connectivity changes
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      updateConnectionStatus(result);
    });
  }

  // Check the initial internet connection status
  Future<void> _checkInitialConnection() async {
    var status = await _connectivity.checkConnectivity();
    _isinternetok =
        status != ConnectivityResult.none; // Update internet availability
    _emitNetworkState();
  }

  // Update connection status based on internet connectivity
  void updateConnectionStatus(List<ConnectivityResult> result) {
    _isinternetok = result != ConnectivityResult.none;

    // If internet is available, fetch contact details again
    if (_isinternetok) {
      getContactDetails();
    } else {
      _emitNetworkState(); // Emit no internet state
    }
  }

  // Emit the current network and server status to the stream
  void _emitNetworkState() {
    if (!_isinternetok) {
      _networkStateController.add(NetworkState.noInternet);
    } else if (!_isserverok) {
      _networkStateController.add(NetworkState.serverError);
    } else {
      _networkStateController.add(NetworkState.dataFetched);
    }
  }

  // Fetch contact details from the server
  void getContactDetails() async {
    log('Fetching contact details...');

    try {
      var response = await html.HttpRequest.request(
        '$api/api/Contacts',
        method: 'GET',
      );

      print("Response from network controller: ${response.status}");

      if (response.status == 200) {
        _isserverok = true; // Server responded successfully
      } else {
        _isserverok = false; // Server returned an error
      }

      _emitNetworkState(); // Emit the updated network state
    } on html.ProgressEvent catch (e) {
      print('ProgressEvent error: $e');
      _isserverok = false;
      _emitNetworkState(); // Emit server error due to network issue
    } catch (e) {
      print('Error occurred while fetching contact details: $e');
      _isserverok = false; // General error
      _emitNetworkState();
    }
  }

  @override
  void onClose() {
    _networkStateController
        .close(); // Close the stream when the controller is disposed
    super.onClose();
  }
}

// Enum to represent the various network states
enum NetworkState {
  noInternet,
  serverError,
  dataFetched,
}
