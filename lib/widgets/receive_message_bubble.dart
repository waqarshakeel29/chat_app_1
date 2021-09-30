import 'package:flutter/material.dart';

class ReceivedMessageBubble extends StatelessWidget {
  final String? message;
  final String? time;

  const ReceivedMessageBubble({
    Key? key,
    this.message,
    this.time,
  })  : assert(message != null),
        assert(time != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxBubbleWidth = constraints.maxWidth * 0.8;
        return Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxBubbleWidth,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(10.0),
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(message!,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16)),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          time!,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
