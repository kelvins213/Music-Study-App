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
            child: FutureBuilder <List<Music>>(
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
                                  child: Image(
                                      image: NetworkImage(musics[index].imageLink),
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
          ),
        ],
      ),
    );
  }
}
