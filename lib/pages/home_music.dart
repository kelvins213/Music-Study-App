import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/data/data_request.dart';
import 'package:music/domain/music.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeMusic extends StatefulWidget {
  const HomeMusic({Key? key}) : super(key: key);
  @override
  _HomeMusic createState() => _HomeMusic();
}

class _HomeMusic extends State <HomeMusic> {
  @override
  Future<List<Music>> musicList = DataRequest().buildDatabase();

  Future<void> launchUrlMusic({required String urlString}) async{
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Could not launch $url";
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9F9F9F),
      appBar: AppBar(
        backgroundColor: Color(0xFF4F4F4F),
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0,3.0,18.0,18.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      border: Border.all(color: Color(0xFF000000)),
                      borderRadius: BorderRadiusDirectional.circular(12),
                    ),
                    width: MediaQuery.of(context).size.width - 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        returnIcon(icon: Icons.book),
                        returnIcon(icon: Icons.play_arrow),
                        returnIcon(icon: Icons.pause_circle),
                      ],
                    ),
                  ),
                ),
                FutureBuilder <List<Music>>(
                    future: musicList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Music> musics = snapshot.data ?? [];
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: musics.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 36);
                          },
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF000000)),
                                color: Color(0xFFEEEEEE),
                              ),
                              height: 460,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 260,
                                    child: AspectRatio(
                                      aspectRatio: 4/3,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(musics[index].imageLink),
                                        child: const Text(""),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: InkWell(
                                      child: Container(
                                        height: 95,
                                        width: MediaQuery.of(context).size.width - 16,
                                        color: Color(0xFF777777),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.music_note,
                                              size: 50,
                                            ),
                                            Text(
                                              '${musics[index].name}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 36,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () => launchUrlMusic(urlString: musics[index].link),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF000000),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                returnText(text: "Enjoy Your Study Music!", size: 23),
                returnText(text: "Copyright Ⓒ2022, All Rights Reserved.", size: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }

  returnText({required String text, required double size}){
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: Colors.white,
      ),
    );
  }

  returnIcon({required IconData icon}){
    return Icon(
      icon,
      size: 50,
    );
  }

}
