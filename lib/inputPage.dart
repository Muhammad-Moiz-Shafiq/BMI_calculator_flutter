import 'package:bmi/mainBrain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'customWidgets.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int selectedHeight = 180;
  int selectedWeight = 60;
  int selectedAge = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Cards(
                      selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      custom_icon(
                        FontAwesomeIcons.mars,
                        'MALE',
                      ), () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  }),
                ),
                Expanded(
                  child: Cards(
                    selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    custom_icon(
                      FontAwesomeIcons.venus,
                      'FEMALE',
                    ),
                    () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Cards(
              kActiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGTH',
                    style: klabelTextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        selectedHeight.toString(),
                        style: kNumberStyle,
                      ),
                      Text('cm', style: klabelTextStyle)
                    ],
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xff8d8e98),
                          thumbColor: Color(0xffeb1555),
                          overlayColor: Color(0x29eb1555),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15)),
                      child: Slider(
                        value: selectedHeight.toDouble(),
                        min: 120,
                        max: 240,
                        onChanged: (double newValue) {
                          setState(() {
                            selectedHeight = newValue.round();
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Cards(
                    kActiveCardColor,
                    Column(
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Text(
                          selectedWeight.toString(),
                          style: kNumberStyle,
                        ),
                        Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    selectedWeight--;
                                  });
                                }),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    selectedWeight++;
                                  });
                                }),
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Cards(
                      kActiveCardColor,
                      Column(
                        children: [
                          Text(
                            'AGE',
                            style: klabelTextStyle,
                          ),
                          Text(
                            selectedAge.toString(),
                            style: kNumberStyle,
                          ),
                          Expanded(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(FontAwesomeIcons.minus, () {
                                    setState(() {
                                      selectedAge--;
                                    });
                                  }),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RoundIconButton(FontAwesomeIcons.plus, () {
                                    setState(() {
                                      selectedAge++;
                                    });
                                  }),
                                ]),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              MainBrain bmi = MainBrain(selectedHeight, selectedWeight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ResultPage(
                      bmi.calculateBMI(), bmi.result(), bmi.explanation());
                }),
              );
            },
            child: Container(
              color: kBottomContainerColor,
              width: double.infinity,
              height: kBottomContainerHeight,
              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
