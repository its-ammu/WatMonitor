import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wat_monitor/AuthenticationService.dart';
import 'package:provider/provider.dart';
import 'package:wat_monitor/NotificationPlugin.dart';
import 'package:wat_monitor/screens/Stationpage.dart';
import 'package:wat_monitor/screens/Notification.dart';

class Homepage extends StatelessWidget {
  final ref = FirebaseDatabase.instance.reference();
  final stationName = Homepage.Name;

  static String Name;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          backgroundColor: Color(0xff08517C),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationPage(),
                  ),
                );
              },
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 7,
                ),
                child: Text(
                  "MAIN STATIONS",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    letterSpacing: MediaQuery.of(context).size.width * 0.008,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>StationPage(),
                    ),
                  );

                  Name = "Main Station 1";
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
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
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/MainStation.png",
                        ),
                      ),
                      Container(
                        child: Text("Main Station 1",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.04,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 7,
                ),
                child: Text(
                  "SUB STATIONS",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    letterSpacing: MediaQuery.of(context).size.width * 0.008,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>StationPage(),
                        ),
                      );
                      Name = "Sub Station 1";
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
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
                      margin: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              "assets/images/MainStation.png",
                            ),
                          ),
                          Container(
                            child: Text("Sub Station 1",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>StationPage(),
                        ),
                      );
                      Name = "Sub Station 2";
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
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
                      margin: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              "assets/images/MainStation.png",
                            ),
                          ),
                          Container(
                            child: Text("Sub Station 2",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<AuthenticationService>().signOut();
          },
          backgroundColor: Color(0xff08517C),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Image.asset("assets/images/logout.png"),
          ),
        ),
      ),
    );
  }
}

