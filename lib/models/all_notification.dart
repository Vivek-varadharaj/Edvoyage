class NotificationAll {
  NotificationAll({
    required this.success,
    required this.message,
    required this.data,
  });

  late final bool success;
  late final String message;
  late final List<Data> data;

  NotificationAll.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.notification_type,
    required this.content,
  });

  late final String notification_type;
  late final String content;

  Data.fromJson(Map<String, dynamic> json) {
    notification_type =
        json['notification_type'] ?? ''; // Initialize with a default value
    content = json['content'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['notification_type'] = notification_type;
    _data['content'] = content;
    return _data;
  }
}
