// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// import '../style/colors_class.dart';
// import '../style/text_style_class.dart';
//
// class ThemeButtonWithIcon extends StatelessWidget {
//   final String label;
//   final Function function;
//   final double? height;
//   final double? width;
//   final double? padding;
//   final TextStyle? style;
//   final bool loading;
//   final IconData iconData;
//
//   const ThemeButtonWithIcon(
//       {Key? key,
//       required this.function,
//       required this.iconData,
//       required this.label,
//       this.height,
//       this.width,
//       this.padding,
//       this.style,
//       this.loading = false})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: padding == null
//             ? const EdgeInsets.symmetric(horizontal: 10, vertical: 15)
//             : const EdgeInsets.all(0),
//         child: SizedBox(
//           height: height == null ? 45 : height!,
//           width: width ?? double.infinity,
//           child: ElevatedButton(
//             style: ButtonStyle(
//               elevation: MaterialStateProperty.all(0),
//               backgroundColor:
//                   MaterialStateProperty.all(ColorClass.primaryColor),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(6.0),
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
//                 : Row(
//                     children: [
//                       const Spacer(),
//                       Text(
//                         label,
//                         style: style ?? TextStyleClass.jakarthaWhite16,
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Icon(
//                         iconData,
//                       ),
//                       const Spacer(),
//                     ],
//                   ),
//           ),
//         ));
//   }
// }
