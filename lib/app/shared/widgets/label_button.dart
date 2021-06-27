import 'package:flutter/material.dart';
import 'package:payflow/app/shared/themes/palette.dart';
import 'package:payflow/app/shared/themes/styles.dart';

class LabelButton extends StatelessWidget {

  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;

  LabelButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.style
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: ColorPalette.background,
      child: TextButton(
        onPressed: onPressed, 
        child: Text(label, style: style ?? TextStyles.buttonHeading)
      ),
    );
  }
}