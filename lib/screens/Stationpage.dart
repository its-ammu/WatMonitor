import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wat_monitor/NotificationPlugin.dart';
import 'package:wat_monitor/screens/Homepage.dart';

class StationPage extends StatefulWidget {
  final FirebaseApp app;

  StationPage({this.app});

  @override
  _StationPageState createState() => _StationPageState();
}

class _StationPageState extends State<StationPage> {
  @override

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Homepage.Name),
          backgroundColor: Color(0xff08517C),
        ),
        body: Container(
          child: info(),

        ),
      ),
    );
  }
}

class info extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance
      .reference()
      .child(Homepage.Name)
      .orderByKey()
      .limitToLast(1);
  List<Map<dynamic, dynamic>> lists = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: dbRef.once(),
          builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
            if (snapshot.hasData) {
              lists.clear();
              Map<dynamic, dynamic> values = snapshot.data.value;
              values.forEach((key, values) {
                lists.add(values);
              });
              return new ListView.builder(
                  shrinkWrap: true,
                  itemCount: lists.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/bg.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xff08517C),
                                    width: 1.0,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      offset: const Offset(
                                        5.0,
                                        5.0,
                                      ),
                                      blurRadius: 10.0,
                                      spreadRadius: 1.0,
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(8),
                                    child: Text(
                                      "Water Limit",
                                      style: TextStyle(
                                        color: Color(0xff08517C),
                                        fontWeight: FontWeight.w900,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(8),
                                    child: Text(
                                      lists[index]["Limit"].toString() +
                                          " Litres",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.09,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Color(0xff08517C),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          offset: const Offset(
                                            5.0,
                                            5.0,
                                          ),
                                          blurRadius: 10.0,
                                          spreadRadius: 1.0,
                                        )
                                      ]),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(8),
                                        child: Text(
                                          "Quality",
                                          style: TextStyle(
                                            color: Color(0xff08517C),
                                            fontWeight: FontWeight.w900,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(8),
                                        child: Text(
                                          getQuality(lists[index]["Quality"]),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Color(0xff08517C),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          offset: const Offset(
                                            5.0,
                                            5.0,
                                          ),
                                          blurRadius: 10.0,
                                          spreadRadius: 1.0,
                                        )
                                      ]),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(8),
                                        child: Text(
                                          "Endpoints",
                                          style: TextStyle(
                                            color: Color(0xff08517C),
                                            fontWeight: FontWeight.w900,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(8),
                                        child: Text(
                                          lists[index]["Endpoints"].toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Waterdata(lists[index]["WaterRecieved"],
                                lists[index]["Flowrate"]),
                          ],
                        ),
                      ),
                      // Text("Flowrate: " + lists[index]["Flowrate"].toString()),
                      // Text("Quality: "+ lists[index]["Quality"].toString()),
                      // Text("WaterRecieved: " +lists[index]["WaterRecieved"].toString()),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );

  }

  String getQuality(double quality) {
    if (quality > 6.5 && quality < 8.5) {
      return "Good";
    } else {
      return "Bad";
    }
  }
}

class Waterdata extends StatelessWidget {
  final recieved;
  final rate;

  Waterdata(this.recieved, this.rate);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color(0xff08517C),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                )
              ]),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  "Water Recieved",
                  style: TextStyle(
                    color: Color(0xff08517C),
                    fontWeight: FontWeight.w900,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  recieved.toString() + " Litres",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color(0xff08517C),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                )
              ]),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  "Flow Rate",
                  style: TextStyle(
                    color: Color(0xff08517C),
                    fontWeight: FontWeight.w900,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  rate.toString() + " Litres/Minute",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
