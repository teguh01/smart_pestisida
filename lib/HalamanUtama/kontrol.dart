import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Kontrol extends StatefulWidget {

  Kontrol({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _KontrolState createState() => _KontrolState();
}

class _KontrolState extends State<Kontrol> {
  final DatabaseReference databaseReference = 
    FirebaseDatabase.instance.reference();

  void mesinAir1(){
    databaseReference.update({'mesin_air': 1});
  }

  void mesinAir0(){
    databaseReference.update({'mesin_air': 0});
  }

  void mesinBiopestisida1(){
    databaseReference.update({'mesin_bio': 1});
  }

  void mesinBiopestisida0(){
    databaseReference.update({'mesin_bio': 0});
  }

  void otomatisAir1(){
    databaseReference.update({'otomatis_air': 1});
  }

  void otomatisAir0(){
    databaseReference.update({'otomatis_air': 0});
  }

  void otomatisBio1(){
    databaseReference.update({'otomatis_bio': 1});
  }

  void otomatisBio0(){
    databaseReference.update({'otomatis_bio': 0});
  }

  void kondisiMesinAir(bool e){
    setState(() {
      if(e){
        messageAir = "On";
        mesinAir = true;
        e = true;
        mesinAir1();
      }
      else{
        messageAir = "Off";
        mesinAir = false;
        e = false;
        mesinAir0();
      }
    });
  }

  void kondisiMesinBio(bool f){
    setState(() {
      if(f){
        messageBio = "On";
        mesinBio = true;
        f = true;
        mesinBiopestisida1();
      }
      else{
        messageBio = "Off";
        mesinBio = false;
        f = false;
        mesinBiopestisida0();
      }
    });
  }

  void kondisiOtomatisAir(bool g){
    setState(() {
      if(g){
        messageOtomatisAir = "On";
        otomatisAir = true;
        g = true;
        otomatisAir1();
      }
      else{
        messageOtomatisAir = "Off";
        otomatisAir = false;
        g = false;
        otomatisAir0();
      }
    });
  }

  void kondisiOtomatisBio(bool h){
    setState(() {
      if(h){
        messageOtomatisBio = "On";
        otomatisBio = true;
        h = true;
        otomatisBio1();
      }
      else{
        messageOtomatisBio = "Off";
        otomatisBio = false;
        h = false;
        otomatisBio0();
      }
    });
  }

  bool mesinAir = false;
  String messageAir = "Off";

  bool mesinBio = false;
  String messageBio = "Off";

  bool otomatisAir = false;
  String messageOtomatisAir = "Off";

  bool otomatisBio = false;
  String messageOtomatisBio = "Off";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[           
            new Card(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new ButtonBar(
                    children: <Widget>[
                      new Text("MESIN AIR                                                    ",),
                      new Text(messageAir),
                      new Switch(
                        value: mesinAir, 
                        onChanged: (bool e) => kondisiMesinAir(e),
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            new Card(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new ButtonBar(
                    children: <Widget>[
                      new Text("MESIN BIOPESTISIDA                                ",),
                      new Text(messageBio),
                      new Switch(
                        value: mesinBio, 
                        onChanged: (bool f) => kondisiMesinBio(f),
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            new Card(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new ButtonBar(
                    children: <Widget>[
                      new Text("OTOMATIS AIR                                            ",),
                      new Text(messageOtomatisAir),
                      new Switch(
                        value: otomatisAir, 
                        onChanged: (bool g) => kondisiOtomatisAir(g),
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            new Card(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new ButtonBar(
                    children: <Widget>[
                      new Text("OTOMATIS BIOPESTISIDA                         ",),
                      new Text(messageOtomatisBio),
                      new Switch(
                        value: otomatisBio, 
                        onChanged: (bool h) => kondisiOtomatisBio(h),
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
