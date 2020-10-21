import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cStateName),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text("A"),
                ));
          },
        ),
      ),
    );
  }
}
