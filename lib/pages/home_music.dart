import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/data/DBHelper.dart';
import 'package:music/data/data_request.dart';
import 'package:music/domain/music.dart';
import 'package:sqflite/sqflite.dart';

class HomeMusic extends StatefulWidget {
  const HomeMusic({Key? key}) : super(key: key);
  @override
  _HomeMusic createState() => _HomeMusic();
}

class _HomeMusic extends State <HomeMusic> {
  @override
  Future<List<Music>> musicList = DataRequest().buildDatabase();

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
              //precisa implementar o FutureBuilder
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              //itemCount: musicObject.length,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Text(
                        'iai'
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