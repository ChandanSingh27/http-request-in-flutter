class Header {
  Header({
      this.statusCode, 
      this.executeTime,});

  Header.fromJson(dynamic json) {
    statusCode = json['status_code'];
    executeTime = json['execute_time'];
  }
  int? statusCode;
  double? executeTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = statusCode;
    map['execute_time'] = executeTime;
    return map;
  }

}