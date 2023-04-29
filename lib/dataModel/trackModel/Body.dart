import 'Track.dart';

class Body {
  Body({
      this.track,});

  Body.fromJson(dynamic json) {
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