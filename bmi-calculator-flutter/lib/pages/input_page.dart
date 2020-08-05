import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/gender_choose_widget.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

enum GenderEnum { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderEnum selectedGender;
  int height = 175;
  int weight = 75;
  int age = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardColor: selectedGender == GenderEnum.MALE
                          ? kACTIVE_CARD_COLOR
                          : kINACTIVE_CARD_COLOR,
                      childWidget: GenderChooseWidget(
                        genderIcon: FontAwesomeIcons.male,
                        genderName: "MALE",
                      ),
                      gestureFunction: () {
                        setState(() {
                          selectedGender = GenderEnum.MALE;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardColor: selectedGender == GenderEnum.FEMALE
                          ? kACTIVE_CARD_COLOR
                          : kINACTIVE_CARD_COLOR,
                      childWidget: GenderChooseWidget(
                        genderIcon: FontAwesomeIcons.female,
                        genderName: "FEMALE",
                      ),
                      gestureFunction: () {
                        setState(() {
                          selectedGender = GenderEnum.FEMALE;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardColor: kACTIVE_CARD_COLOR,
                      childWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "HEIGHT",
                            style: kTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                "cm",
                                style: kTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              thumbColor: Color(0xFF9e604f),
                              overlayColor: Color(0x299e604f),
                              activeTrackColor: kCALCULATE_BUTTON_COLOR,
                              inactiveTrackColor: kINACTIVE_CARD_COLOR,
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 100.0,
                              max: 230.0,
                              onChanged: (double) {
                                setState(() {
                                  height = double.round();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardColor: kACTIVE_CARD_COLOR,
                      childWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Weight",
                            style: kTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                weight.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                "kg",
                                style: kTextStyle,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                buttonFunction: () {
                                  if (weight > 0) {
                                    setState(() {
                                      weight--;
                                    });
                                  }
                                },
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              RoundedIconButton(
                                icon: FontAwesomeIcons.plus,
                                buttonFunction: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardColor: kACTIVE_CARD_COLOR,
                      childWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: kTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                buttonFunction: () {
                                  setState(() {
                                    if (age > 0) age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              RoundedIconButton(
                                icon: FontAwesomeIcons.plus,
                                buttonFunction: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onTap: () {
                CalculatorBrain brain =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiScore: brain.calculateBMI(),
                        bmiScoreCategory: brain.getResultText(),
                        bmiInterpretation: brain.getInterpretation(),
                      ),
                    ));
              },
              buttonTitle: "CALCULATE",
            )
          ],
        ));
  }
}

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final Function buttonFunction;

  RoundedIconButton({this.icon, this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: buttonFunction,
      constraints: BoxConstraints.tightFor(width: 46.0, height: 46.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C505E),
      elevation: 6.0,
    );
  }
}
