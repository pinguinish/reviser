import 'package:flutter/services.dart';

mixin class ValidatorMixin {
  bool isEmpty(String value) => value.replaceAll(' ', '').isEmpty;


  final List<TextInputFormatter> onlyText = [
    FilteringTextInputFormatter.allow(RegExp("^[A-Za-z]+")),
  ];
}
