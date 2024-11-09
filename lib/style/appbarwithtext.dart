// import 'package:flutter/material.dart';
// import 'package:xene/widgets/svg_with_height.dart';
//
// import '../style/icons_class.dart';
// import '../style/text_style_class.dart';
//
// class AppBarWithBackButton extends StatelessWidget {
//   final String label;
//   final BuildContext ctx;
//   final bool showBackButton;
//
//   const AppBarWithBackButton({
//     Key? key,
//     required this.ctx,
//     required this.label,
//     this.showBackButton = true,
//
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       width: double.infinity,
//       decoration: const BoxDecoration(color: Colors.white),
//       child: Row(
//         children: [
//           Visibility(
//             visible: showBackButton,
//             child: InkWell(
//               onTap: () {
//                 Navigator.pop(ctx);
//               },
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 5, right: 10),
//                 child: Center(
//                   child: svgPicture(
//                       icon: IconClass.arrow_lef,
//                       height: 15,
//                       width: 15,
//                       color: Colors.black),
//                 ),
//               ),
//             ),
//           ),
//           Text(
//             label,
//             style: TextStyleClass.jakarthaBlackBold13,
//           ),
//         ],
//       ),
//     );
//   }
// }
