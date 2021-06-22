/// Standard package
import 'dart:ui' show FontWeight;
/// External package
import 'package:google_fonts/google_fonts.dart';
/// Internal package
import 'package:payflow/app/shared/themes/palette.dart';

/// All text styles used by the app
class  TextStyles {

  static final titleHome = GoogleFonts.lexendDeca(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: ColorPalette.heading,
  );

  static final titleRegular = GoogleFonts.lexendDeca(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: ColorPalette.heading,
  );

  static final titleBoldHeading = GoogleFonts.lexendDeca(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ColorPalette.heading,
  );

  static final titleBoldBackground = GoogleFonts.lexendDeca(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ColorPalette.background,
  );

  static final titleListTile = GoogleFonts.lexendDeca(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: ColorPalette.heading,
  );

  static final trailingRegular = GoogleFonts.lexendDeca(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorPalette.heading,
  );

  static final trailingBold = GoogleFonts.lexendDeca(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ColorPalette.heading,
  );

  static final buttonPrimary = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: ColorPalette.primary,
  );

  static final buttonHeading = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: ColorPalette.heading,
  );

  static final buttonGray = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: ColorPalette.grey,
  );

  static final buttonBackground = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: ColorPalette.background,
  );

  static final buttonBoldPrimary = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: ColorPalette.primary,
  );

  static final buttonBoldHeading = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: ColorPalette.heading,
  );

  static final buttonBoldGray = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: ColorPalette.grey,
  );

  static final buttonBoldBackground = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: ColorPalette.background,
  );

  static final captionBackground = GoogleFonts.lexendDeca(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: ColorPalette.background,
  );

  static final captionShape = GoogleFonts.lexendDeca(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: ColorPalette.shape,
  );

  static final captionBody = GoogleFonts.lexendDeca(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: ColorPalette.body,
  );

  static final captionBoldBackground = GoogleFonts.lexendDeca(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: ColorPalette.background,
  );

  static final captionBoldShape = GoogleFonts.lexendDeca(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: ColorPalette.shape,
  );

  static final captionBoldBody = GoogleFonts.lexendDeca(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: ColorPalette.body,
  );

}