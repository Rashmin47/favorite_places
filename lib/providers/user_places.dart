import 'package:favorite_places/model/place.dart';
import 'package:flutter_riverpod/legacy.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>>{
  UserPlacesNotifier() : super(const []);
  void addPlace(String title) {
    final newPlace = Place(title: title);
    state = [newPlace,...state];
  }
}

final userPlacesProvider = StateNotifierProvider((ref) => UserPlacesNotifier());