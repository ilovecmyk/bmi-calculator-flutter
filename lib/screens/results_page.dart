import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_CTA.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15.0),
                child: Text('Your result:',
                    style: kLargeHeaderTextStyle,
                    textAlign: TextAlign.left),
              ),
            ),
            Expanded(
              flex:
                  5, //default flex 1, takes up relatively more space without having to define specific height
              child: ReusableCard(
                cardColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'OVERWEIGHT',
                      style: kResultTextStyle,
                    ),
                    Text(
                      '26.7',
                      style: kBMITextStyle,
                    ),
                    Text(
                      'You have a higher than normal body weight. Try to exercise more',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            BottomCTA(
                buttonTitle: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ));
  }
}
