import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:won/Models/Country.dart';
import 'package:won/Views/Widgets/FlagButton.dart';

import 'LearningListsPage.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Country> countries = new List<Country>();

  _setFlags(List<Country> cList) {
    Firestore.instance.collection("countries").getDocuments().then((value) {
      for (var item in value.documents) {
        setState(() {
          cList.add(Country.fromJson(item.data));
        });
      }
    });
  }

  _learningLists(String countryName) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LearningListsPage(countryName)));
  }

  @override
  void initState() {
    _setFlags(countries);
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
                  return FlagButton(
                    country: countries[index],
                    onTapped: () {
                      _learningLists(countries[index].name);
                    },
                  );
                },
              )
            ],
          ),
        ));
  }
}
