import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:challenge/main.dart';
import 'package:challenge/Splash.dart';
import 'package:challenge/adddata.dart';
import 'package:challenge/gallery.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;

class Home extends StatefulWidget{
  HomeState createState() => HomeState();
}

class HomeState extends State<Home>{
  int _selectDrawerItem = 3;
  _getDrawerItemWidget(int pos){
    switch(pos){
      case 0: return AddData();
      case 1: return Gallery();
    }
  }

  _onSelectItem(int pos){
    setState(() {
      Navigator.of(context).pop();
      _selectDrawerItem = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Challenge!!!'),
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Frencisco Polo'),
                accountEmail: Text('A01335458@itesm.mx'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 5.0,
                  child: Icon(Icons.account_circle,
                    color: Colors.white,
                    size: 60.0,
                  ),
                ),
              ),
              ListTile(
                title: Text("Add Data",
                style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
                leading: Icon(Icons.add),
                selected: (0 == _selectDrawerItem),
                onTap: (){
                  _onSelectItem(0);
                },
              ),
              ListTile(
                title: Text("Gallery",
                  style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),),
                leading: Icon(Icons.photo_library),
                selected: (1 == _selectDrawerItem),
                onTap: (){
                  _onSelectItem(1);
                },
              ),
              Divider(),
              ListTile(
                title: Text("Logout",
                style: TextStyle(color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
                leading: Icon(Icons.exit_to_app),
                selected: (2 == _selectDrawerItem),
                onTap: (){
                  _onSelectItem(2);
                },
              )
            ],
          )
      ),
      body: _getDrawerItemWidget(_selectDrawerItem),
    );
  }
}