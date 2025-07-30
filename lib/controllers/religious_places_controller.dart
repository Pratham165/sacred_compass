import 'package:get/get.dart';

import '../models/religion.dart';
import '../models/religious_places.dart';

class ReligiousPlacesController extends GetxController {
  // Observable list of religions
  final RxList<Religion> _religions = <Religion>[].obs;
  final RxBool _isLoading = false.obs;

  // Getters
  List<Religion> get religions => _religions;
  bool get isLoading => _isLoading.value;

  static const Map<String, List<Map<String, String>>> _mockData = {
    "Hinduism": [
      {
        "name": "Kashi Vishwanath Temple",
        "address": "Varanasi, Uttar Pradesh",
        "coordinates": "25.3109° N, 83.0107° E",
        "image": "🕉️",
      },
      {
        "name": "Badrinath Temple",
        "address": "Badrinath, Uttarakhand",
        "coordinates": "30.7433° N, 79.4938° E",
        "image": "🏔️",
      },
      {
        "name": "Ramanathaswamy Temple",
        "address": "Rameswaram, Tamil Nadu",
        "coordinates": "9.2881° N, 79.3174° E",
        "image": "🌊",
      },
    ],
    "Islam": [
      {
        "name": "Jama Masjid",
        "address": "Delhi, India",
        "coordinates": "28.6507° N, 77.2334° E",
        "image": "🕌",
      },
      {
        "name": "Haji Ali Dargah",
        "address": "Mumbai, Maharashtra",
        "coordinates": "18.9827° N, 72.8096° E",
        "image": "⭐",
      },
      {
        "name": "Makkah Masjid",
        "address": "Hyderabad, Telangana",
        "coordinates": "17.3616° N, 78.4747° E",
        "image": "🌙",
      },
    ],
    "Christianity": [
      {
        "name": "Basilica of Bom Jesus",
        "address": "Goa, India",
        "coordinates": "15.5009° N, 73.9116° E",
        "image": "⛪",
      },
      {
        "name": "St. Paul's Cathedral",
        "address": "Kolkata, West Bengal",
        "coordinates": "22.5448° N, 88.3526° E",
        "image": "✝️",
      },
    ],
    "Sikhism": [
      {
        "name": "Golden Temple (Harmandir Sahib)",
        "address": "Amritsar, Punjab",
        "coordinates": "31.6200° N, 74.8765° E",
        "image": "🏛️",
      },
      {
        "name": "Gurudwara Bangla Sahib",
        "address": "Delhi, India",
        "coordinates": "28.6261° N, 77.2090° E",
        "image": "🙏",
      },
    ],
    "Buddhism": [
      {
        "name": "Mahabodhi Temple",
        "address": "Bodh Gaya, Bihar",
        "coordinates": "24.6959° N, 84.9912° E",
        "image": "🧘",
      },
      {
        "name": "Sarnath Temple",
        "address": "Sarnath, Uttar Pradesh",
        "coordinates": "25.3776° N, 83.0214° E",
        "image": "☸️",
      },
    ],
    "Jainism": [
      {
        "name": "Dilwara Temples",
        "address": "Mount Abu, Rajasthan",
        "coordinates": "24.6119° N, 72.7231° E",
        "image": "🏯",
      },
      {
        "name": "Palitana Temples",
        "address": "Palitana, Gujarat",
        "coordinates": "21.5225° N, 71.8321° E",
        "image": "⛩️",
      },
    ],
    "Others": [
      {
        "name": "Lotus Temple",
        "address": "Delhi, India",
        "coordinates": "28.5535° N, 77.2588° E",
        "image": "🪷",
      },
    ],
  };

  @override
  void onInit() {
    super.onInit();
    loadReligions();
  }

  void loadReligions() {
    _isLoading.value = true;

    // Simulate loading delay
    Future.delayed(const Duration(milliseconds: 500), () {
      _religions.value = [
        Religion(
          name: 'Hinduism',
          emoji: '🕉️',
          places: getReligiousPlaces('Hinduism'),
        ),
        Religion(
          name: 'Islam',
          emoji: '☪️',
          places: getReligiousPlaces('Islam'),
        ),
        Religion(
          name: 'Christianity',
          emoji: '✝️',
          places: getReligiousPlaces('Christianity'),
        ),
        Religion(
          name: 'Sikhism',
          emoji: '☬',
          places: getReligiousPlaces('Sikhism'),
        ),
        Religion(
          name: 'Buddhism',
          emoji: '☸️',
          places: getReligiousPlaces('Buddhism'),
        ),
        Religion(
          name: 'Jainism',
          emoji: '🙏',
          places: getReligiousPlaces('Jainism'),
        ),
        Religion(
          name: 'Others',
          emoji: '🪷',
          places: getReligiousPlaces('Others'),
        ),
      ];
      _isLoading.value = false;
    });
  }

  List<ReligiousPlace> getReligiousPlaces(String religionName) {
    final placesData = _mockData[religionName] ?? [];
    return placesData.map((data) => ReligiousPlace.fromMap(data)).toList();
  }

  Religion? getReligionByName(String name) {
    try {
      return _religions.firstWhere((religion) => religion.name == name);
    } catch (e) {
      return null;
    }
  }

  void navigateToPlaces(String religionName) {
    Get.toNamed('/places', arguments: religionName);
  }
}
