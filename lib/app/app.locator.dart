// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/api_service.dart';
import '../services/authentication_service.dart';
import '../services/connection_service.dart';
import '../services/data_access_service.dart';
import '../services/data_synchronization_service.dart';
import '../services/date_service.dart';
import '../services/local_database_service.dart';
import '../services/local_storage_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService<dynamic>());
  locator.registerLazySingleton(() => DateService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => LocalStorageService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => DataAccessService<dynamic>());
  locator.registerLazySingleton(() => LocalDatabaseService<dynamic>());
  locator.registerLazySingleton(() => ConnectionService());
  locator.registerLazySingleton(() => DataSynchronizationService());
}
