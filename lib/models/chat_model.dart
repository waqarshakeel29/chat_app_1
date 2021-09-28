enum MessageFrom {
  me,
  notMe,
}

class ChatModel {
  final String name;
  final String message;
  final String imageUrl;
  final String messageFromUid;
  final String timestamp;

  ChatModel(
      {
      required this.name,
      required this.message,
      required this.imageUrl,
      required this.messageFromUid,
      required this.timestamp});

  ChatModel.fromJson(Map<String, dynamic> json)
      : 
        name = json['name'],
        message = json['message'],
        imageUrl = json['imageUrl'],
        messageFromUid = json['messageFromUid'],
        timestamp = json['timestamp'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'message': message,
        'imageUrl': imageUrl,
        "messageFromUid": messageFromUid,
        "timestamp": timestamp
      };
}
