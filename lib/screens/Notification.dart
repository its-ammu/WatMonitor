import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wat_monitor/NotificationPlugin.dart';
import 'package:wat_monitor/screens/Homepage.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  void initState() {
    super.initState();
    notificationPlugin
        .setListenerForLowerVersions(onNotificationInLowerVersions);
    notificationPlugin.setOnNotificationClick(onNotificationClick);
  }

  final dbRef = FirebaseDatabase.instance
      .reference()
      .child("Main Station 1")
      .orderByKey()
      .limitToLast(1);
  List<Map<dynamic, dynamic>> lists = [];
  List<Map<dynamic, dynamic>> lists1 = [];
  List<Map<dynamic, dynamic>> lists2 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Summary"),
        backgroundColor: Color(0xff08517C),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
                future: FirebaseDatabase.instance
                    .reference()
                    .child("Main Station 1")
                    .orderByKey()
                    .limitToLast(1)
                    .once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    lists.clear();
                    Map<dynamic, dynamic> values = snapshot.data.value;
                    values.forEach((key, values) {
                      lists.add(values);
                    });
                    print(lists[0]["Quality"]);
                    if (!(lists[0]["Quality"] > 6.5 &&
                        lists[0]["Quality"] < 8.5)) {
                      notificationPlugin.showNotification("Test", "Test");
                    }
                    if (lists[0]["Flowrate"] == 0) {
                      if (lists[0]["Limit"] != lists[0]["WaterRecieved"]) {
                        notificationPlugin.showNotification(
                            "There is a leakage", "Pipes in Main Station 1");
                      }
                    }
                    return new ListView.builder(
                        shrinkWrap: true,
                        itemCount: lists.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    "Main Station 1",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Flowrate: " +
                                      lists[index]["Flowrate"].toString()),
                                  Text("Quality: " +
                                      lists[index]["Quality"].toString()),
                                  Text("WaterRecieved: " +
                                      lists[index]["WaterRecieved"].toString()),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
            FutureBuilder(
                future: FirebaseDatabase.instance
                    .reference()
                    .child("Sub Station 1")
                    .orderByKey()
                    .limitToLast(1)
                    .once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    lists1.clear();
                    Map<dynamic, dynamic> values = snapshot.data.value;
                    values.forEach((key, values) {
                      lists1.add(values);
                    });
                    print(lists1[0]["Quality"]);
                    if (!(lists1[0]["Quality"] > 6.5 &&
                        lists1[0]["Quality"] < 8.5)) {
                      notificationPlugin.showNotification("Water Quality is bad", "In Sub Station 1");
                    }
                    if (lists1[0]["Flowrate"] == 0) {
                      if (lists1[0]["Limit"] != lists1[0]["WaterRecieved"]) {
                        notificationPlugin.showNotification(
                            "There is a leakage", "Pipes in Main Station 1");
                      }
                    }
                    return new ListView.builder(
                        shrinkWrap: true,
                        itemCount: lists.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    "Sub Station 1",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                      MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Flowrate: " +
                                      lists1[index]["Flowrate"].toString()),
                                  Text("Quality: " +
                                      lists1[index]["Quality"].toString()),
                                  Text("WaterRecieved: " +
                                      lists1[index]["WaterRecieved"].toString()),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
            FutureBuilder(
                future: FirebaseDatabase.instance
                    .reference()
                    .child("Sub Station 2")
                    .orderByKey()
                    .limitToLast(1)
                    .once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    lists2.clear();
                    Map<dynamic, dynamic> values = snapshot.data.value;
                    values.forEach((key, values) {
                      lists2.add(values);
                    });
                    print(lists2[0]["Quality"]);
                    if (!(lists2[0]["Quality"] > 6.5 &&
                        lists2[0]["Quality"] < 8.5)) {
                      notificationPlugin.showNotification("Water Quality is bad", "In Sub Station 1");
                    }
                    if (lists2[0]["Flowrate"] == 0) {
                      if (lists2[0]["Limit"] != lists2[0]["WaterRecieved"]) {
                        notificationPlugin.showNotification(
                            "There is a leakage", "Pipes in Main Station 1");
                      }
                    }
                    return new ListView.builder(
                        shrinkWrap: true,
                        itemCount: lists2.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    "Sub Station 2",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                      MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Flowrate: " +
                                      lists2[index]["Flowrate"].toString()),
                                  Text("Quality: " +
                                      lists2[index]["Quality"].toString()),
                                  Text("WaterRecieved: " +
                                      lists2[index]["WaterRecieved"].toString()),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                })
          ],
        ),
      ),
    );
  }

  onNotificationInLowerVersions(ReceivedNotification receivedNotification) {
    print('Notification Received ${receivedNotification.id}');
  }

  onNotificationClick(String payload) {
    print('Payload $payload');
  }
}

class NotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: const Offset(
                1.0,
                1.0,
              ),
              blurRadius: 40.0,
              spreadRadius: 0.0,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Notification Title",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 5,
            ),
            child: Text(
              "The Water Quality is bad in Main Station 1",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
