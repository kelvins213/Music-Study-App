import 'package:flutter/cupertino.dart';

class JsonMusic extends StatefulWidget {
  final List<dynamic> musicJSONS;

  const JsonMusic({Key? key, required this.musicJSONS}) : super(key: key);
  @override
  _JsonMusic createState() => _JsonMusic();
}

class _JsonMusic extends State <JsonMusic> {
  @override

  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
            child: Row(
              children: [
                Text(
                  widget.musicJSONS[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          );
        },
      itemCount: widget.musicJSONS.length,
    );
  }
}