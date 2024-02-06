import 'package:observable_flutter/app/app.locator.dart';
import 'package:observable_flutter/app/app.router.dart';
import 'package:observable_flutter/services/authentication_service.dart';
import 'package:observable_flutter/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();

  void login() async {
    print('Username: $usernameValue');
    print('Password: $passwordValue');

    // if no username or password is provided, show error
    if (usernameValue == null || passwordValue == null) {
      setValidationMessage('Username and password are required');
      return;
    }
    var isAuthenticated = await _authenticationService.authenticate(
      usernameValue!,
      passwordValue!,
    );

    if (isAuthenticated) {
      _navigationService.replaceWithHomeView();
    } else {
      setValidationMessage('Invalid username or password');
    }
  }
}
