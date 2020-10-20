import 'package:flutter/material.dart';

class FlagButton extends StatelessWidget {
  const FlagButton({Key key, this.country, this.onTapped});

  final String country;
  final Function onTapped;

  static const Map<String, String> countries = {};

  _flag(String countryName) {}

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: CircleBorder(),
      child: Column(
        children: [
          Material(
            shape: CircleBorder(),
            child: ClipOval(
              child: _flag(country),
            ),
          )
        ],
      ),
      onPressed: onTapped,
    );
  }
}
