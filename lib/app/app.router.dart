// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:observable_flutter/models/date.dart' as _i8;
import 'package:observable_flutter/ui/views/base_app_bar/base_app_bar_view.dart'
    as _i6;
import 'package:observable_flutter/ui/views/date_details/date_details_view.dart'
    as _i5;
import 'package:observable_flutter/ui/views/home/home_view.dart' as _i3;
import 'package:observable_flutter/ui/views/login/login_view.dart' as _i2;
import 'package:observable_flutter/ui/views/startup/startup_view.dart' as _i4;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;

class Routes {
  static const loginView = '/login-view';

  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const dateDetailsView = '/date-details-view';

  static const baseAppBarView = '/base-app-bar-view';

  static const all = <String>{
    loginView,
    homeView,
    startupView,
    dateDetailsView,
    baseAppBarView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.loginView,
      page: _i2.LoginView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i3.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i4.StartupView,
    ),
    _i1.RouteDef(
      Routes.dateDetailsView,
      page: _i5.DateDetailsView,
    ),
    _i1.RouteDef(
      Routes.baseAppBarView,
      page: _i6.BaseAppBarView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoginView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.LoginView(),
        settings: data,
      );
    },
    _i3.HomeView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.HomeView(),
        settings: data,
      );
    },
    _i4.StartupView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.StartupView(),
        settings: data,
      );
    },
    _i5.DateDetailsView: (data) {
      final args = data.getArgs<DateDetailsViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i5.DateDetailsView(key: args.key, date: args.date),
        settings: data,
      );
    },
    _i6.BaseAppBarView: (data) {
      final args = data.getArgs<BaseAppBarViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.BaseAppBarView(args.title, args.actions, key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class DateDetailsViewArguments {
  const DateDetailsViewArguments({
    this.key,
    required this.date,
  });

  final _i7.Key? key;

  final _i8.Date date;

  @override
  String toString() {
    return '{"key": "$key", "date": "$date"}';
  }

  @override
  bool operator ==(covariant DateDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.date == date;
  }

  @override
  int get hashCode {
    return key.hashCode ^ date.hashCode;
  }
}

class BaseAppBarViewArguments {
  const BaseAppBarViewArguments({
    required this.title,
    required this.actions,
    this.key,
  });

  final String title;

  final List<_i7.Widget>? actions;

  final _i7.Key? key;

  @override
  String toString() {
    return '{"title": "$title", "actions": "$actions", "key": "$key"}';
  }

  @override
  bool operator ==(covariant BaseAppBarViewArguments other) {
    if (identical(this, other)) return true;
    return other.title == title && other.actions == actions && other.key == key;
  }

  @override
  int get hashCode {
    return title.hashCode ^ actions.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i9.NavigationService {
  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDateDetailsView({
    _i7.Key? key,
    required _i8.Date date,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.dateDetailsView,
        arguments: DateDetailsViewArguments(key: key, date: date),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBaseAppBarView({
    required String title,
    required List<_i7.Widget>? actions,
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.baseAppBarView,
        arguments:
            BaseAppBarViewArguments(title: title, actions: actions, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDateDetailsView({
    _i7.Key? key,
    required _i8.Date date,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.dateDetailsView,
        arguments: DateDetailsViewArguments(key: key, date: date),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBaseAppBarView({
    required String title,
    required List<_i7.Widget>? actions,
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.baseAppBarView,
        arguments:
            BaseAppBarViewArguments(title: title, actions: actions, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
