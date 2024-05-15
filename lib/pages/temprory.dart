import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelimeezberleme/db/db/shared_preferences.dart';
import 'package:kelimeezberleme/pages/main.dart';
import '../global_variable.dart';

class TemproryPage extends StatefulWidget {
  const TemproryPage({Key? key}) : super(key: key);

  @override
  _TemproryPageState createState() => _TemproryPageState();
}

class _TemproryPageState extends State<TemproryPage> {




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const MainPage()));
    });

    spRead();
    setFirebase();
  }

  void setFirebase() async
  {
    await Firebase.initializeApp();
    FirebaseMessaging messaging =  FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

  }


  void spRead() async
  {
    if(await SP.read('lang') == true)
    {
      chooseLang = Lang.eng;
    }
    else
    {
      chooseLang = Lang.tr;
    }


    switch(await SP.read('which'))
    {
      case 0:
        chooseQuestionType = Which.learned;
        break;
      case 1:
        chooseQuestionType = Which.unlearned;
        break;
      case 2:
        chooseQuestionType = Which.all;
        break;
    }


    if(await SP.read('mix') == false)
    {
      listMixed = false;
    }


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset("asset/images/logo.png",height: 130,width: 110),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text("QUEAZY",style: TextStyle(color: Colors.black,fontFamily: "Luck",fontSize: 40 ),),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("İstediğini Öğren!",style: TextStyle(color: Colors.black,fontFamily: "Carter",fontSize: 25 ),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
