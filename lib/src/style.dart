import 'package:dealer/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

BoxDecoration myGrayBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      color: AppColors.borderColor,
    ),
    // borderRadius: BorderRadius.circular(5),
    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
  );
}
