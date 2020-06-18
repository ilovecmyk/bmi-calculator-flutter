import 'package:flutter/material.dart';

/*common case of constant usage to pool variables at top to be able to easily change them*/

const kBottomContainerHeight =
    80.0; // can be a constant as it can be worked out at the time a run starts
const kActiveCardColor =
    Color(0xFF1D1E33); // constants should always start with k
const kInactiveCardColor = Color(0xFF111328);
const kBottomContainerColor = Color(0xFFEB1555);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);
