import 'package:observable_flutter/services/authentication_service.dart';
import 'package:observable_flutter/services/routing_service.dart';
import 'package:stacked/stacked.dart';
import 'package:observable_flutter/app/app.locator.dart';
import 'package:observable_flutter/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _routingService = locator<RoutingService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    _routingService.navigateOnAuth(_navigationService.replaceWithHomeView);
  }
}
