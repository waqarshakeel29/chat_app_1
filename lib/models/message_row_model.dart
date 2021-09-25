class MessageRowModel {
  final String name;
  final String lastMessage;
  final String time;
  String imageUrl;
  bool isRead;

  MessageRowModel(
      {required this.name,
      required this.lastMessage,
      required this.time,
      required this.imageUrl,
      this.isRead = true});
}
