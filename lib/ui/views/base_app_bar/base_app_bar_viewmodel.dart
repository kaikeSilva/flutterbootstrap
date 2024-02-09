import 'package:observable_flutter/app/app.locator.dart';
import 'package:observable_flutter/app/app.router.dart';
import 'package:observable_flutter/services/authentication_service.dart';
import 'package:observable_flutter/services/connection_service.dart';
import 'package:observable_flutter/ui/common/setup_snackbar_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BaseAppBarViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _connectionService = locator<ConnectionService>();

  BaseAppBarViewModel() {
    _monitorConnection();
  }

  Future<void> logout() async {
    await _authenticationService.unauthenticate();
    _navigationService.replaceWithLoginView();
  }

  void goBack() {
    _authenticationService.runIfAuthenticated(() {
      _navigationService.back();
    });
  }

  void _monitorConnection() {
    _connectionService.connectionSubscribe(_showConnectionStatus);
  }

  void _showConnectionStatus(bool isConnected) {
    _snackbarService.showCustomSnackBar(
      variant: isConnected ? SnackbarType.success : SnackbarType.error,
      title: 'Connection Status',
      message: isConnected
          ? 'You are connected to the internet'
          : 'No internet connection',
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void dispose() {
    _connectionService.dispose();
    super.dispose();
  }
}
