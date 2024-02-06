import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:observable_flutter/app/app.locator.dart';
import 'package:observable_flutter/app/app.router.dart';
import 'package:observable_flutter/models/auth_user.dart';
import 'package:observable_flutter/services/api_service.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthenticationService extends ApiService<AuthUser> {
  // is user authenticated
  bool _isAuthenticated = false;
  final String _tokenUrl = "/jwt/token/";
  final String _refreshUrl = "/jwt/refresh/token/";
  final _navigationService = locator<NavigationService>();

  Future<void> runIfAuthenticated(Function() authenticated) async {
    await isAuthenticated.then((isAuthenticated) {
      if (isAuthenticated) {
        authenticated();
      } else {
        _navigationService.replaceWithLoginView();
      }
    });
  }

  // get user authentication status as a Future
  Future<bool> get isAuthenticated async {
    _isAuthenticated = false;
    final access = await storage.read("access");
    final refresh = await storage.read("refresh");

    // verify  if the token is expired
    if (access != null && !JwtDecoder.isExpired(access)) {
      return true;
    }

    // verify if the refresh token is expired
    if (refresh != null && !JwtDecoder.isExpired(refresh)) {
      // refresh token is not expired, refresh the access token
      final isRefreshed = await refreshToken();
      if (isRefreshed) {
        _isAuthenticated = true;
        return true;
      }
    }

    return false;
  }

  // login user
  Future<bool> authenticate(String email, String password) async {
    var user = await post(
        _tokenUrl,
        {
          "username": email,
          "password": password,
        },
        (json) => AuthUser.fromJson(json));

    var access = user.data!.access;
    var refresh = user.data!.refresh;
    var username = user.data!.displayName;

    await storage.write(key: "access", value: access);
    await storage.write(key: "username", value: username!);
    await storage.write(key: "refresh", value: refresh);
    _isAuthenticated = true;
    return _isAuthenticated;
  }

  // unauthenticate user
  Future<bool> unauthenticate() async {
    await runIfAuthenticated(() async {
      await post(
          "/jwt/logout/",
          {
            "refresh": await storage.read("refresh"),
          },
          (p0) => null);
      await storage.delete("access");
      await storage.delete("refresh");
      _isAuthenticated = false;
    });

    return _isAuthenticated;
  }

  // refresh user token
  Future<bool> refreshToken() async {
    try {
      var user = await post(
          _refreshUrl,
          {
            "refresh": await storage.read("refresh"),
          },
          (json) => AuthUser.fromJson(json));
      var access = user.data!.access;
      var refresh = user.data!.refresh;

      await storage.write(key: "access", value: access);
      await storage.write(key: "refresh", value: refresh);
      _isAuthenticated = true;
      return _isAuthenticated;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
