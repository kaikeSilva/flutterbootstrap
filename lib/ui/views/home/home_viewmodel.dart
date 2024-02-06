import 'package:observable_flutter/app/app.locator.dart';
import 'package:observable_flutter/app/app.router.dart';
import 'package:observable_flutter/models/api_response.dart';
import 'package:observable_flutter/models/date.dart';
import 'package:observable_flutter/services/authentication_service.dart';
import 'package:observable_flutter/services/date_service.dart';
import 'package:observable_flutter/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel<List<Date>> with FormStateHelper {
  final _apiService = locator<DateService>();
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  final _storageService = locator<LocalStorageService>();

  String? username; // Property to hold the username

  @override
  Future<List<Date>> futureToRun() async {
    ApiResponse apiResponse = await _apiService.getDates();
    username = await _storageService.read("username");
    return apiResponse.data;
  }

  Future<void> navigateToDate(Date date) async {
    await _authenticationService.runIfAuthenticated(() async {
      await _navigationService.navigateToDateDetailsView(date: date);
    });
  }

  Future<void> fetchNewCategory() async {
    await initialise();
  }

  Future<void> logout() async {
    await _authenticationService.unauthenticate();
    _navigationService.replaceWithLoginView();
  }
}
