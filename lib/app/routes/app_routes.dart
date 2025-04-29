part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const getStarted = _Paths.getStarted;
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const base = _Paths.base;
  static const home = _Paths.base + _Paths.home;
  static const searchPage = _Paths.base + _Paths.searchPage;
  static const details = _Paths.detail;
  static const myList = _Paths.base + _Paths.myList;
}

abstract class _Paths {
  _Paths._();
  static const splash = '/splash';
  static const getStarted = '/get-started';
  static const login = '/login';
  static const register = '/register';
  static const base = '/base';
  static const home = '/home';
  static const searchPage = '/searchpage';
  static const detail = '/detail';
  static const myList = '/mylist';
}