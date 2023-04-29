import 'MusicGenre.dart';

class MusicGenreList {
  MusicGenreList({
      this.musicGenre,});

  MusicGenreList.fromJson(dynamic json) {
    musicGenre = json['music_genre'] != null ? MusicGenre.fromJson(json['music_genre']) : null;
  }
  MusicGenre? musicGenre;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (musicGenre != null) {
      map['music_genre'] = musicGenre?.toJson();
    }
    return map;
  }

}