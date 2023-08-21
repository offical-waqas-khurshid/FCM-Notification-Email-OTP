import 'package:get/get.dart';

import '../modules/fcm_notification/bindings/fcm_notification_binding.dart';
import '../modules/fcm_notification/views/fcm_notification_view.dart';
import '../modules/home_screen/bindings/home_screen_binding.dart';
import '../modules/home_screen/views/home_screen_view.dart';
import '../modules/user_login/bindings/user_login_binding.dart';
import '../modules/user_login/views/user_login_view.dart';
import '../modules/user_register/bindings/user_register_binding.dart';
import '../modules/user_register/views/user_register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => const HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.USER_REGISTER,
      page: () => UserRegisterView(),
      binding: UserRegisterBinding(),
    ),
    GetPage(
      name: _Paths.USER_LOGIN,
      page: () => const UserLoginView(),
      binding: UserLoginBinding(),
    ),
    GetPage(
      name: _Paths.FCM_NOTIFICATION,
      page: () => const FcmNotificationView(),
      binding: FcmNotificationBinding(),
    ),
  ];
}
