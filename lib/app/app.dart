import 'package:observable_flutter/services/date_service.dart';
import 'package:observable_flutter/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:observable_flutter/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:observable_flutter/ui/views/home/home_view.dart';
import 'package:observable_flutter/ui/views/date_details/date_details_view.dart';
import 'package:observable_flutter/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:observable_flutter/services/api_service.dart';
import 'package:observable_flutter/ui/views/login/login_view.dart';
import 'package:observable_flutter/services/authentication_service.dart';
import 'package:observable_flutter/services/local_storage_service.dart';
import 'package:observable_flutter/ui/views/base_app_bar/base_app_bar_view.dart';
import 'package:observable_flutter/services/data_access_service.dart';
import 'package:observable_flutter/services/local_database_service.dart';
import 'package:observable_flutter/services/connection_service.dart';
import 'package:observable_flutter/services/data_synchronization_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: LoginView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: DateDetailsView),
    MaterialRoute(page: BaseAppBarView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: DateService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: LocalStorageService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DataAccessService),
    LazySingleton(classType: LocalDatabaseService),
    LazySingleton(classType: ConnectionService),
    LazySingleton(classType: DataSynchronizationService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
