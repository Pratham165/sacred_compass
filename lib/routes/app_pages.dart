import '../utils/import_export.dart';


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
    GetPage(
      name: _Paths.hinduPlaces,
      page: () => const HinduReligiousPlacesView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.islamPlaces,
      page: () => const IslamReligiousPlacesView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.christianityPlaces,
      page: () => const ChristianityReligiousPlacesView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.sikhismPlaces,
      page: () => const SikhismReligiousPlacesView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.buddhismPlaces,
      page: () => const BuddhismReligiousPlacesView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.jainismPlaces,
      page: () => const JainismReligiousPlacesView(),
      binding: HomeBinding(),
    ),
  ];
}
