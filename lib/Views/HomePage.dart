import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:won/Models/Country.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Country> countries = new List<Country>();

  @override
  void initState() {
    Firestore.instance.collection("countries").getDocuments().then((value) {
      for (var item in value.documents) {
        setState(() {
          countries.add(Country.fromJson(item.data));
        });
      }
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
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(3),
                    child: SizedBox(
                        child: Material(
                      shape: RoundedRectangleBorder(),
                      child: Image.network(countries[index].imageUrl),
                    )),
                  );
                },
              )
            ],
          ),
        ));
  }
}
