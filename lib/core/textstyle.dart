import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentapp/core/color_paletter.dart';

class TextStyles {
  TextStyles(this.context);
  BuildContext? context;
  static const TextStyle defaultStyle = TextStyle(
      fontSize: 16,
      color: ColorPalette.colorWhite,
      fontWeight: FontWeight.w400,
      height: 16 / 14);
}

extension ExtendedTextStyle on TextStyle {
  TextStyle get blue {
    return copyWith(
        fontSize: 18,
        height: 18 / 16,
        fontWeight: FontWeight.w500,
        color: ColorPalette.blue1);
  }

  TextStyle get textwhite18 {
    return copyWith(
        fontSize: 18,
        height: 18 / 16,
        fontWeight: FontWeight.w500,
        color: ColorPalette.colorWhite);
  }

  TextStyle get textheader {
    return copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: ColorPalette.colorWhite);
  }

  TextStyle get titlenotification {
    return copyWith(
        fontSize: 20,
        height: 20 / 18,
        fontWeight: FontWeight.w700,
        color: ColorPalette.backgroundColorbalck);
  }

  TextStyle get textcolorgrey20 {
    return copyWith(
        fontSize: 20,
        height: 20 / 18,
        fontWeight: FontWeight.w700,
        color: ColorPalette.azure3);
  }

  TextStyle get textblackcolor {
    return copyWith(
        fontSize: 14,
        height: 12 / 12,
        fontWeight: FontWeight.w700,
        color: ColorPalette.backgroundColorbalck);
  }

  TextStyle get textsplashscreen {
    return copyWith(
        fontSize: 30,
        height: 30 / 28,
        fontWeight: FontWeight.w700,
        color: ColorPalette.colorWhite);
  }

  TextStyle get textOrange30 {
    return copyWith(
        fontSize: 30,
        height: 30 / 28,
        fontWeight: FontWeight.w700,
        color: ColorPalette.colorOrange);
  }

  TextStyle get textheadercolor30 {
    return copyWith(
        fontSize: 30,
        height: 30 / 28,
        fontWeight: FontWeight.w700,
        color: ColorPalette.yellowColor);
  }

  TextStyle get textblur {
    return copyWith(
        fontSize: 16,
        height: 16 / 14,
        fontWeight: FontWeight.w700,
        color: ColorPalette.textblur);
  }

  TextStyle get textbutton {
    return copyWith(
        fontSize: 24,
        height: 24 / 22,
        fontWeight: FontWeight.w700,
        color: ColorPalette.colorWhite);
  }

  //google font
  TextStyle get ggfont10 {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
      fontSize: 12,
      color: ColorPalette.colorWhite,
    ));
  }

  TextStyle get ggfont12 {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
      fontSize: 12,
      color: ColorPalette.colorWhite,
    ));
  }

  TextStyle get ggfontgrey16 {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 16,
            color: ColorPalette.borderColorCircle,
            fontWeight: FontWeight.bold));
  }

  TextStyle get ggfont16 {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 16,
            color: ColorPalette.colorWhite,
            fontWeight: FontWeight.bold));
  }

  TextStyle get ggfont20 {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 20,
            color: ColorPalette.colorWhite,
            fontWeight: FontWeight.bold));
  }

  TextStyle get ggfontbl20 {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 20,
            color: ColorPalette.blue1,
            fontWeight: FontWeight.bold));
  }

  TextStyle get ggfontsubheader {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 24,
            color: ColorPalette.colorWhite,
            fontWeight: FontWeight.bold));
  }

  TextStyle get ggfontsubheaderblue {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 24,
            color: ColorPalette.blue1,
            fontWeight: FontWeight.bold));
  }

  TextStyle get ggfontheader {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 30,
            color: ColorPalette.colorWhite,
            fontWeight: FontWeight.bold));
  }

  TextStyle get ggfontheaderblue {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 60,
            color: ColorPalette.redColor,
            fontWeight: FontWeight.bold));
  }

  TextStyle get ggfontblack16 {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 16,
            color: ColorPalette.backgroundColorbalck,
            fontWeight: FontWeight.bold));
  }

  TextStyle get ggfontblack17 {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 17,
            color: ColorPalette.backgroundColorbalck,
            fontWeight: FontWeight.bold));
  }

  TextStyle get ggfontgrey20 {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 20,
            color: ColorPalette.textblur,
            fontWeight: FontWeight.bold));
  }

  TextStyle get ggfontblue16 {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 16,
            color: ColorPalette.blue1,
            fontWeight: FontWeight.bold));
  }

  TextStyle get ggfontblue20 {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 20,
            color: ColorPalette.blue1,
            fontWeight: FontWeight.bold));
  }

  TextStyle get ggfontheaderblack {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 30,
            color: ColorPalette.backgroundColorbalck,
            fontWeight: FontWeight.bold));
  }

  TextStyle get ggfontheaderblack23 {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 23,
            color: ColorPalette.backgroundColorbalck,
            fontWeight: FontWeight.bold));
  }

  TextStyle get ggfontblack20 {
    return GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 20,
            color: ColorPalette.backgroundColorbalck,
            fontWeight: FontWeight.bold));
  }
}
