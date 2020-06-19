import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomCTA extends StatelessWidget {

BottomCTA({@required this.onTap, @required this.buttonTitle});

final Function onTap;
final String buttonTitle;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(buttonTitle, style: kLargeButtonextStyle),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double
            .infinity, //stretches container over the whole width, regardless of phone size
        height: kBottomContainerHeight,
      ),
    );
  }
}