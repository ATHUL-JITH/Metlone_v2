// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// import '../style/colors_class.dart';
// import '../style/text_style_class.dart';
//
// class ThemeButton extends StatelessWidget {
//   final String label;
//   final Function function;
//   final Function? onLongFunction;
//   final double? height;
//   final double? width;
//   final double? padding;
//   final TextStyle? style;
//   final bool loading;
//   final Color? color;
//
//   const ThemeButton(
//       {Key? key,
//       required this.function,
//       this.onLongFunction,
//       required this.label,
//       this.height,
//       this.width,
//       this.padding,
//       this.style,
//       this.loading = false,
//       this.color})
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
//                   MaterialStateProperty.all(color ?? ColorClass.primaryColor),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(6.0),
//                 ),
//               ),
//             ),
//             onLongPress: () {
//               onLongFunction!();
//             },
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
//
// class LocationThemeButton extends StatelessWidget {
//   final String label;
//   final Function function;
//   final double? height;
//   final double? width;
//   final double? padding;
//   final TextStyle? style;
//   final bool loading;
//
//   const LocationThemeButton(
//       {Key? key,
//       required this.function,
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
//             ? const EdgeInsets.symmetric(horizontal: 25, vertical: 15)
//             : const EdgeInsets.all(0),
//         child: SizedBox(
//           height: height == null ? 45 : height!,
//           width: width ?? double.infinity,
//           child: ElevatedButton.icon(
//             icon: const Icon(Icons.my_location),
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
//             label: Text(
//               label,
//               style: style ?? TextStyleClass.regular14White,
//             ),
//           ),
//         ));
//   }
// }
