import 'package:flutter/material.dart';
import 'package:won/Models/Country.dart';

class FlagButton extends StatelessWidget {
  const FlagButton({Key key, this.country, this.onTapped});

  final Country country;
  final Function onTapped;

  _flag(String countryFlagUrl) {
    return Image.network(countryFlagUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: RaisedButton(
        color: Colors.white12,
        elevation: 0,
        shape: RoundedRectangleBorder(),
        child: _flag(country.imageUrl),
        onPressed: onTapped,
      ),
    );
  }
}
