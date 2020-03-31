import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:challenge/main.dart';
import 'package:challenge/Splash.dart';
import 'package:challenge/challenge.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;

class Gallery extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: new Center(
          child: new Container(
            width: 1080.0,
            height: 1920.0,
            child:
            Image.asset('assets/under.jpg')
          ),
        )
        ),
        );
  }

}