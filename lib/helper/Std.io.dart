import 'dart:math';

double doubleRounding(double i) {
  int decimals = 2;
  int fac = pow(10, decimals);

  i = (i * fac).round() / fac;
  return i;
}
