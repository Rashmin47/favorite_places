import 'dart:io';

import 'package:favorite_places/model/place.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class UserPlacesNotifier extends StateNotifier<List<Place>>{
  UserPlacesNotifier() : super(const []);
  void addPlace(String title, File image) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$filename');
    final newPlace = Place(title: title, image: copiedImage);
    state = [newPlace,...state];
  }
}

final userPlacesProvider = StateNotifierProvider<UserPlacesNotifier,List<Place> >((ref) => UserPlacesNotifier());