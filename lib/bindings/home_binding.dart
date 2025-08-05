import '../utils/import_export.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReligiousPlacesController>(
          () => ReligiousPlacesController(),
    );
  }
}
