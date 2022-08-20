import 'package:flutter/material.dart';
import 'package:sample_app/features/user_feature/presentation/utils/constants.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final TextStyle? style;
  final bool? obscureText;
  final TextCapitalization? textCapitalization;
  final Widget? suffixIcon;
  final bool? readOnly;
  final TextAlign? textAlign;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? icon;
  final Widget? prefixIcon;
  final bool? enabled;
  final bool? filled;
  TextStyle? hintStyle;
  int? maxLength;
  int? maxLines;
  BorderRadius? borderRadius;

  AppTextField(
      {Key? key,
        this.hintText,
        this.keyboardType,
        this.readOnly = false,
        this.onChanged,
        this.enabled = true,
        this.controller,
        this.obscureText = false,
        this.textAlign = TextAlign.start,
        this.textCapitalization = TextCapitalization.words,
        this.icon,
        this.maxLength,
        this.filled = true,
        this.suffixIcon,
        this.prefixIcon,
        this.borderRadius,
        this.isDense = true,
        this.contentPadding,
        this.hintStyle,
        this.maxLines,
        this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    borderRadius = const BorderRadius.all(Radius.circular(10));

    hintStyle = const TextStyle( fontSize: 14);

    return TextField(
      enabled: true,
      maxLength: maxLength,
      keyboardType: keyboardType,
      onChanged: onChanged,
      controller: controller,
      maxLines: maxLines,
      style: style,
      cursorColor: kColorBlue,
      obscureText: obscureText!,
      textAlign: textAlign!,
      readOnly: readOnly!,
      textCapitalization: textCapitalization!,
      decoration: InputDecoration(
        isCollapsed: true,
        isDense: isDense,
        contentPadding: contentPadding,
        icon: icon,
        prefixIcon: prefixIcon,
        filled: filled,
        fillColor: kColorWhite,
        hintText: hintText,
        hintStyle: hintStyle,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius!,
          borderSide: const BorderSide(color: kColorBackground),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius!,
          borderSide: const BorderSide(
            width: 1,
            color: kColorBlue,
          ),
        ),
      ),
    );
  }
}
