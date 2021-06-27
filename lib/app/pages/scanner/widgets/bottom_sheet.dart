import 'package:flutter/material.dart';
import 'package:payflow/app/pages/scanner/widgets/set_label.dart';
import 'package:payflow/app/shared/themes/palette.dart';
import 'package:payflow/app/shared/themes/styles.dart';

class BottomSheet extends StatelessWidget {

  final String title;
  final String subtitle;

  final String rightLabel;
  final VoidCallback rightOnPressed;
  final String leftLabel;
  final VoidCallback leftOnPressed;

  const BottomSheet({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.rightLabel,
    required this.rightOnPressed,
    required this.leftLabel,
    required this.leftOnPressed
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(40),
            child: Text.rich(
              TextSpan(
                text: title,
                style: TextStyles.buttonBoldHeading,
                children: [
                  TextSpan(
                    text: "\n$subtitle",
                    style: TextStyles.buttonHeading
                  )
                ]
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 1,
            color: ColorPalette.stroke,
          ),
          SetLabel(
            rightLabel: rightLabel, 
            rightOnPressed: rightOnPressed, 
            leftLabel: leftLabel, 
            leftOnPressed: leftOnPressed,
            enablePrimaryColorLeft: true,
          ),
        ],
      ),
    );
  }
}