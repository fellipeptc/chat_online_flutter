import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  //const TextComposer({Key? key}) : super(key: key);
  TextComposer(this.sendMenssage);

  final Function({String text, File imgFile}) sendMenssage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {

  bool _isComposing = false;
  final TextEditingController _controller = new TextEditingController();

  void _reset(){
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  /*
  late File _arquivo;
  final picker = ImagePicker();
  Future getFileFromGallery() async {
    final file = await picker.getImage(source: ImageSource.gallery);
    _arquivo = File(file!.path);
    print(_arquivo.path);
  }
  */

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () async {
              final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
              final File imgFile = File(pickedFile!.path);
              if(imgFile != null){
                widget.sendMenssage(imgFile: imgFile);
              }else{
                return;
              }
            },
          ),
          Expanded(
              child: TextField(
                controller: _controller,
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration.collapsed(hintText: "Enviar uma Mensagem"),
                keyboardType: TextInputType.multiline,
                onChanged: (text){
                  setState(() {
                    _isComposing = text.isNotEmpty;
                  });
                },
                onSubmitted: (text){
                  widget.sendMenssage(text: text);
                  _reset();
                },
              ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposing ? (){
              widget.sendMenssage(text: _controller.text);
              _reset();
            } : null,
          ),
        ],
      ),
    );
  }
}
