enum CallStatus {
  missed,
  incoming,
  outgoing,
  received,
}

class CallRowModel {
  final String name;
  final String time;
  String imageUrl;
  final CallStatus callStatus;

  CallRowModel(
      {required this.name,
      required this.time,
      required this.imageUrl,
      required this.callStatus});
}
