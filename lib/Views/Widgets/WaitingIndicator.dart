import 'package:flutter/cupertino.dart';

import "package:flutter/material.dart";

class WaitingIndicator extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [CircularProgressIndicator()],
      ),
    );
  }
}
