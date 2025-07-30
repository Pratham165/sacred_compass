import 'package:get/get.dart';
import '../bindings/home_binding.dart';
import '../bindings/splash_binding.dart';
import '../views/splash_view.dart';
import '../views/home_view.dart';
import '../views/religious_places_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.places,
      page: () => const ReligiousPlacesView(),
      binding: HomeBinding(),
    ),
  ];
}
