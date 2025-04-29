
import 'package:get/get.dart';
import 'package:group_five/app/modules/base/binding/base_binding.dart';
import 'package:group_five/app/modules/base/views/base_view.dart';
import 'package:group_five/app/modules/detail/binding/detail_binding.dart';
import 'package:group_five/app/modules/detail/views/detail_view.dart';
import 'package:group_five/app/modules/home/binding/home_binding.dart';
import 'package:group_five/app/modules/home/views/home_view.dart';
import 'package:group_five/app/modules/login/binding/login_binding.dart';
import 'package:group_five/app/modules/login/views/login_view.dart';
import 'package:group_five/app/modules/mylist/binding/mylist_binding.dart';
import 'package:group_five/app/modules/mylist/views/mylist_view.dart';
import 'package:group_five/app/modules/register/binding/register_binding.dart';
import 'package:group_five/app/modules/register/views/register_view.dart';
import 'package:group_five/app/modules/search/binding/search_page_binding.dart';
import 'package:group_five/app/modules/search/views/search_page_view.dart';
import 'package:group_five/app/modules/splash/binding/splash_binding.dart';
import 'package:group_five/app/modules/splash/views/splash_view.dart';

import '../modules/get started/binding/get_started_binding.dart';
import '../modules/get started/views/get_started_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.getStarted,
      page: () => GetStartedView(),
      binding: GetStartedBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () =>  LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () =>  RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.base,
      page: () => BaseView(),
      binding: BaseBinding(),
      children: [
        GetPage(
          name: Routes.home,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: Routes.searchPage,
          page: () =>  SearchPageView(),
          binding: SearchPageBinding(),
        ),
        GetPage(
          name: Routes.myList,
          page: () => const MylistView(),
          binding: MylistBinding(),
        ),
      ],
    ),
    GetPage(
      name: Routes.details,
      page: () => const DetailView(),
      binding: DetailBinding(),
    ),
  ];
}