import 'package:get/get.dart';
import '../controllers/religious_places_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReligiousPlacesController>(
          () => ReligiousPlacesController(),
    );
  }
}
