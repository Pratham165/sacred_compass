import '../utils/import_export.dart';

class HomeView extends GetView<ReligiousPlacesController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final animationController = Get.put(AppAnimationController());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildIntegratedHeader(),
              Expanded(
                child: _buildReligionsList(animationController),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntegratedHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        children: [
          // Logo and Title Section
          Row(
            children: [
              // Logo Container
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.secondary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.explore,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 15),
              // Title and Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [AppColors.primary, AppColors.secondary],
                      ).createShader(bounds),
                      child: Text(
                        'Sacred Compass',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Find peace in sacred places',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Search/Info Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.temple_buddhist,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Discover Worship Places',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        'Explore sacred sites across different religions',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReligionsList(AppAnimationController animationController) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Obx(() {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.religions.length,
          itemBuilder: (context, index) {
            final religion = controller.religions[index];
            return _buildReligionListItem(
              religion,
              index,
              animationController,
            );
          },
        );
      }),
    );
  }

  Widget _buildReligionListItem(
    religion,
    int index,
    AppAnimationController animationController,
  ) {
    // Define colors for each religion matching the image
    final colors = [
      Colors.orange.shade100, // Hinduism
      Colors.teal.shade100,   // Islam
      Colors.blue.shade100,   // Christianity
      Colors.amber.shade100,  // Sikhism
      Colors.cyan.shade100,   // Jainism
    ];

    return Obx(() {
      final animationValue = Curves.easeOutBack
          .transform(
        (animationController.animationValue.value - (index * 0.1))
            .clamp(0.0, 1.0),
      )
          .clamp(0.0, 1.0);

      return Transform.translate(
        offset: Offset(0, 30 * (1 - animationValue)),
        child: Opacity(
          opacity: animationValue,
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                  borderRadius: BorderRadius.circular(22.5),
                ),
                child: Center(
                  child: Text(
                    religion.emoji,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamilyFallback: ['Apple Color Emoji', 'Segoe UI Emoji', 'Noto Color Emoji'],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              title: Text(
                religion.name,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey800,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: AppColors.grey600,
              ),
              onTap: () => controller.navigateToPlaces(religion.name),
            ),
          ),
        ),
      );
    });
  }
}
