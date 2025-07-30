class ReligiousPlace {
  final String name;
  final String address;
  final String coordinates;
  final String image;

  const ReligiousPlace({
    required this.name,
    required this.address,
    required this.coordinates,
    required this.image,
  });

  factory ReligiousPlace.fromMap(Map<String, String> map) {
    return ReligiousPlace(
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      coordinates: map['coordinates'] ?? '',
      image: map['image'] ?? '🏛️',
    );
  }

  Map<String, String> toMap() {
    return {
      'name': name,
      'address': address,
      'coordinates': coordinates,
      'image': image,
    };
  }
}
