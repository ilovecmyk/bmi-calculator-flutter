import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_CTA.dart';

class ResultsPage extends StatelessWidget {

ResultsPage({@required this.interpretation, @required this.bmiResult, @required this.resultText});

final String bmiResult;
final String resultText;
final String interpretation;


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
                  crossAxisAlignment: CrossAxisAlignment.center, //stretches the content to whole width of screen
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            BottomCTA(
                buttonTitle: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context); //using simply pop to destroy the screen and return to the previous one (without having to define that screen specifically)
                }),
          ],
        ));
  }
}
