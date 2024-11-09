// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// import '../style/colors_class.dart';
// import '../style/text_style_class.dart';
//
// class CustomThemeButton extends StatelessWidget {
//   final String label;
//   final Function function;
//   final double? height;
//   final double? width;
//   final EdgeInsets? padding;
//   final TextStyle? style;
//   final bool loading;
//   final Color themeColor;
//
//   const CustomThemeButton(
//       {Key? key,
//       required this.function,
//       required this.label,
//       this.height,
//       this.width,
//       this.padding,
//       this.style,
//       this.loading = false,
//       this.themeColor = ColorClass.primaryColor})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: padding == null
//             ? const EdgeInsets.symmetric(horizontal: 25, vertical: 15)
//             : padding!,
//         child: SizedBox(
//           height: height == null ? 45 : height!,
//           width: width ?? double.infinity,
//           child: ElevatedButton(
//             style: ButtonStyle(
//               elevation: MaterialStateProperty.all(0),
//               backgroundColor: MaterialStateProperty.all(themeColor),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//             ),
//             onPressed: () {
//               if (!loading) {
//                 function();
//               }
//             },
//             child: loading
//                 ? const SpinKitWave(
//                     color: Colors.white,
//                     size: 20,
//                   )
//                 : Text(
//                     label,
//                     style: style ?? TextStyleClass.jakarthaWhite16,
//                   ),
//           ),
//         ));
//   }
// }
