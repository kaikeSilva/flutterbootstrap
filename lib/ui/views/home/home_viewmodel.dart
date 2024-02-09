import 'package:flutter/material.dart';
import 'package:observable_flutter/app/app.locator.dart';
import 'package:observable_flutter/app/app.router.dart';
import 'package:observable_flutter/models/data_response.dart';
import 'package:observable_flutter/models/date.dart';
import 'package:observable_flutter/services/authentication_service.dart';
import 'package:observable_flutter/services/date_service.dart';
import 'package:observable_flutter/services/local_storage_service.dart';
import 'package:observable_flutter/ui/common/setup_snackbar_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel<List<Date>> with FormStateHelper {
  final _apiService = locator<DateService>();
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  final _storageService = locator<LocalStorageService>();
  final _snackbarService = locator<SnackbarService>();

  String? username; // Property to hold the username

  @override
  Future<List<Date>> futureToRun() async {
    try {
      DataResponse apiResponse = await _apiService.getDates();
      username = await _storageService.read("username");
      return apiResponse.data ?? []; // Ensure null safety
    } catch (e) {
      _showError(e.toString());
      return []; // Return an empty list on error to ensure the app can continue
    }
  }

  void _showError(String message) {
    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.error,
      title: 'Error',
      message: message,
      duration: Duration(seconds: 3),
    );
  }

  Future<void> navigateToDate(Date date) async {
    await _authenticationService.runIfAuthenticated(() async {
      await _navigationService.navigateToDateDetailsView(date: date);
    });
  }

  Future<void> fetchNewCategory() async {
    await initialise();
  }
}
