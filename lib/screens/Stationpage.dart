import 'package:flutter/material.dart';
import 'package:wat_monitor/screens/Homepage.dart';

class StationPage extends StatefulWidget {
  @override
  _StationPageState createState() => _StationPageState();
}

class _StationPageState extends State<StationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Homepage.Name),
          backgroundColor: Color(0xff08517C),
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
            children: [
              Container(
                width:  MediaQuery.of(context).size.width * 0.7,
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
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Text(
                        "1000 Litres",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: MediaQuery.of(context).size.width * 0.09,
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
                          margin : EdgeInsets.all(8),
                          child: Text(
                            "Quality",
                            style: TextStyle(
                              color: Color(0xff08517C),
                              fontWeight: FontWeight.w900,
                              fontSize: MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                        ),
                        Container(
                          margin : EdgeInsets.all(8),
                          child: Text(
                            "Bad",
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
                          margin : EdgeInsets.all(8),
                          child: Text(
                            "Endpoints",
                            style: TextStyle(
                              color: Color(0xff08517C),
                              fontWeight: FontWeight.w900,
                              fontSize: MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                        ),
                        Container(
                          margin : EdgeInsets.all(8),
                          child: Text(
                            "2",
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
              ),
              Waterdata(),
            ],

          ),
        ),
      ),
    );
  }
}

class Waterdata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          width:  MediaQuery.of(context).size.width * 0.7,
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
                margin : EdgeInsets.all(8),
                child: Text(
                  "Water Sent",
                  style: TextStyle(
                    color: Color(0xff08517C),
                    fontWeight: FontWeight.w900,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
              Container(
                margin : EdgeInsets.all(8),
                child: Text(
                  "200 Litres",
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
          width:  MediaQuery.of(context).size.width * 0.7,
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
                margin : EdgeInsets.all(8),
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
                margin : EdgeInsets.all(8),
                child: Text(
                  "100 Litres",
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
