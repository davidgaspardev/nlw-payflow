/// Standard package
import 'dart:ui' show FontWeight, TextDecoration;
/// External package
import 'package:google_fonts/google_fonts.dart';
/// Internal package
import 'package:payflow/app/shared/themes/palette.dart';

/// All text styles used by the app
class  TextStyles {

  static final titleHome = GoogleFonts.lexendDeca(
    decoration: TextDecoration.none,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: ColorPalette.heading,
  );

  static final titleRegular = GoogleFonts.lexendDeca(
    decoration: TextDecoration.none,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: ColorPalette.background,
  );

  static final titleBoldHeading = GoogleFonts.lexendDeca(
    decoration: TextDecoration.none,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ColorPalette.heading,
  );

  static final titleBoldBackground = GoogleFonts.lexendDeca(
    decoration: TextDecoration.none,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ColorPalette.background,
  );

  static final titleListTile = GoogleFonts.lexendDeca(
    decoration: TextDecoration.none,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: ColorPalette.heading,
  );

  static final trailingRegular = GoogleFonts.lexendDeca(
    decoration: TextDecoration.none,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorPalette.heading,
  );

  static final trailingBold = GoogleFonts.lexendDeca(
    decoration: TextDecoration.none,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ColorPalette.heading,
  );

  static final buttonPrimary = GoogleFonts.inter(
    decoration: TextDecoration.none,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: ColorPalette.primary,
  );

  static final buttonHeading = GoogleFonts.inter(
    decoration: TextDecoration.none,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: ColorPalette.heading,
  );

  static final buttonGray = GoogleFonts.inter(
    decoration: TextDecoration.none,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: ColorPalette.grey,
  );

  static final buttonBackground = GoogleFonts.inter(
    decoration: TextDecoration.none,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: ColorPalette.background,
  );

  static final buttonBoldPrimary = GoogleFonts.inter(
    decoration: TextDecoration.none,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: ColorPalette.primary,
  );

  static final buttonBoldHeading = GoogleFonts.inter(
    decoration: TextDecoration.none,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: ColorPalette.heading,
  );

  static final buttonBoldGray = GoogleFonts.inter(
    decoration: TextDecoration.none,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: ColorPalette.grey,
  );

  static final buttonBoldBackground = GoogleFonts.inter(
    decoration: TextDecoration.none,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: ColorPalette.background,
  );

  static final captionBackground = GoogleFonts.lexendDeca(
    decoration: TextDecoration.none,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: ColorPalette.background,
  );

  static final captionShape = GoogleFonts.lexendDeca(
    decoration: TextDecoration.none,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: ColorPalette.shape,
  );

  static final captionBody = GoogleFonts.lexendDeca(
    decoration: TextDecoration.none,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: ColorPalette.body,
  );

  static final captionBoldBackground = GoogleFonts.lexendDeca(
    decoration: TextDecoration.none,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: ColorPalette.background,
  );

  static final captionBoldShape = GoogleFonts.lexendDeca(
    decoration: TextDecoration.none,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: ColorPalette.shape,
  );

  static final captionBoldBody = GoogleFonts.lexendDeca(
    decoration: TextDecoration.none,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: ColorPalette.body,
  );

}