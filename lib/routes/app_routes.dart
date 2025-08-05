part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const home = _Paths.home;
  static const places = _Paths.places;
  static const hinduPlaces = _Paths.hinduPlaces;
  static const islamPlaces = _Paths.islamPlaces;
  static const christianityPlaces = _Paths.christianityPlaces;
  static const sikhismPlaces = _Paths.sikhismPlaces;
  static const buddhismPlaces = _Paths.buddhismPlaces;
  static const jainismPlaces = _Paths.jainismPlaces;
}

abstract class _Paths {
  _Paths._();
  static const splash = '/splash';
  static const home = '/home';
  static const places = '/places';
  static const hinduPlaces = '/hindu-places';
  static const islamPlaces = '/islam-places';
  static const christianityPlaces = '/christianity-places';
  static const sikhismPlaces = '/sikhism-places';
  static const buddhismPlaces = '/buddhism-places';
  static const jainismPlaces = '/jainism-places';
}
