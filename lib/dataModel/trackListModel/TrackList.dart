import 'Track.dart';

class TrackList {
  TrackList({
      this.track,});

  TrackList.fromJson(dynamic json) {
    track = json['track'] != null ? Track.fromJson(json['track']) : null;
  }
  Track? track;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (track != null) {
      map['track'] = track?.toJson();
    }
    return map;
  }

}