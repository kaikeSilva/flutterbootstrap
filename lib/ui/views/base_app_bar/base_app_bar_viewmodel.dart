import 'package:observable_flutter/app/app.locator.dart';
import 'package:observable_flutter/app/app.router.dart';
import 'package:observable_flutter/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BaseAppBarViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();

  Future<void> logout() async {
    await _authenticationService.unauthenticate();
    _navigationService.replaceWithLoginView();
  }

  void goBack() {
    _authenticationService.runIfAuthenticated(() {
      _navigationService.back();
    });
  }
}
