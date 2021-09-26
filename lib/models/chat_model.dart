enum MessageFrom {
  me,
  notMe,
}

class ChatModel {
  final String name;
  final String message;
  final String imageUrl;
  final int messageFrom;
  final String time;
  final String timestamp;

  ChatModel(
      {required this.name,
      required this.message,
      required this.imageUrl,
      required this.messageFrom,
      required this.time,
      required this.timestamp});

  ChatModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        message = json['message'],
        imageUrl = json['imageUrl'],
        messageFrom = json['messageFrom'],
        time = json['time'],
        timestamp = json['timestamp'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'message': message,
        'imageUrl': imageUrl,
        "messageFrom": messageFrom,
        'time': time,
        "timestamp": timestamp
      };
}
