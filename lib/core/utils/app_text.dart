import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  static TextStyle inter33(BuildContext context) {
    final res = ResponsiveHelper(context);
    return GoogleFonts.inter(
      fontSize: res.sp(33),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle poppins58(BuildContext context) {
    final res = ResponsiveHelper(context);
    return GoogleFonts.poppins(
      fontSize: res.sp(58),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle inter20(BuildContext context) {
    final res = ResponsiveHelper(context);
    return GoogleFonts.inter(
      fontSize: res.sp(20),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle poppins14(BuildContext context) {
    final res = ResponsiveHelper(context);
    return GoogleFonts.poppins(fontSize: res.sp(14));
  }

  static TextStyle poppins15(BuildContext context) {
    final res = ResponsiveHelper(context);
    return GoogleFonts.poppins(
      fontSize: res.sp(15),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle poppins16(BuildContext context) {
    final res = ResponsiveHelper(context);
    return GoogleFonts.poppins(
      fontSize: res.sp(16),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle interDes33(BuildContext context) {
    final res = ResponsiveHelper(context);
    return GoogleFonts.inter(
      fontSize: res.sp(11),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle poppinsDes58(BuildContext context) {
    final res = ResponsiveHelper(context);
    return GoogleFonts.poppins(
      fontSize: res.sp(15),
      fontWeight: FontWeight.w600,
    );
  }


  static TextStyle interDes20(BuildContext context) {
    final res = ResponsiveHelper(context);
    return GoogleFonts.inter(
      fontSize: res.sp(8),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle poppinsDes14(BuildContext context) {
    final res = ResponsiveHelper(context);
    return GoogleFonts.poppins(fontSize: res.sp(3));
  }

  static TextStyle poppinsDes15(BuildContext context) {
    final res = ResponsiveHelper(context);
    return GoogleFonts.poppins(
      fontSize: res.sp(4),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle poppinsDes16(BuildContext context) {
    final res = ResponsiveHelper(context);
    return GoogleFonts.poppins(
      fontSize: res.sp(5),
      fontWeight: FontWeight.normal,
    );
  }

  static const TextStyle semiBold16 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static const TextStyle bold28 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
  );

  static const TextStyle regular22 = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 22,
  );

  static const TextStyle semiBold11 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 11,
  );

  static const TextStyle medium15 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );

  static const TextStyle regular26 = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 26,
  );

  static const TextStyle regular16 = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );

  static const TextStyle regular11 = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 11,
  );
}
