import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:challenge/main.dart';
import 'package:challenge/challenge.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;


//JSON part
void main() => runApp(new MyApp());

//Codigo antiguo y quite algunas clases de arriba revisar
String generateMd5(String input) {
  return crypto.md5.convert(utf8.encode(input)).toString();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: ('App Challenge!!!'),
      home: Home(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueAccent,
        primarySwatch: Colors.blue,
      )
      //debugShowCheckedModeBanner: false,
      //home: Scaffold(
        //appBar: AppBar(title:
        //Center(child: Text("App Challenge pac!")),),
        //body:
      );
  }
}


class InfinityDudes extends StatefulWidget{
  @override
  ListInfinityDudesState createState() => new ListInfinityDudesState();
}

class ListInfinityDudesState extends State<InfinityDudes>{
  Future<List<InfinityComic>> getDudes()async{
    var now = new DateTime.now();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}


class InfinityComic{
  //final String title;
  //final String cover;
  //InfinityComic(this.title, this.cover)
}

class InfinityDetail extends StatelessWidget{
  final InfinityComic infinityComic;
  InfinityDetail(this.infinityComic);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}


