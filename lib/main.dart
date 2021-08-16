import 'package:chat_flutter/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //obrigatório para rodar Firebase

  runApp(MyApp());

  /*
  Firebase.initializeApp().whenComplete(() async {
    //escrever dados no firebase
    FirebaseFirestore.instance.collection("mensagens").doc("msg1").update({
      "texto" : "bora jogar lol?",
    });
  });
   */

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat Flutter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        iconTheme: IconThemeData(
          color: Colors.green,
        ),
      ),
      home: ChatScreen(),
    );
  }
}
