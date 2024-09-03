import 'dart:math';

class MainBrain {
  MainBrain(this.height, this.weight);
  final height;
  final weight;
  late double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result() {
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi > 18)
      return 'Normal';
    else
      return 'UnderWeight';
  }

  String explanation() {
    if (_bmi >= 25)
      return 'You should do exercise as your weight is more than normal';
    else if (_bmi >= 18)
      return 'You have good health, you can enjoy';
    else
      return 'You have less weight than normal so you can eat more';
  }
}
