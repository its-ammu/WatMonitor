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

  List<Map<dynamic, dynamic>> lists = [];

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
            Stationcheck("Main Station 1"),
            Stationcheck("Sub Station 1"),
            Stationcheck("Sub Station 2"),
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

class Stationcheck extends StatelessWidget {
  @override
  String station;
  List<Map<dynamic, dynamic>> lists = [];
  Stationcheck(this.station);

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseDatabase.instance
            .reference()
            .child(station)
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
              notificationPlugin.showNotification("Water quality is bad", "In "+ station);
            }
            if (lists[0]["Flowrate"] == 0) {
              if (lists[0]["Limit"] != lists[0]["WaterRecieved"]) {
                notificationPlugin.showNotification(
                    "There is a leakage", "Pipes in " + station);
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
                            station,
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
        });
  }
}






