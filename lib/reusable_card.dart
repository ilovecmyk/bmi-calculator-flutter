import 'package:flutter/material.dart';

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
