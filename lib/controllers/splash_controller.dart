import '../utils/import_export.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController scaleController;
  late AnimationController fadeController;
  late AnimationController rotationController;

  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;
  late Animation<double> rotationAnimation;

  @override
  void onInit() {
    super.onInit();
    _initializeAnimations();
    _startAnimations();
    _navigateToHome();
  }

  void _initializeAnimations() {
    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.elasticOut),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: fadeController, curve: Curves.easeIn),
    );

    rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: rotationController, curve: Curves.linear),
    );
  }

  void _startAnimations() {
    fadeController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      scaleController.forward();
    });
    rotationController.repeat();
  }

  void _navigateToHome() {
    Timer(const Duration(seconds: 4), () {
      Get.offNamed('/home');
    });
  }

  @override
  void onClose() {
    scaleController.dispose();
    fadeController.dispose();
    rotationController.dispose();
    super.onClose();
  }
}
