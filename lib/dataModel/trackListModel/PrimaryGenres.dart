import 'MusicGenreList.dart';

class PrimaryGenres {
  PrimaryGenres({
      this.musicGenreList,});

  PrimaryGenres.fromJson(dynamic json) {
    if (json['music_genre_list'] != null) {
      musicGenreList = [];
      json['music_genre_list'].forEach((v) {
        musicGenreList?.add(MusicGenreList.fromJson(v));
      });
    }
  }
  List<MusicGenreList>? musicGenreList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (musicGenreList != null) {
      map['music_genre_list'] = musicGenreList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}