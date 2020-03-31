import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:challenge/main.dart';
import 'package:challenge/Splash.dart';
import 'package:challenge/challenge.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;

void main() => runApp(AddData(pobreza : fetchPost()));

class Pobreza{
  final String year;
  //final String nombre;
  //final int edad;

  Pobreza({this.year});
  factory Pobreza.fromJson(Map<String, dynamic> json){
    return Pobreza(
      year: json['year'],
      //nombre: json['nombre'],
    );
  }

}

Future<Pobreza> fetchPost() async{
  final response = await http.get("https://statbank.cso.ie/StatbankServices/StatbankServices.svc/jsonservice/responseinstance/SIA49");
  if(response.statusCode==200) {
    return Pobreza.fromJson(json.decode(response.body));
  }else{
    throw Exception("Fallo");
  }
}

class AddData extends StatefulWidget{
  @override
  _AddDataState createState() => new _AddDataState();
  final Future<Pobreza> pobreza;
  AddData({Key key, this.pobreza}) : super(key: key);
}

class _AddDataState extends State<AddData>{
  get pobreza => AddData();

  /*
  @override
  void initState() {
    super.initState();
    //Timer(Duration(seconds: 5), () => runApp(MyApp()));
  }
   */

//  final Future<Pobreza> pobreza;
//  _AddDataState({Key key, this.pobreza}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Leer JSON",
      home: Scaffold(
        body: Center(
          child: FutureBuilder<Pobreza>(
            future: pobreza,
            builder: (context, snapshot){
            if(snapshot.hasData){
              return Text(snapshot.data.year);
            }else if(snapshot.hasError){
              return Text("${snapshot.error}");
            }
            //return CircularProgressIndicator();
        }),
        ),
      )
    );
  }

}

