import 'package:flutter/material.dart';

import 'colors_class.dart';

class TextStyleClass {
  static const fontFamily = "Jakartha";

  static const FontWeight extBold = FontWeight.w900;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight light = FontWeight.w300;

  ///SIZE 10
  static const TextStyle jakarthaWhite10 =
      TextStyle(fontFamily: fontFamily, fontSize: 10, color: ColorClass.white);
  static const TextStyle jakarthaBlack10 =
      TextStyle(fontFamily: fontFamily, fontSize: 10, color: ColorClass.black);
  static const TextStyle jakarthaBlackBold10 = TextStyle(
      fontFamily: fontFamily,
      fontSize: 10,
      color: ColorClass.black,
      fontWeight: FontWeight.bold);
  static const TextStyle jakarthaGreySec10 = TextStyle(
      fontFamily: fontFamily, fontSize: 10, color: ColorClass.greySecondary);

  static const TextStyle jakarthaBlackLightSec10 = TextStyle(
      fontFamily: fontFamily, fontSize: 10, color: ColorClass.blackLight);

  static const TextStyle jakarthaBlackLightSec13 = TextStyle(
      fontFamily: fontFamily, fontSize: 13, color: ColorClass.blackLight);
  static const TextStyle jakarthaBlackLightSec12 = TextStyle(
      fontFamily: fontFamily, fontSize: 12, color: ColorClass.blackLight);
  /*static const TextStyle jakarthaBlackLightSec10 = TextStyle(
      fontFamily: fontFamily, fontSize: 10, color: ColorClass.blackLight);*/

  ///SIZE 12
  static const TextStyle jakarthaBlack12 =
      TextStyle(fontFamily: fontFamily, fontSize: 12, color: ColorClass.black);
  static const TextStyle jakarthaRed12 = TextStyle(
      fontFamily: fontFamily, fontSize: 12, color: ColorClass.redColor);

