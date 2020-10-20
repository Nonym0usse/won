import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Map<String, dynamic> countries;

  @override
  void initState() {
    Firestore.instance
        .collection("countries")
        .document("country_flags")
        .snapshots()
        .listen((event) {
      setState(() {
        countries = event.data;
        print(countries);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Text("Quelle langue souhaitez-vous apprendre?"),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(3),
                    child: SizedBox(
                        child: Material(
                      shape: RoundedRectangleBorder(),
                      child: Image.network(countries['France']),
                    )),
                  );
                },
              )
            ],
          ),
        ));
  }
}
