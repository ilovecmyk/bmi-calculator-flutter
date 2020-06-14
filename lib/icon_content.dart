import 'package:flutter/material.dart';

class IconTextContent extends StatelessWidget {
  /* const IconTextContent({
    Key key,
  }) : super(key: key);*/ //default constructor, can be removed
  IconTextContent(
      {@required this.cardIcon,
      @required this.cardText}); // curly braces = named properties
  final IconData cardIcon;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardText,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}
