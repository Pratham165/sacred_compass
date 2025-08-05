import '../utils/import_export.dart';

class PlaceCardWidget extends StatelessWidget {
  final ReligiousPlace place;

  const PlaceCardWidget({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            _buildImage(),
            const SizedBox(width: 16),
            Expanded(child: _buildInfo()),
            _buildArrowIcon(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade100, Colors.teal.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: _buildImageContent(),
      ),
    );
  }

  Widget _buildImageContent() {
    // Try to show emoji first, with fallback to icon
    return Text(
      place.image,
      style: const TextStyle(
        fontSize: 24,
        fontFamilyFallback: ['Apple Color Emoji', 'Segoe UI Emoji', 'Noto Color Emoji'],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          place.name,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.grey800,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 14,
              color: AppColors.grey600,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                place.address,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: AppColors.grey600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        if (place.coordinates.isNotEmpty) ...[
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                Icons.my_location,
                size: 12,
                color: AppColors.grey500,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  place.coordinates,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: AppColors.grey500,
                    fontStyle: FontStyle.italic,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildArrowIcon() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: AppColors.grey600,
      ),
    );
  }
}
