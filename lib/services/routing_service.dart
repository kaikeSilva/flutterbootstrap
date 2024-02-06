import 'package:observable_flutter/app/app.locator.dart';
import 'package:observable_flutter/app/app.router.dart';
import 'package:observable_flutter/services/authentication_service.dart';
import 'package:stacked_services/stacked_services.dart';

class RoutingService {
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();

  void navigateOnAuth(Function() authenticated) {
    _authenticationService.isAuthenticated.then((isAuthenticated) {
      if (isAuthenticated) {
        authenticated();
      } else {
        _navigationService.replaceWithLoginView();
      }
    });
  }
}
