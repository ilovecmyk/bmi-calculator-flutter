import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_CTA.dart';
import 'package:bmi_calculator/components/round_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender
      selectedGender; // variable to keep track of which value of gender was selected, kept empty (=null) to have the inactiveCardColor first for both
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment
            .stretch, // stretches all of its children to take up the full width of the column no matter its size
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardColor: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor, // reads: if selectedGender is male then choose activeCardColor, if not use inactiveCardColor
                    cardChild: IconTextContent(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardColor: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconTextContent(
                      cardIcon: FontAwesomeIcons.venus,
                      cardText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height
                            .toString(), //Text needs a string and the variable is an int, so we use toString
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      //instead of defining the whole theme by using SliderTHemeData, we can use of (context means this build context) and copyWith to only change what we need to change
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xFFEB1555), //color of handler
                      activeTrackColor: Colors.white, //color of tracking bar
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(
                          0x29EB1555), //overlay displayed when pressing handler
                    ),
                    child: Slider(
                      value: height
                          .toDouble(), //needed because value needs a double
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue
                              .round(); //rounding up to turn the double into an int
                        });
                        print(newValue);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressedButton: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(width: 10),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressedButton: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressedButton: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(width: 10),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressedButton: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomCTA(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc = CalculatorBrain( // creating the object calc of the bluebrint calculatorBrain
                  height: height,
                  weight: weight,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(), //accessing the functions in the calculaterBrain class
                    resultText: calc.getResult(), //variables defined in results_page which is imported here as well
                    interpretation: calc.getInterpretation(),
                  )),
                );
              }),
        ],
      ),
    );
  }
}
