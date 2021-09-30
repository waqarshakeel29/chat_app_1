enum MessageFrom {
  me,
  notMe,
}

class ChatModel {
  final String name;
  final String message;
  final String imageUrl;
  final String senderUid;
  final String receiverUid;
  final String timestamp;

  ChatModel(
      {
      required this.name,
      required this.message,
      required this.imageUrl,
      required this.senderUid,
      required this.receiverUid,
      required this.timestamp});

  ChatModel.fromJson(Map<String, dynamic> json)
      : 
        name = json['name'],
        message = json['message'],
        imageUrl = json['imageUrl'],
        senderUid = json['senderUid'],
        receiverUid = json['receiverUid'],
        timestamp = json['timestamp'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'message': message,
        'imageUrl': imageUrl,
        "senderUid": senderUid,
        "receiverUid": receiverUid,
        "timestamp": timestamp
      };
}
