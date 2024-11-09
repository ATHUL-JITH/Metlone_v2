// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:xene/utils/api_support.dart';
//
// import '../style/colors_class.dart';
// import '../style/icons_class.dart';
//
// PreferredSizeWidget commonAppBar({
//   bool isBackButton = false,
//   context,
// }) {
//   return AppBar(
//     actions: [
//       const Icon(Icons.notifications_none),
//       const SizedBox(
//         width: 10,
//       ),
//       Image.network(
//         ApiSupport.userDummyImage,
//         height: 30,
//         width: 30,
//       ),
//       const SizedBox(
//         width: 10,
//       ),
//     ],
//     leading: isBackButton
//         ? IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(Icons.arrow_back_ios))
//         : SvgPicture.asset(
//             IconClass.appBarLeading,
//             fit: BoxFit.none,
//           ),
//     title: SvgPicture.asset(
//       IconClass.xeneLogo,
//       fit: BoxFit.none,
//       colorFilter: const ColorFilter.mode(
//         ColorClass.primaryColor,
//         BlendMode.srcATop,
//       ),
//     ),
//     iconTheme: const IconThemeData(
//       color: ColorClass.black,
//     ),
//     elevation: 0,
//     backgroundColor: ColorClass.selectGrey,
//   );
// }
