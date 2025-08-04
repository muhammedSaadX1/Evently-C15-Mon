import 'package:flutter/cupertino.dart';

extension ContextExtension on BuildContext{
  double get screenWidth => MediaQuery.of(this).size.width;
}