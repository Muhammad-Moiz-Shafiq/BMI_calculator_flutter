import 'package:flutter/material.dart';

const klabelTextStyle = TextStyle(
  color: Color(0xff8d8e98),
  fontSize: 18,
);
const kNumberStyle = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 50,
);
final Color kActiveCardColor = Color(0xff1d1e33);
final Color kInactiveCardColor = Color(0xff111328);
final double kBottomContainerHeight = 70;
final Color kBottomContainerColor = Color(0xFFEB1555);

enum Gender {
  male,
  female,
}

class Cards extends StatelessWidget {
  const Cards(this.colour, [this.cardChild, this.onPress]);
  final Color colour;
  final Widget? cardChild;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }
}

class custom_icon extends StatelessWidget {
  final IconData icon;
  final String title;
  custom_icon(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.icon, this.onPress);
  final IconData icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      child: Icon(icon),
      onPressed: onPress,
    );
  }
}
