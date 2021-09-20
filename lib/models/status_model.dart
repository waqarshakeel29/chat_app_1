class StatusModel {
  final bool isViewed;
  final String imageUrl;
  final bool isOnline;
  final String name;

  StatusModel(
      {required this.isViewed,
      required this.imageUrl,
      required this.isOnline,
      required this.name});
}