  static const TextStyle jakarthaGreySecBold12 = TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: extBold,
      color: ColorClass.greySecondary);

  static const TextStyle jakarthaDarkGrey12 = TextStyle(
      fontFamily: fontFamily, fontSize: 12, color: ColorClass.darkGrey);
  static const TextStyle jakarthaWhite12 =
      TextStyle(fontFamily: fontFamily, fontSize: 12, color: ColorClass.white);
  static const TextStyle jakarthaGreySec12 = TextStyle(
      fontFamily: fontFamily, fontSize: 12, color: ColorClass.greySecondary);
  static const TextStyle jakarthaPrimaryBold12 = TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: bold,
      color: ColorClass.primaryColor);
  static const TextStyle jakarthaBlack2Bold12 = TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: semiBold,
      wordSpacing: 1,
      height: 1.5,
      color: ColorClass.black);

  static const TextStyle jakarthaBlackBold12 = TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: bold,
      wordSpacing: 1,
      height: 1.5,
      color: ColorClass.black);

  static const TextStyle jakarthaNormal12 = TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      wordSpacing: 1,
      height: 1.5,
      color: ColorClass.black);

  static const TextStyle jakarthasemiBoldrimery12 = TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      wordSpacing: 1,
      height: 1.5,
      fontWeight: semiBold,
      color: ColorClass.primaryColor);

  static const TextStyle jakarthaWhiteMedium12 = TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: medium,
      color: ColorClass.white);

  static const TextStyle jakarthaPrimaryAccentMediumUnderLine12 = TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: medium,
      color: ColorClass.primaryAccent,
      decoration: TextDecoration.underline);

  ///SIZE 14
  static const TextStyle jakarthaBlack14 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    color: ColorClass.black,
  );
  static const TextStyle jakarthaSemiBoldBlack14 = TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      color: ColorClass.black,
      fontWeight: semiBold);

  static TextStyle jakarthaSemiBlack14 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    color: ColorClass.black.withOpacity(0.6),
  );

  static const TextStyle jakarthaPrimary14 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    color: ColorClass.primaryColor,
  );
  static const TextStyle jakarthaBlackBold14 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: ColorClass.black);
  static const TextStyle jakarthaBlackSemiBold14 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: semiBold,
      fontSize: 14,
      color: ColorClass.black);

  static const TextStyle jakarthaPrimaryAccent14 = TextStyle(
      fontFamily: fontFamily, fontSize: 14, color: ColorClass.primaryAccent);

  static const hintTextStyle = TextStyle(
      fontFamily: TextStyleClass.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorClass.lightGrey);

  static const labelTextStyle = TextStyle(
      fontFamily: TextStyleClass.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorClass.lightGrey);

  static const TextStyle regular14White = TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: ColorClass.white);

  static const TextStyle jakarthaMediumBlack14 = TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: medium,
      color: ColorClass.textColor);
  static const TextStyle jakarthaMediumRed14 = TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: medium,
      color: ColorClass.gradiantColor1);

  static const TextStyle jakarthaMediumWhite14 = TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: medium,
      color: ColorClass.white);

  static const TextStyle jakarthaGreySec14 = TextStyle(
      fontFamily: fontFamily, fontSize: 14, color: ColorClass.greySecondary);

  ///SIZE 15
  ///
  static const TextStyle jakarthaMediumText15 = TextStyle(
      fontFamily: fontFamily,
      fontSize: 15,
      fontWeight: medium,
      color: ColorClass.textColor);

  static const textFieldStyle = TextStyle(
      fontSize: 15,
      fontFamily: TextStyleClass.fontFamily,
      color: ColorClass.secondaryColor,
      fontWeight: FontWeight.w600);

  static const TextStyle novaBoldGrey16Bold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    color: ColorClass.slideMain,
    fontWeight: FontWeight.w500,
  );

  ///SIZE 16
  static const TextStyle jakarthaWhite16 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    color: ColorClass.white,
  );
  static TextStyle jakarthaLightBlack16 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    color: ColorClass.blackLight2.withOpacity(0.6),
  );
  static const TextStyle jakarthaBlack16 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    color: ColorClass.black,
  );

  static const TextStyle jakarthaBlack216 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    color: ColorClass.black2,
  );
  static const TextStyle jakarthaBlackSemiBold16 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: semiBold,
    color: ColorClass.black,
  );
  static const TextStyle jakarthaBlackBold16 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: bold,
    color: ColorClass.black,
  );
  static const TextStyle jakarthaBlackBold13 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: semiBold,
    color: ColorClass.black,
  );

  ///SIZE 17
  static const TextStyle jakarthaBlackSemiBold17 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 17,
    fontWeight: semiBold,
    color: ColorClass.black,
  );

  ///SIZE 18
  static const TextStyle jakarthaPrimary18 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: semiBold,
    color: ColorClass.primaryColor,
  );

  static const TextStyle jakarthaGreySec16 = TextStyle(
      fontFamily: fontFamily, fontSize: 16, color: ColorClass.greySecondary);
  static const TextStyle jakarthaGreySecBold16 = TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: bold,
      color: ColorClass.greySecondary);

  ///SIZE 18
  static const TextStyle jakarthaSemiBoldBlack18 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: semiBold,
      fontSize: 18,
      color: ColorClass.black);

  static const TextStyle jakarthaBoldPrimary18 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: bold,
      fontSize: 18,
      color: ColorClass.primaryColor);

  ///SIZE 20
  static const TextStyle jakarthaBlack20 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    color: ColorClass.black,
  );
  static const TextStyle jakarthaBlackSemiBold20 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    color: ColorClass.black,
    fontWeight: bold,
  );

  static const TextStyle jakarthaBlackBold20 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: ColorClass.black);

  ///SIZE 24

  static const TextStyle jakarthaBlackBold24 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: ColorClass.black);

  ///SIZE 30
  static const TextStyle jakarthaBoldBlack30 = TextStyle(
      fontFamily: fontFamily,
      fontSize: 30,
      fontWeight: bold,
      color: ColorClass.black);
}
