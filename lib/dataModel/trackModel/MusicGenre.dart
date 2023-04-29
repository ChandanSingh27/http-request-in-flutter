class MusicGenre {
  MusicGenre({
      this.musicGenreId, 
      this.musicGenreParentId, 
      this.musicGenreName, 
      this.musicGenreNameExtended, 
      this.musicGenreVanity,});

  MusicGenre.fromJson(dynamic json) {
    musicGenreId = json['music_genre_id'];
    musicGenreParentId = json['music_genre_parent_id'];
    musicGenreName = json['music_genre_name'];
    musicGenreNameExtended = json['music_genre_name_extended'];
    musicGenreVanity = json['music_genre_vanity'];
  }
  int? musicGenreId;
  int? musicGenreParentId;
  String? musicGenreName;
  String? musicGenreNameExtended;
  String? musicGenreVanity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['music_genre_id'] = musicGenreId;
    map['music_genre_parent_id'] = musicGenreParentId;
    map['music_genre_name'] = musicGenreName;
    map['music_genre_name_extended'] = musicGenreNameExtended;
    map['music_genre_vanity'] = musicGenreVanity;
    return map;
  }

}