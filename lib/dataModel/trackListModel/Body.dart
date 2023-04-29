import 'TrackList.dart';

class Body {
  Body({
      this.trackList,});

  Body.fromJson(dynamic json) {
    if (json['track_list'] != null) {
      trackList = [];
      json['track_list'].forEach((v) {
        trackList?.add(TrackList.fromJson(v));
      });
    }
  }
  List<TrackList>? trackList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (trackList != null) {
      map['track_list'] = trackList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}