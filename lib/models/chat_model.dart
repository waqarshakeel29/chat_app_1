enum MessageFrom {
  me,
  notMe,
}

class ChatModel {
  final String name;
  final String message;
  final String imageUrl;
  final String time;
  final MessageFrom messageFrom;

  ChatModel(
      {required this.name,
      required this.message,
      required this.imageUrl,
      required this.time,
      required this.messageFrom});
}
