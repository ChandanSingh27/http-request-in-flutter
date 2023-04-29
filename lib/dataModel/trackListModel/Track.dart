import 'PrimaryGenres.dart';

class Track {
  Track({
      this.trackId, 
      this.trackName, 
      this.trackNameTranslationList, 
      this.trackRating, 
      this.commontrackId, 
      this.instrumental, 
      this.explicit, 
      this.hasLyrics, 
      this.hasSubtitles, 
      this.hasRichsync, 
      this.numFavourite, 
      this.albumId, 
      this.albumName, 
      this.artistId, 
      this.artistName, 
      this.trackShareUrl, 
      this.trackEditUrl, 
      this.restricted, 
      this.updatedTime, 
      this.primaryGenres,});

  Track.fromJson(dynamic json) {
    trackId = json['track_id'];
    trackName = json['track_name'];
    if (json['track_name_translation_list'] != null) {
      trackNameTranslationList = [];
      json['track_name_translation_list'].forEach((v) {
        trackNameTranslationList?.add(Dynamic.fromJson(v));
      });
    }
    trackRating = json['track_rating'];
    commontrackId = json['commontrack_id'];
    instrumental = json['instrumental'];
    explicit = json['explicit'];
    hasLyrics = json['has_lyrics'];
    hasSubtitles = json['has_subtitles'];
    hasRichsync = json['has_richsync'];
    numFavourite = json['num_favourite'];
    albumId = json['album_id'];
    albumName = json['album_name'];
    artistId = json['artist_id'];
    artistName = json['artist_name'];
    trackShareUrl = json['track_share_url'];
    trackEditUrl = json['track_edit_url'];
    restricted = json['restricted'];
    updatedTime = json['updated_time'];
    primaryGenres = json['primary_genres'] != null ? PrimaryGenres.fromJson(json['primary_genres']) : null;
  }
  int? trackId;
  String? trackName;
  List<dynamic>? trackNameTranslationList;
  int? trackRating;
  int? commontrackId;
  int? instrumental;
  int? explicit;
  int? hasLyrics;
  int? hasSubtitles;
  int? hasRichsync;
  int? numFavourite;
  int? albumId;
  String? albumName;
  int? artistId;
  String? artistName;
  String? trackShareUrl;
  String? trackEditUrl;
  int? restricted;
  String? updatedTime;
  PrimaryGenres? primaryGenres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['track_id'] = trackId;
    map['track_name'] = trackName;
    if (trackNameTranslationList != null) {
      map['track_name_translation_list'] = trackNameTranslationList?.map((v) => v.toJson()).toList();
    }
    map['track_rating'] = trackRating;
    map['commontrack_id'] = commontrackId;
    map['instrumental'] = instrumental;
    map['explicit'] = explicit;
    map['has_lyrics'] = hasLyrics;
    map['has_subtitles'] = hasSubtitles;
    map['has_richsync'] = hasRichsync;
    map['num_favourite'] = numFavourite;
    map['album_id'] = albumId;
    map['album_name'] = albumName;
    map['artist_id'] = artistId;
    map['artist_name'] = artistName;
    map['track_share_url'] = trackShareUrl;
    map['track_edit_url'] = trackEditUrl;
    map['restricted'] = restricted;
    map['updated_time'] = updatedTime;
    if (primaryGenres != null) {
      map['primary_genres'] = primaryGenres?.toJson();
    }
    return map;
  }

}

class Dynamic {
  static fromJson(v) {}
}