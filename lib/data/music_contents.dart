import 'package:music/domain/music.dart';

class MusicDatabase{

  static Music tipoMadara = Music(name: "Tipo Madata", link: "https://youtu.be/wCMzj9Gzyt0?list=RDMM", imageLink: "https://images3.alphacoders.com/695/695428.jpg");
  static Music afterParty = Music(name: "After Party", link: "https://youtu.be/GyR38LqBWEE?list=RDMM", imageLink: "https://i1.sndcdn.com/artworks-MUe0sOoezI9ORG2U-YTIzhA-t500x500.jpg");
  static Music feelLikeGod = Music(name: "Feel Like God", link: "https://youtu.be/Rxu-SeaLmlo?list=RDMM", imageLink: "https://i.ytimg.com/vi/kw-XWS1Usio/sddefault.jpg");
  static Music drunkAndNasty = Music(name: "Drunk and Nasty", link: "https://youtu.be/3T5rSK0rd7k?list=RDMM", imageLink: "https://m.media-amazon.com/images/I/71iG4caogJL._SS500_.jpg");
  static Music vibeZabuza = Music(name: "Vibe Zabuza", link: "https://youtu.be/x6VWj8JeyIU?list=RDMM", imageLink: "https://besthqwallpapers.com/Uploads/6-12-2019/114238/thumb2-zabuza-momochi-4k-naruto-characters-momochi-zabuza-manga.jpg");

  static List<Music> musicObjects = [
    tipoMadara,
    afterParty,
    feelLikeGod,
    drunkAndNasty,
    vibeZabuza,
  ];

}