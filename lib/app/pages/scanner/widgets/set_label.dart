import 'package:flutter/material.dart';
import 'package:payflow/app/shared/themes/palette.dart';
import 'package:payflow/app/shared/themes/styles.dart';
import 'package:payflow/app/shared/widgets/label_button.dart';

/// Set Label
class SetLabel extends StatelessWidget {

  final String rightLabel;
  final VoidCallback rightOnPressed;
  final String leftLabel;
  final VoidCallback leftOnPressed;
  final bool enablePrimaryColorLeft;

  const SetLabel({
    Key? key,
    required this.rightLabel,
    required this.rightOnPressed,
    required this.leftLabel,
    required this.leftOnPressed,
    this.enablePrimaryColorLeft = false
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: LabelButton(
              onPressed: leftOnPressed,
              label: leftLabel,
              style: enablePrimaryColorLeft ? TextStyles.buttonPrimary : null,
            ),
          ),
          Container(
            height: 56,
            width: 1,
            color: ColorPalette.stroke,
          ),
          Expanded(
            child: LabelButton(
              onPressed: rightOnPressed,
              label: rightLabel,
            ),
          ),
        ],
      ),
    );
  }
}