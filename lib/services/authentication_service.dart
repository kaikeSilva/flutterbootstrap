import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:observable_flutter/app/app.locator.dart';
import 'package:observable_flutter/app/app.router.dart';
import 'package:observable_flutter/exceptions/data_exception.dart';
import 'package:observable_flutter/models/auth_user.dart';
import 'package:observable_flutter/services/api_service.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthenticationService extends ApiService<AuthUser> {
  final String _tokenUrl = "/jwt/token/";
  final String _refreshUrl = "/jwt/refresh/token/";
  final _navigationService = locator<NavigationService>();

  Future<void> runIfAuthenticated(Function() authenticated) async {
    await isAuthenticated.then((authenticatedResult) async {
      if (authenticatedResult) {
        authenticated();
      } else {
        await storage.delete("access");
        await storage.delete("refresh");
        await storage.delete("username");
        _navigationService.replaceWithLoginView();
      }
    });
  }

  Future<bool> get isAuthenticated async {
    final access = await storage.read("access");
    final refresh = await storage.read("refresh");

    if (access != null && !JwtDecoder.isExpired(access)) {
      return true;
    }

    if (refresh != null && !JwtDecoder.isExpired(refresh)) {
      final isRefreshed = await refreshToken();
      if (isRefreshed) {
        return true;
      }
    }

    return false;
  }

  // login user
  Future<bool> authenticate(String email, String password) async {
    final currentUser = AuthUser(
      access: "",
      refresh: "",
      email: email,
      password: password,
    );
    var user = await insert(_tokenUrl, currentUser,
        fromJsonT: (json) => AuthUser.fromJson(json),
        toJson: (userToConvert) => userToConvert.toJson());

    var access = user.data!.access;
    var refresh = user.data!.refresh;
    var username = user.data!.displayName;

    await storage.write(key: "access", value: access);
    await storage.write(key: "username", value: username!);
    await storage.write(key: "refresh", value: refresh);
    return true;
  }

  // unauthenticate user
  Future<void> unauthenticate() async {
    try {
      final currentUser = AuthUser(
        access: await storage.read("access") ?? "",
        refresh: await storage.read("refresh") ?? "",
      );
      await runIfAuthenticated(() async {
        await insert("/jwt/logout/", currentUser);
      });
    } catch (e) {
      print(e);
    } finally {
      await storage.delete("access");
      await storage.delete("refresh");
      await storage.delete("username");
    }
  }

  // refresh user token
  Future<bool> refreshToken() async {
    try {
      var currentUser = AuthUser(
        access: await storage.read("access") ?? "",
        refresh: await storage.read("refresh") ?? "",
      );

      var user = await insert(_refreshUrl, currentUser,
          fromJsonT: (json) => AuthUser.fromJson(json),
          toJson: (userToConvert) => userToConvert.toJson());
      var access = user.data!.access;
      var refresh = user.data!.refresh;

      await storage.write(key: "access", value: access);
      await storage.write(key: "refresh", value: refresh);
      return true;
    } on DataException catch (e) {
      if (e.statusCode == 401) {
        await unauthenticate();
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
