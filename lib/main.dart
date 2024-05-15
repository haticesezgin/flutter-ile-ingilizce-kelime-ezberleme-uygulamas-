
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:kelimeezberleme/pages/lists.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'pages/temprory.dart';

void main() async{
  var path = '/my/db/path';

  // Check if the platform is web
  if (kIsWeb) {
    // Change default factory on the web to use sqflite_common_ffi_web
    databaseFactory = databaseFactoryFfiWeb;
    path = 'my_web_web.db';
  }

  // Open the database
  var db = await openDatabase(path);



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);


    return MaterialApp(
      routes: {
        '/lists':(context)=>const ListsPage()
      },
      debugShowCheckedModeBanner: false,
      title: 'Kelime Ezbelerleme Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemproryPage(),
    );
  }
}


