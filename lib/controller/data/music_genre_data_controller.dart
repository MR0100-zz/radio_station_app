import 'package:get/get.dart';
import 'package:radio_station/model/music_genre_model.dart';

/// THIS CLASS CONTAINS MUSIC GENRE TYPES FOR SEARCH SCREEN...
class MusicGenreDataController extends GetxController {
  /// THIS LIST CONTAINS ALL THE MUSIC GENRE FOR SEARCH SCREEN...
  final List<MusicGenreModel> musicGenreList = [
    MusicGenreModel(title: "All"),
    MusicGenreModel(title: "Adult Contermporary"),
    MusicGenreModel(title: "Adult Rock"),
    MusicGenreModel(title: "Christian"),
    MusicGenreModel(title: "Classic Hits"),
    MusicGenreModel(title: "Classic Rock"),
    MusicGenreModel(title: "Comedy"),
    MusicGenreModel(title: "Country"),
    MusicGenreModel(title: "Dance"),
  ];
}
