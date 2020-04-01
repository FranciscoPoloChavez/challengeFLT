import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:challenge/main.dart';
import 'package:challenge/Splash.dart';
import 'package:challenge/challenge.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;

//void main() => runApp(AddData(pobreza : fetchPost()));

String generateMd5(String input) {
  return crypto.md5.convert(utf8.encode(input)).toString();
}


class Pobreza{
  final String per;
  //final String nombre;
  //final int edad;

  Pobreza({this.per});
  factory Pobreza.fromJson(Map<String, dynamic> json){
    return Pobreza(
      per: json["country"],
      //nombre: json['nombre'],
    );
  }

}

/*
Future<Pobreza> fetchPost() async{
  final response = await http.get("https://statbank.cso.ie/StatbankServices/StatbankServices.svc/jsonservice/responseinstance/SIA49");
  if(response.statusCode==200) {
    return Pobreza.fromJson(json.decode(response.body));
  }else{
    throw Exception("Fallo");
  }
}
 */

class AddData extends StatefulWidget{
  Future<Pobreza> get per async => null;

  @override
  _AddDataState createState() => new _AddDataState(this.per);
  //final Future<Pobreza> pobreza;
  //AddData({Key key, this.pobreza}) : super(key: key);
}

class _AddDataState extends State<AddData>{


//  get pobreza => AddData();

  /*Future<Pobreza> fetchPost() async{
    final response = await http.get("https://statbank.cso.ie/StatbankServices/StatbankServices.svc/jsonservice/responseinstance/SIA49");
    if(response.statusCode==200) {
      return Pobreza.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo");
    }
  }
  */

  Future<List<Pobreza>> getPobreza()async{
    var data = await http.get("https://statbank.cso.ie/StatbankServices/StatbankServices.svc/jsonservice/responseinstance/SIA49");
    var jsonData = json.decode(data.body);
    List<Pobreza> personas = [];
    var dataPersonas = jsonData["country"];
    var personasArray = dataPersonas["results"];
    for(var per in personasArray){
      Pobreza pobreza = Pobreza();
      print("PERSONA-AÑO: " + pobreza.per);
      personas.add(pobreza);
    }
    return personas;
  }


  /*
  @override
  void initState() {
    super.initState();
    //Timer(Duration(seconds: 5), () => runApp(MyApp()));
  }
   */

  final Future<Pobreza> pobreza;
  //_AddDataState({Key key, this.pobreza}) : super(key: key);
  _AddDataState(this.pobreza);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Leer JSON",
        home: Scaffold(
          body: Center(
            child: FutureBuilder<Pobreza>(
                future: pobreza,
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index){
                      return ListTile(
                        title: Text(snapshot.data[index].per)
                      );
                    });
                    //return Text(snapshot.data.per);
                  }else if(snapshot.data == null){
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                }),
          ),
        )
    );
  }

}

