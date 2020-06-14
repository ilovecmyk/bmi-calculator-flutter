import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/*common case of constant usage to pool variables at top to be able to easily change them*/
const bottomContainerHeight =
    80.0; // can be a constant as it can be worked out at the time a run starts
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: activeCardColor,
                    cardChild: IconTextContent(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: activeCardColor,
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
            child: ReusableCard(cardColor: activeCardColor),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(cardColor: activeCardColor),
                ),
                Expanded(
                  child: ReusableCard(cardColor: activeCardColor),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double
                .infinity, //stretches container over the whole width, regardless of phone size
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

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

class ReusableCard extends StatelessWidget {
  // custom card widget
  /*const ReusableCard({
    Key key,
  }) : super(key: key);*/ // key class = to keep track of the state of the widget
  ReusableCard(
      {@required this.cardColor,
      this.cardChild}); //constructor, everything in here will be initialized, things without @required don't have to be filled

  final Color
      cardColor; // Property, put 'final' makes the property immutable, meaning it can't be changed
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          cardChild, //by defining a child, we can reuse the same widget with different content
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: cardColor,
      ),
    );
  }
}
