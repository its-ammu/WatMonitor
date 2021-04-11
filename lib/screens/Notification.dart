import 'package:flutter/material.dart';
import 'package:wat_monitor/NotificationPlugin.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Color(0xff08517C),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                await notificationPlugin.showNotification();
              },
              child: NotificationWidget(),
            ),
            NotificationWidget(),
            NotificationWidget(),
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
