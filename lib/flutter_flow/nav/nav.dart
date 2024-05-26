import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => StartupPage1Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => StartupPage1Widget(),
        ),
        FFRoute(
          name: 'StartupPage1',
          path: '/startupPage1',
          builder: (context, params) => StartupPage1Widget(),
        ),
        FFRoute(
          name: 'StartupPage2',
          path: '/startupPage2',
          builder: (context, params) => StartupPage2Widget(),
        ),
        FFRoute(
          name: 'StartupPage3',
          path: '/startupPage3',
          builder: (context, params) => StartupPage3Widget(),
        ),
        FFRoute(
          name: 'StartupPage4',
          path: '/startupPage4',
          builder: (context, params) => StartupPage4Widget(),
        ),
        FFRoute(
          name: 'LoginPage1',
          path: '/loginPage1',
          builder: (context, params) => LoginPage1Widget(),
        ),
        FFRoute(
          name: 'EULAPage',
          path: '/eULAPage',
          builder: (context, params) => EULAPageWidget(),
        ),
        FFRoute(
          name: 'IndexPage1',
          path: '/indexPage1',
          builder: (context, params) => IndexPage1Widget(),
        ),
        FFRoute(
          name: 'IndexParamater',
          path: '/indexParamater',
          builder: (context, params) => IndexParamaterWidget(),
        ),
        FFRoute(
          name: 'FeesPage1',
          path: '/feesPage1',
          builder: (context, params) => FeesPage1Widget(),
        ),
        FFRoute(
          name: 'BalancePage1',
          path: '/balancePage1',
          builder: (context, params) => BalancePage1Widget(),
        ),
        FFRoute(
          name: 'UserSettings1',
          path: '/userSettings1',
          builder: (context, params) => UserSettings1Widget(),
        ),
        FFRoute(
          name: 'HelpSettings1',
          path: '/helpSettings1',
          builder: (context, params) => HelpSettings1Widget(),
        ),
        FFRoute(
          name: 'TransactionsPage1',
          path: '/transactionsPage1',
          builder: (context, params) => TransactionsPage1Widget(),
        ),
        FFRoute(
          name: 'NotificationsPage1',
          path: '/notificationsPage1',
          builder: (context, params) => NotificationsPage1Widget(),
        ),
        FFRoute(
          name: 'QRSetup1',
          path: '/qRSetup1',
          builder: (context, params) => QRSetup1Widget(),
        ),
        FFRoute(
          name: 'PromissoryGenerator1',
          path: '/promissoryGenerator1',
          builder: (context, params) => PromissoryGenerator1Widget(),
        ),
        FFRoute(
          name: 'ExcuseLetterGenerator1',
          path: '/excuseLetterGenerator1',
          builder: (context, params) => ExcuseLetterGenerator1Widget(),
        ),
        FFRoute(
          name: 'PrivacyPage1',
          path: '/privacyPage1',
          builder: (context, params) => PrivacyPage1Widget(),
        ),
        FFRoute(
          name: 'EULAPage2',
          path: '/eULAPage2',
          builder: (context, params) => EULAPage2Widget(),
        ),
        FFRoute(
          name: 'ReportPage1',
          path: '/reportPage1',
          builder: (context, params) => ReportPage1Widget(),
        ),
        FFRoute(
          name: 'NotificationSettingsPage2',
          path: '/notificationSettingsPage2',
          builder: (context, params) => NotificationSettingsPage2Widget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
