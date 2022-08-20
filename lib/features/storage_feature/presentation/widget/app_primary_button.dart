import 'package:flutter/material.dart';
import 'package:sample_app/features/user_feature/presentation/utils/constants.dart';

import '../../../user_feature/presentation/utils/resolution.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final Color? color;
  final Widget? child;
  final double? borderRadius;
  final double? paddingVert;
  final double? paddingHoriz;

  const PrimaryButton(
      {this.text = "",
        this.onPressed,
        this.color = kColorBlue,
        this.child,
        this.borderRadius = 10,
        this.paddingVert = 10.4,
        this.paddingHoriz = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: kColorBlue,
          onSurface: kColorBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(text!),
      ),
    );
  }
}
