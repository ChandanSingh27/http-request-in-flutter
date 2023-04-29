import 'Message.dart';

class TrackInfoDetails {
  TrackInfoDetails({
      this.message,});

  TrackInfoDetails.fromJson(dynamic json) {
    message = json['message'] != null ? Message.fromJson(json['message']) : null;
  }
  Message? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (message != null) {
      map['message'] = message?.toJson();
    }
    return map;
  }

}