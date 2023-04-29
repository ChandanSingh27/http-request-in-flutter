import 'Header.dart';
import 'Body.dart';

class Message {
  Message({
      this.header, 
      this.body,});

  Message.fromJson(dynamic json) {
    header = json['header'] != null ? Header.fromJson(json['header']) : null;
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Header? header;
  Body? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (header != null) {
      map['header'] = header?.toJson();
    }
    if (body != null) {
      map['body'] = body?.toJson();
    }
    return map;
  }

}