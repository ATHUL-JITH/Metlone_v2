// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:metlonev2_app/screens/app/salesorder/model/salesorder_model.dart';
//
// import '../style/text_style_class.dart';
//
// class CardWidget extends StatefulWidget {
//   const CardWidget({
//     super.key,
//     required this.listItem,
//   });
//   final Item listItem;
//
//   @override
//   State<CardWidget> createState() => _CardWidgetState();
// }
//
// class _CardWidgetState extends State<CardWidget> {
//   bool checkboxValues = false;
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.topLeft,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.orange,
//                   borderRadius: BorderRadius.circular(
//                     15,
//                   ),
//                 ),
//                 child: const Padding(
//                   padding: EdgeInsets.all(
//                     6.0,
//                   ),
//                   child: Text(
//                     'Pending',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               height: 155,
//               width: 400,
//               decoration: BoxDecoration(
//                 borderRadius:
//                     BorderRadius.circular(10), // Adjust the radius as needed
//                 border: Border.all(
//                   width: 1,
//                   color: Colors.black26,
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             '${widget.listItem.salesNo}',
//                             style: TextStyleClass.jakarthaBlackBold14,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             DateFormat('MMM dd, yyyy').format(
//                                 widget.listItem.invoiceDate ?? DateTime.now()),
//                             style: TextStyleClass.jakarthaSemiBlack14,
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '${widget.listItem.customerName}',
//                                 style: TextStyleClass.jakarthaSemiBlack14,
//                               ),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               Text(
//                                 '${widget.listItem.phoneNumber}',
//                                 style: TextStyleClass.jakarthaSemiBlack14,
//                               ),
//                             ],
//                           ),
//                           const Spacer(),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               '₹ ${widget.listItem.totalAmount}',
//                               style: TextStyleClass.jakarthaBlackSemiBold20,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           flex: 2,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               'Ready to Delivery',
//                               style: TextStyleClass.jakarthaSemiBlack14,
//                             ),
//                           ),
//
//                           // CheckboxListTile(
//                           //   // activeColor: HexColor('2E8BD4'),
//                           //   title: Text(
//                           //     "Ready to Delivery",
//                           //     style: TextStyleClass.jakarthaSemiBlack14,
//                           //   ),
//                           //   value: checkboxValues,
//                           //   onChanged: (bool? value) {
//                           //     setState(() {
//                           //       checkboxValues = value!;
//                           //     });
//                           //   },
//                           // ),
//                         ),
//                         Expanded(
//                             child: Checkbox(
//                           value: checkboxValues,
//                           onChanged: (value) {
//                             setState(() {
//                               checkboxValues = value!;
//                             });
//                           },
//                         )),
//                         Expanded(child: Icon(Icons.article))
//                       ],
//                     ),
//                     // Row(
//                     //   children: [
//                     //
//                     //   ],
//                     // ),
//
//                     // Padding(
//                     //   padding: const EdgeInsets.all(8.0),
//                     //   child: DropDownTextField(
//                     //       value: 'Pending',
//                     //       onChanged: (val) {},
//                     //       hideBorder: false,
//                     //       hintText: 'Pending',
//                     //       itemList: const [
//                     //         DropdownMenuItem(
//                     //           value: 'Pending',
//                     //           child: Text('Pending',
//                     //               style: TextStyleClass.jakarthaBlackSemiBold14),
//                     //         ),
//                     //         DropdownMenuItem(
//                     //           value: 'Ready to delivery',
//                     //           child: Text('Ready to delivery',
//                     //               style: TextStyleClass.jakarthaBlackSemiBold14),
//                     //         ),
//                     //       ]),
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
