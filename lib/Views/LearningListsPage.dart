import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:won/Models/LearningList.dart';
import 'package:won/Views/Widgets/WaitingIndicator.dart';

class LearningListsPage extends StatefulWidget {
  final String countryName;

  LearningListsPage(this.countryName);

  @override
  LearningListsPageState createState() =>
      new LearningListsPageState(this.countryName);
}

class LearningListsPageState extends State<LearningListsPage> {
  final String cStateName;
  LearningListsPageState(this.cStateName);

  List<LearningList> lists = new List<LearningList>();

  _getLists(countryName) {
    Firestore.instance
        .collection("learning-lists")
        .getDocuments()
        .then((value) {
      for (var item in value.documents) {
        setState(() {
          lists.add(LearningList.fromJson(item.data));
        });
      }
    });
  }

  @override
  void initState() {
    _getLists(cStateName);
    super.initState();
  }

  // --- RENDERING --- //

  Widget listsWidget(BuildContext context) {
    if (lists.isEmpty) {
      return WaitingIndicator();
    } else {
      return Center(
          child: ListView.builder(
        itemCount: lists.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue),
                child: FlatButton(
                  child: Text(lists[index].title),
                  onPressed: () {},
                ),
              ));
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cStateName),
      ),
      body: listsWidget(context),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
    );
  }
}
