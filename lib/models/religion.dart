
import 'package:sacred_compass/models/religious_places.dart';

class Religion {
  final String name;
  final String emoji;
  final List<ReligiousPlace> places;

  const Religion({
    required this.name,
    required this.emoji,
    required this.places,
  });
}
