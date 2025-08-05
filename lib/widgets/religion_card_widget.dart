import '../utils/import_export.dart';

class ReligionCardWidget extends StatelessWidget {
  final String name;
  final String emoji;
  final Gradient gradient;
  final int index;
  final AppAnimationController animationController;
  final VoidCallback onTap;

  const ReligionCardWidget({
    super.key,
    required this.name,
    required this.emoji,
    required this.gradient,
    required this.index,
    required this.animationController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final animationValue = Curves.easeOutBack
          .transform(
        (animationController.animationValue.value - (index * 0.1))
            .clamp(0.0, 1.0),
      )
          .clamp(0.0, 1.0);

      return Transform.translate(
        offset: Offset(0, 50 * (1 - animationValue)),
        child: Opacity(
          opacity: animationValue,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(25),
            child: Container(
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowMedium,
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                  BoxShadow(
                    color: AppColors.white.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.white.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      emoji,
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 2,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
