import 'package:flutter/material.dart';

enum DialogType{
  info,
  error,
}

/// a class to simplify navigating between screens
/// and to show snackbars, dialogs.
/// it requires no `BuildContext`.
class ScreenUtilsRepo {
  /// the navigator key responsible for navigating between screens
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// the scaffold messenger key responsible for showing snackbar
  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  /// get current screen context, returns `null` if no widget built with [navigatorKey]
  BuildContext? get currentContext => navigatorKey.currentContext;

  /// this is equivalent to
  /// ```
  /// await Navigator.of(contex).pushNamed('/routeName');
  /// ```
  Future<T?>? toNamed<T extends Object?>(String routeName,
      {bool avoidStackingSameScreen = true, Object? arguments}) {
    try {
      if (avoidStackingSameScreen) {
        if (navigatorKey.currentState != null) {
          if (ModalRoute.of(navigatorKey.currentState!.context)
                  ?.settings
                  .name !=
              routeName) {
            return navigatorKey.currentState
                ?.pushNamed<T>(routeName, arguments: arguments);
          } else {
            return null;
          }
        }
        return null;
      } else {
        return navigatorKey.currentState
            ?.pushNamed<T>(routeName, arguments: arguments);
      }
    } catch (e, st) {
      debugPrint('$e\n$st');
    }
  }

  /// this is equivalent to
  /// ```dart
  /// Navigator.of(contex).pop();
  /// ```
  void back<T extends Object?>([T? result]) {
    try {
      return navigatorKey.currentState?.pop(result);
    } catch (e, st) {
      debugPrint('$e\n$st');
    }
  }

  /// this is equivalent to
  /// ```dart
  /// await Navigator.of(contex).pushNamedAndRemoveUntil('/routeName', ModalRoute.withName('/untilRouteName'), arguments: arguments);
  /// ```
  Future<T?>? offToNameUntil<T extends Object?>(String toRouteName,
      {required String untilRouteName, Object? arguments}) {
    try {
      return navigatorKey.currentState?.pushNamedAndRemoveUntil<T>(
          toRouteName, ModalRoute.withName(untilRouteName),
          arguments: arguments);
    } catch (e, st) {
      debugPrint('$e\n$st');
    }
  }

  /// this is equivalent to
  /// ```dart
  /// await Navigator.of(contex).pushNamedAndRemoveUntil('/routeName', (_) => false, arguments: arguments);
  /// ```
  Future<T?>? offAllToName<T extends Object?>(String routeName,
      {Object? arguments}) {
    try {
      return navigatorKey.currentState?.pushNamedAndRemoveUntil<T>(
          routeName, (_) => false,
          arguments: arguments);
    } catch (e, st) {
      debugPrint('$e\n$st');
    }
  }

  /// this is equivalent to
  /// ```dart
  /// await Navigator.of(contex).pushReplacementNamed('/routeName');
  /// ```
  Future<T?>? offToName<T extends Object?, TO extends Object?>(String routeName,
      {TO? result, Object? arguments}) {
    try {
      return navigatorKey.currentState?.pushReplacementNamed<T, TO>(routeName,
          result: result, arguments: arguments);
    } catch (e, st) {
      debugPrint('$e\n$st');
    }
  }

  /// a shortcut for showing snack bar.
  ///
  /// `duration` defaults to 1500 ms
  void showSnackBar(String message, {Duration? duration}) {
    try {
      messengerKey.currentState?.showSnackBar(SnackBar(
        content: Text(message),
        duration: duration ?? Duration(milliseconds: 1500),
      ));
    } catch (e, st) {
      debugPrint('$e\n$st');
    }
  }

  void showMessageDialog({required String message, String? title, DialogType dialogType = DialogType.info}) {
    
    Widget dialogTitle() {
      switch(dialogType) {
        case DialogType.info:
          return Text(
            title ?? 'Info',
            style: TextStyle(
              color: Theme.of(navigatorKey.currentContext!).primaryColor,
            ),
          );

        case DialogType.error:
          return Text(
            title ?? 'Error',
            style: TextStyle(
              color: Theme.of(navigatorKey.currentContext!).errorColor,
            ),
          );
      }
    }
    
    if(navigatorKey.currentContext != null) {

      showDialog(
        context: navigatorKey.currentContext!, 
        builder: (context) {
          return AlertDialog(
            title: dialogTitle(),
            content: Text(message),
            actions: [
              /// ok button
              TextButton(
                onPressed: Navigator.of(context).pop, 
                child: Text('Okay'),
                style: TextButton.styleFrom(
                  primary: dialogType == DialogType.error 
                    ? Theme.of(navigatorKey.currentContext!).errorColor
                    : null,
                ),
              ),
            ],
          );
        }
      );

    }
  }
}
