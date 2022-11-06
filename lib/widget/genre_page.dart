import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenrePage extends StatefulWidget {
  final String name;
  final String musicLink;

  GenrePage({
    Key? key,
    required this.name,
    required this.musicLink,
  }) : super(key: key);
  @override
  _GenrePage createState() => _GenrePage();
}

class _GenrePage extends State <GenrePage> {
  @override

  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: [
          Text(
            '${widget.name}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}