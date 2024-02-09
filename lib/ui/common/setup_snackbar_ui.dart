import 'package:flutter/material.dart';
import 'package:observable_flutter/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

/// The type of snackbar to show
enum SnackbarType { error, greenAndRed }

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  // Registers a config to be used when calling showSnackbar
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      borderRadius: 1,
      dismissDirection: DismissDirection.horizontal,
      snackPosition: SnackPosition.TOP,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.greenAndRed,
    config: SnackbarConfig(
      backgroundColor: Colors.white,
      titleColor: Colors.green,
      messageColor: Colors.red,
      borderRadius: 1,
      snackPosition: SnackPosition.TOP,
    ),
  );
}
