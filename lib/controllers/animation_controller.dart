import '../utils/import_export.dart';

class AppAnimationController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  final RxDouble animationValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    animationController.addListener(() {
      animationValue.value = animationController.value;
    });

    animationController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void resetAnimation() {
    animationController.reset();
    animationController.forward();
  }
}
