import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionService {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  // Check if there is an active internet connection
  Future<bool> hasConnection() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  // Subscribe to connection changes
  void connectionSubscribe(Function(bool) onChange) {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      // Convert the connectivity result to a boolean value indicating connection status
      bool isConnected = result != ConnectivityResult.none;
      onChange(isConnected);
    });
  }

  // Don't forget to cancel subscription when it's no longer needed to prevent memory leaks
  void dispose() {
    _connectivitySubscription?.cancel();
  }
}
