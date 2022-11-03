import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/data/DBHelper.dart';
import 'package:music/data/data_request.dart';
import 'package:music/data/music_contents.dart';
import 'package:sqflite/sqflite.dart';

class HomeMusic extends StatefulWidget {
  const HomeMusic({Key? key}) : super(key: key);
  @override
  _HomeMusic createState() => _HomeMusic();
}

class _HomeMusic extends State <HomeMusic> {
  @override
  Database db = DBHelper().initDB();
  List musicObject = MusicDatabase.musicObjects;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6E39F5),
      appBar: AppBar(
        backgroundColor: Color(0xFF180C36),
        title: const Text(
          'Study Musics',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: musicObject.length,
              itemBuilder: (context, index) {
                dynamic json = DataRequest().getData(id: index, db: db);
                return Card(
                  child: Column(
                    children: [
                      Text(
                        json['name'],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}