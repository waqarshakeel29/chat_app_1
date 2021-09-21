import 'package:chat_app_1/constants/theme.dart';
import 'package:flutter/material.dart';

class StatusCircle extends StatelessWidget {
  final String name;
  final bool? isViewed;
  final String? imageUrl;
  final bool isOnline;
  const StatusCircle(
      {Key? key,
      this.isViewed = false,
      this.imageUrl,
      required this.isOnline,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 70,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor:
                      isViewed! ? Colors.grey.shade400 : CustomTheme.primary,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(imageUrl!),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor:
                          isOnline ? Colors.grey.shade400 : CustomTheme.primary,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              name,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
