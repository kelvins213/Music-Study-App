import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/data/api/playlist_api.dart';
import 'package:url_launcher/url_launcher.dart';

class JsonMusic extends StatefulWidget {
  final List musicJSONsObjects;

  const JsonMusic({Key? key, required this.musicJSONsObjects}) : super(key: key);
  @override
  _JsonMusic createState() => _JsonMusic();
}

class _JsonMusic extends State <JsonMusic>{
  @override
  TextEditingController musicNameController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController thumbnailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
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
      backgroundColor: const Color(0xFF9F9F9F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F4F4F),
        title: buildText(text: "Playlist"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        border: Border.all(color: Color(0xFF000000)),
                        borderRadius: BorderRadiusDirectional.circular(12),
                      ),
                      height: 64,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: CircleAvatar(
                                backgroundImage: NetworkImage(widget.musicJSONsObjects[index].thumbnail),
                                child: const Text(""),
                            ),
                          ),
                          buildText(text: widget.musicJSONsObjects[index].musicName),
                          ElevatedButton(
                              onPressed: () => onPressed(musicLink: widget.musicJSONsObjects[index].musicURL),
                              child: Icon(
                                Icons.play_arrow,
                                size: 44,
                              ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              primary: const Color(0xFF4F4F4F),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                  itemCount: widget.musicJSONsObjects.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
                const SizedBox(height: 8),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      returnAddMinusBottons(textDialog: "Inserir nova musica", buttonText: "Adicionar", icon: Icons.add, action: 0),
                      returnAddMinusBottons(textDialog: "Deletar musica", buttonText: "Deletar", icon: Icons.remove, action: 1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildText({required String text}){
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  returnAddMinusBottons({required String textDialog, required String buttonText,required IconData icon, required int action}){
    return ElevatedButton(
      onPressed: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return ListView(
              children: [
                AlertDialog(
                  actions: <Widget>[
                    ElevatedButton(
                        onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            String checkInfo = nameController.text;
                            print(musicNameController.text);
                            if (checkInfo.isEmpty) {
                              PlaylistAPI().insertMusicDatas(musicName: musicNameController.text, url: urlController.text, thumbnail: thumbnailController.text);
                              musicNameController.text = ""; urlController.text = ""; thumbnailController.text = "";
                            } else {
                              PlaylistAPI().deleteMusicRow(musicName: nameController.text);
                              nameController.text = "";
                            }
                            Navigator.of(context).pop();
                          }
                        },
                        child: buildText(text: buttonText)
                    ),
                  ],
                  title: buildText(text: textDialog),
                  content: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        returnTextFormField(textError: "Campo vazio", key: action),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Icon(
        icon,
        size: 50,
        color: const Color(0xFF4F4F4F),
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: const Color(0xFFEEEEEE),
      ),
    );
  }

  returnTextFormField({required String textError, required int key}){
    if (key == 0) {
      return Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Digite o nome da musica",
            ),
            validator: (value) {
              //a variavel value possui o nome da musica digitada pelo usuario
              if (value == null || value.isEmpty) {
                return textError;
              }
              return null;
            },
            controller: musicNameController,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Digite a URL da musica",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return textError;
              }
              return null;
            },
            controller: urlController,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Digite o link da thumbnail da musica",
            ),
            validator: (value) {
              //a variavel value possui o nome da musica digitada pelo usuario
              if (value == null || value.isEmpty) {
                return textError;
              }
              return null;
            },
            controller: thumbnailController,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Digite o nome da musica",
            ),
            validator: (value) {
              //a variavel value possui o nome da musica digitada pelo usuario
              if (value == null || value.isEmpty) {
                return textError;
              }
              return null;
            },
            controller: nameController,
          ),
        ],
      );
    }
  }

  onPressed({required String musicLink}){
    launchUrlMusic(urlString: musicLink);
  }

}