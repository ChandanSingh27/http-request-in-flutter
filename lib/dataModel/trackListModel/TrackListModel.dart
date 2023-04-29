import 'Message.dart';

class TrackListModel {
  TrackListModel({
      this.message,});

  TrackListModel.fromJson(dynamic json) {
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