import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'sensor.dart';

class Monitoring extends StatefulWidget {
  @override
  _MonitoringState createState() => _MonitoringState();
}

class _MonitoringState extends State<Monitoring> {

  DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child('realtime_monitoring');

  @override
  Widget build(BuildContext context) {
    return mainScaffold();
  }

  Widget mainScaffold(){
    return Scaffold(
      body: StreamBuilder(
        stream: databaseReference.onValue,
        builder: (context, snapshot){
          if(snapshot.hasData && 
             !snapshot.hasError && 
             snapshot.data.snapshot.value != null){
            var _sensor = Sensor.fromJson(snapshot.data.snapshot.value);
            return tampilData(_sensor);
          }         
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }

  Widget tampilData(Sensor _sensor){
    return Center(
      child: ListView(
        padding: new EdgeInsets.all(10.0),
        children: <Widget>[
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("Aliran Air = ${_sensor.aliranAir}"),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("Aliran Bio = ${_sensor.aliranBio}"),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("Hari = ${_sensor.hari}"),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("Jam = ${_sensor.jam}"),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("Kecepatan Angin = ${_sensor.kecepatanAngin}"),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("Kelembapan = ${_sensor.kelembapan}"),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("Kondisi Lahan = ${_sensor.kondisiLahan}"),
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text("Suhu = ${_sensor.suhu}"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}