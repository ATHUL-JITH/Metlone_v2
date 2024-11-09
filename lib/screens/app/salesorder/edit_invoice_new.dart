// import 'dart:developer';
//
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:intl/intl.dart';
// import 'package:metlonev2_app/screens/app/salesorder/model/estimate_or_invoice_model.dart';
// import 'package:metlonev2_app/screens/app/salesorder/new_user_screen.dart';
// import 'package:metlonev2_app/screens/app/salesorder/provider/salesorder_provider.dart';
// import 'package:metlonev2_app/widgets/shimmer_widget.dart';
// import 'package:provider/provider.dart';
//
// import './model/get_all_customer_name_model.dart' as cust;
// import '../../../style/colors_class.dart';
// import '../../../style/text_field_widget.dart';
// import '../../../style/text_style_class.dart';
// import 'model/service_detail_model.dart';
// import 'model/service_list_model.dart';
//
// class EditInvoiceNew extends StatefulWidget {
//   final bool isEditable;
//   final String brnachId;
//   final String date;
//   final String totalAmount;
//   final String advanceAmount;
//   final String balanceAmount;
//   final String fileName;
//   final String id;
//   const EditInvoiceNew({
//     Key? key,
//     required this.date,
//     required this.totalAmount,
//     required this.advanceAmount,
//     required this.balanceAmount,
//     required this.fileName,
//     this.isEditable = false,
//     required this.brnachId,
//     required this.id,
//   }) : super(key: key);
//
//   @override
//   State<EditInvoiceNew> createState() => EditInvoiceNewState();
// }
//
// class EditInvoiceNewState extends State<EditInvoiceNew> {
//   String dropDown = 'printing';
//   bool checkboxValue = false;
//   bool isContainerVisible = false;
//   bool showTextField = false;
//   bool showTextFieldTwo = false;
//   bool isNewCustomer = true;
//   final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
//
//   double advanceAmount = 0.0; // Initialize advanceAmount
//   double receivedAmount = 0.0;
//
//   TextEditingController _toDateController = TextEditingController();
//   DateTime selecteddatetime = DateTime.now();
//
//   void _showDatePicker() {
//     showDatePicker(
//             context: context,
//             initialDate: DateTime.now(),
//             firstDate: DateTime(2000),
//             lastDate: DateTime(2025))
//         .then((value) {
//       setState(() {
//         selecteddatetime = value!;
//         _toDateController.text = DateFormat('dd-MM-yyyy').format(value);
//       });
//     });
//   }
//
//   @override
//   void initState() {
//     _toDateController.text = DateFormat('dd-MM-yyyy').format(
//       DateTime.now(),
//     );
//
//     Future.microtask(() async {
//       final SalesOrderProvider salesOrderProvider =
//           Provider.of<SalesOrderProvider>(
//         context,
//         listen: false,
//       );
//
//       salesOrderProvider.salesOrderLoading = true;
//       salesOrderProvider.salesOrderLoading;
//
//       // salesOrderProvider.getBranchSettingsInfoDetailsLoading = true;
//       // salesOrderProvider.getBranchSettingsInfoDetailsLoading;
//
//       await salesOrderProvider
//           .getBranchSettingsInfoDetails(
//             context: context,
//           )
//           .then((value) => salesOrderProvider.getAllCustomerNameDetails(
//                 context: context,
//               ));
//
//       // salesOrderProvider.getAllCustomerNameDetailsLoading = true;
//       // salesOrderProvider.getAllCustomerNameDetailsLoading;
//
//       // salesOrderProvider.getAllServiceDetailsLoading = true;
//       // salesOrderProvider.getAllServiceDetailsLoading;
//       //
//       // salesOrderProvider.getWhatsappMessageLoading = true;
//       // salesOrderProvider.getWhatsappMessageLoading;
//       log('%%%%%%%%%%%%%%%%%%%%%%%');
//       log(widget.fileName);
//       log('%%%%%%%%%%%%%%%%%%%');
//       if (widget.isEditable) {
//         await salesOrderProvider.getSalesOrderForEdit(
//             context: context, id: widget.id);
//         log('%%%%%%%%%%%%%%%%%');
//       } else {
//         log('%%%%%%%%%%%%%%%%%%%%%%');
//       }
//       /*   if (widget.isEditable) {
//         salesOrderProvider.salesOrderLoading = true;
//         await salesOrderProvider.getSalesOrderForEdit(
//             context: context, id: widget.id);
//
//         salesOrderProvider.returnMultiply();
//         await salesOrderProvider.getAllServiceDetails(
//           context: context,
//         );
//       } else {
//         await salesOrderProvider.getAllServiceDetails(
//           context: context,
//         );
//         salesOrderProvider.clearState();
//       }*/
//     });
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SalesOrderProvider>(
//       builder: (context, provider, child) {
//         return WillPopScope(
//           onWillPop: () async {
//             provider.clearState();
//             return true;
//           },
//           child: Scaffold(
//             appBar: AppBar(
//               backgroundColor: HexColor('2E8BD4'),
//               title: Text(
//                 widget.isEditable ? 'Edit Invoice' : 'New Invoice',
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//             body: provider.salesOrderLoading
//                 ? ShimmerWidget(
//                     height: MediaQuery.of(context).size.height,
//                     width: MediaQuery.of(context).size.width,
//                   )
//                 : SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey.withOpacity(
//                                 0.4,
//                               ),
//                               borderRadius: BorderRadius.circular(
//                                 12,
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(25.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () {
//                                       _showDatePicker();
//                                     },
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(6),
//                                         color: Colors.white,
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(20.0),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           children: [
//                                             const Text('Invoice Date'),
//                                             const Spacer(),
//                                             const SizedBox(
//                                               height: 10,
//                                             ),
//                                             Text(_toDateController.text),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         const Text('GST Number'),
//                                         const Spacer(),
//                                         Text(provider.comapnyBranchHeader
//                                                 ?.result?.branchGsttin ??
//                                             ''),
//                                       ],
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           'Phone number',
//                                         ),
//                                         const Spacer(),
//                                         Text(provider.comapnyBranchHeader
//                                                 ?.result?.contactPhone ??
//                                             ''),
//                                       ],
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         GestureDetector(
//                                           child: const Text(
//                                             'Email ID',
//                                           ),
//                                           onDoubleTap: () {
//                                             _showDatePicker();
//                                           },
//                                         ),
//                                         const Spacer(),
//                                         Text(provider.comapnyBranchHeader
//                                                 ?.result?.companyEmail ??
//                                             ''),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(20.0),
//                               child: DropdownSearch<cust.Result>(
//                                 selectedItem: provider
//                                     .selectedCustomer, // Set selected customer as the initial item
//                                 dropdownDecoratorProps: DropDownDecoratorProps(
//                                   dropdownSearchDecoration: InputDecoration(
//                                     hintStyle:
//                                         const TextStyle(color: Colors.grey),
//                                     hintText: 'Enter Your Mobile Number',
//                                     labelText: 'Mobile Number',
//                                     labelStyle:
//                                         const TextStyle(color: Colors.black54),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                       borderSide:
//                                           const BorderSide(color: Colors.grey),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                       borderSide: BorderSide(
//                                           color: Colors.grey.shade400),
//                                     ),
//                                   ),
//                                 ),
//                                 onChanged: (val) {
//                                   if (val != null && val.id == -1) {
//                                     // "Add new customer" option is selected
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => const NewUser(),
//                                       ),
//                                     );
//                                   } else {
//                                     provider.setSelectedCustomer = val!;
//                                     provider.customerNameController.text =
//                                         provider.selectedCustomer?.name
//                                                 .toString() ??
//                                             '';
//                                     provider.emailController.text = provider
//                                             .selectedCustomer?.email
//                                             .toString() ??
//                                         '';
//                                     provider.gstController.text = provider
//                                             .selectedCustomer?.gsttin
//                                             .toString() ??
//                                         '';
//                                   }
//                                 },
//                                 items: [
//                                   cust.Result(
//                                     id: -1,
//                                     name: 'Add as  Customer',
//                                     mobile: 'Mobile Number',
//                                     // Add any other default values for the "Add new customer" item
//                                   ),
//                                   ...provider.getCustomer!.result!
//                                       .map((e) => e)
//                                       .toList(),
//                                 ],
//                                 popupProps:
//                                     PopupPropsMultiSelection.modalBottomSheet(
//                                   showSelectedItems: true,
//                                   showSearchBox: true,
//                                   itemBuilder: _customPopupItemBuilder3,
//                                 ),
//                                 itemAsString: (cust.Result u) =>
//                                     u.mobile.toString(),
//                                 compareFn: (i, s) => i == s,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: TextField(
//                             controller: provider.customerNameController,
//                             textInputAction: TextInputAction.next,
//                             cursorColor: Colors.grey,
//                             decoration: InputDecoration(
//                               hintStyle: const TextStyle(color: Colors.grey),
//                               hintText: 'Customer Name',
//                               labelText: 'Customer Name',
//                               labelStyle:
//                                   const TextStyle(color: Colors.black54),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide:
//                                     const BorderSide(color: Colors.grey),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide:
//                                     BorderSide(color: Colors.grey.shade400),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: TextField(
//                             controller: provider.emailController,
//                             textInputAction: TextInputAction.next,
//                             keyboardType: TextInputType.emailAddress,
//                             cursorColor: Colors.grey,
//                             decoration: InputDecoration(
//                               hintStyle: const TextStyle(color: Colors.grey),
//                               labelStyle:
//                                   const TextStyle(color: Colors.black54),
//                               hintText: 'Email id',
//                               labelText: 'Email id',
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: const BorderSide(
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide:
//                                     BorderSide(color: Colors.grey.shade400),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: TextField(
//                             controller: provider.gstController,
//                             textInputAction: TextInputAction.next,
//                             cursorColor: Colors.grey,
//                             decoration: InputDecoration(
//                               labelText: 'GSTIN',
//                               labelStyle:
//                                   const TextStyle(color: Colors.black54),
//                               hintStyle: const TextStyle(color: Colors.grey),
//                               hintText: 'GSTIN',
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide:
//                                     const BorderSide(color: Colors.grey),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide:
//                                     BorderSide(color: Colors.grey.shade400),
//                               ),
//                             ),
//                           ),
//                         ),
//                         ListView.separated(
//                             physics: const NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             separatorBuilder: (context, index) => const Padding(
//                                   padding: EdgeInsets.all(8.0),
//                                   child: Divider(),
//                                 ),
//                             padding: EdgeInsets.zero,
//                             itemCount: provider.quantityControllers.length,
//                             itemBuilder: (context, index) {
//                               return Container(
//                                 color: ColorClass.whiteFillColor,
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 14, vertical: 0),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   // mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Container(
//                                           decoration: BoxDecoration(
//                                             color: ColorClass.whiteFillColor,
//                                             border: Border.all(
//                                               color: ColorClass.borderColor,
//                                             ),
//                                           ),
//                                           child: const Padding(
//                                             padding: EdgeInsets.all(20.0),
//                                             child: Text(
//                                               " Service Details",
//                                               style: TextStyleClass
//                                                   .jakarthaBlack10,
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 1,
//                                           child: Container(
//                                             decoration: const BoxDecoration(
//                                               border: Border(
//                                                 right: BorderSide(
//                                                   color: ColorClass.borderColor,
//                                                 ),
//                                               ),
//                                             ),
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: DropdownSearch<Result>(
//                                                 dropdownDecoratorProps:
//                                                     const DropDownDecoratorProps(
//                                                         dropdownSearchDecoration:
//                                                             InputDecoration(
//                                                   border: InputBorder.none,
//                                                   enabledBorder:
//                                                       InputBorder.none,
//                                                   focusedBorder:
//                                                       InputBorder.none,
//                                                 )),
//                                                 onChanged: (newValue) {
//                                                   provider.selectServices(
//                                                       ServiceDetailsModel(
//                                                           productName:
//                                                               newValue!.name ??
//                                                                   '',
//                                                           productProfileId:
//                                                               newValue.id ?? 0),
//                                                       index);
//                                                 },
//                                                 items: provider
//                                                     .getService!.result!
//                                                     .map((e) => e)
//                                                     .toList(),
//                                                 popupProps: PopupPropsMultiSelection
//                                                     .modalBottomSheet(
//                                                         showSelectedItems: true,
//                                                         showSearchBox: true,
//                                                         itemBuilder:
//                                                             _customPopupItemBuilder2),
//                                                 itemAsString: (Result u) =>
//                                                     u.name.toString(),
//                                                 compareFn: (i, s) => i == s,
//                                                 selectedItem: provider
//                                                             .selectedService
//                                                             .length >
//                                                         index
//                                                     ? Result(
//                                                         name: provider
//                                                             .selectedService[
//                                                                 index]
//                                                             .productName,
//                                                         id: provider
//                                                             .selectedService[
//                                                                 index]
//                                                             .productProfileId,
//                                                       )
//                                                     : null,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         Expanded(
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                               color: ColorClass.whiteFillColor,
//                                               border: Border.all(
//                                                 color: ColorClass.borderColor,
//                                               ),
//                                             ),
//                                             child: const Padding(
//                                               padding: EdgeInsets.all(20.0),
//                                               child: Text(
//                                                 "Qty",
//                                                 style: TextStyleClass
//                                                     .jakarthaBlack10,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: TextFieldWidget(
//                                             function: () =>
//                                                 provider.returnMultiply(),
//                                             isBorderNeeded: false,
//                                             label: "0",
//                                             name: "Type Value",
//                                             controller: provider
//                                                 .quantityControllers[index],
//                                             textInputType: TextInputType.number,
//                                             focusNode: provider
//                                                 .quantityFocusNodes[index],
//                                             obscureText: false,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         Expanded(
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                               color: ColorClass.whiteFillColor,
//                                               border: Border.all(
//                                                 color: ColorClass.borderColor,
//                                               ),
//                                             ),
//                                             child: const Padding(
//                                               padding: EdgeInsets.all(20.0),
//                                               child: Text(
//                                                 "Rate",
//                                                 style: TextStyleClass
//                                                     .jakarthaBlack10,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: TextFieldWidget(
//                                             function: () =>
//                                                 provider.returnMultiply(),
//                                             isBorderNeeded: false,
//                                             label: "0",
//                                             name: "Type Value",
//                                             controller:
//                                                 provider.rateControllers[index],
//                                             textInputType: TextInputType.number,
//                                             obscureText: false,
//                                             focusNode:
//                                                 provider.rateFocusNodes[index],
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         Expanded(
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                               color: ColorClass.whiteFillColor,
//                                               border: Border.all(
//                                                 color: ColorClass.borderColor,
//                                               ),
//                                             ),
//                                             child: const Padding(
//                                               padding: EdgeInsets.all(20.0),
//                                               child: Text(
//                                                 "Gross",
//                                                 style: TextStyleClass
//                                                     .jakarthaBlack10,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: TextFieldWidget(
//                                             function: () {
//                                               provider.returnMultiply();
//                                               FocusScope.of(context)
//                                                   .requestFocus(FocusNode());
//                                             },
//                                             edgeInsets: EdgeInsets.zero,
//                                             isBorderNeeded: false,
//                                             label: "e.g. - \$ 543 -",
//                                             name: "Type Value",
//                                             controller: provider
//                                                 .grossControllers[index],
//                                             textInputType: TextInputType.number,
//                                             focusNode:
//                                                 provider.grossFocusNodes[index],
//                                             obscureText: false,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }),
//
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 5,
//                             horizontal: 14,
//                           ),
//                           child: Row(
//                             children: [
//                               TextButton.icon(
//                                 onPressed: () {
//                                   provider.form2addFields();
//                                 },
//                                 icon: const Icon(
//                                   Icons.add,
//                                   color: ColorClass.black2,
//                                 ),
//                                 label: const Text(
//                                   'Add',
//                                   style: TextStyleClass.jakarthaBlackBold14,
//                                 ),
//                               ),
//                               TextButton.icon(
//                                 onPressed: () {
//                                   provider.deleteFields();
//                                 },
//                                 icon: const Icon(
//                                   Icons.delete,
//                                   color: ColorClass.black2,
//                                 ),
//                                 label: const Text(
//                                   'Delete',
//                                   style: TextStyleClass.jakarthaBlackBold14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//
//                         // const Padding(
//                         //   padding: EdgeInsets.all(22.0),
//                         //   child: Text(
//                         //     textAlign: TextAlign.start,
//                         //     'Remarks:',
//                         //     style: TextStyle(
//                         //         fontWeight: FontWeight.bold,
//                         //         fontSize: 15,
//                         //         color: Colors.black),
//                         //   ),
//                         // ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: TextField(
//                               controller: provider.remarksController,
//                               textInputAction: TextInputAction.next,
//                               cursorColor: Colors.grey,
//                               minLines: 2,
//                               maxLines: 5,
//                               keyboardType: TextInputType.multiline,
//                               decoration: InputDecoration(
//                                 labelText: 'Remarks',
//                                 labelStyle:
//                                     const TextStyle(color: Colors.black54),
//                                 hintText: 'Enter your remarks....',
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide:
//                                       const BorderSide(color: Colors.grey),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide:
//                                       BorderSide(color: Colors.grey.shade400),
//                                 ),
//                               )),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: TextField(
//                             controller: provider.referenceController,
//                             textInputAction: TextInputAction.next,
//                             cursorColor: Colors.grey,
//                             decoration: InputDecoration(
//                               labelText: 'Reference No',
//                               labelStyle:
//                                   const TextStyle(color: Colors.black54),
//                               hintText: 'Reference Number',
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide:
//                                     const BorderSide(color: Colors.grey),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide:
//                                     BorderSide(color: Colors.grey.shade400),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Card(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(22.0),
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       'Sub Total : ₹ ${provider.multipliedSum}',
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold),
//                                     ),
//
//                                     // Assuming returnMultiply returns a widget
//                                   ],
//                                 ),
//                               ),
//
//                               // Padding(
//                               //   padding: EdgeInsets.all(22.0),
//                               //   child: Text(
//                               //     ' sub Total',
//                               //     style: TextStyle(fontWeight: FontWeight.bold),
//                               //   ),
//                               //   Provider.returnMultiply(),
//                               // ),
//                               if (isNewCustomer)
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: TextButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           showTextField = !showTextField;
//                                         });
//                                       },
//                                       child: Text(showTextField
//                                           ? '- Close Advance Amount'
//                                           : '+ Advance Amount')),
//                                 ),
//                               if (showTextField)
//                                 Padding(
//                                   padding: const EdgeInsets.all(15.0),
//                                   child: TextField(
//                                     keyboardType: TextInputType.number,
//                                     textInputAction: TextInputAction.next,
//                                     cursorColor: Colors.grey,
//                                     decoration: InputDecoration(
//                                       labelStyle: const TextStyle(
//                                           color: Colors.black54),
//                                       hintText: 'Advance Amount',
//                                       enabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: const BorderSide(
//                                             color: Colors.grey),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: BorderSide(
//                                             color: Colors.grey.shade400),
//                                       ),
//                                     ),
//                                     onChanged: (value) {
//                                       setState(() {
//                                         advanceAmount = double.parse(value);
//                                       });
//                                     },
//                                   ),
//                                 ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: TextButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         showTextFieldTwo = !showTextFieldTwo;
//                                       });
//                                     },
//                                     child: Text(showTextFieldTwo
//                                         ? '- Close Received Amount'
//                                         : '+ Received Amount')),
//                               ),
//                               if (showTextFieldTwo)
//                                 Padding(
//                                   padding: const EdgeInsets.all(15.0),
//                                   child: TextField(
//                                     keyboardType: TextInputType.number,
//                                     textInputAction: TextInputAction.next,
//                                     cursorColor: Colors.grey,
//                                     decoration: InputDecoration(
//                                       labelStyle: const TextStyle(
//                                           color: Colors.black54),
//                                       hintText: 'Received Amount',
//                                       enabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: const BorderSide(
//                                             color: Colors.grey),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: BorderSide(
//                                             color: Colors.grey.shade400),
//                                       ),
//                                     ),
//                                     onChanged: (value) {
//                                       setState(() {
//                                         receivedAmount = double.parse(value);
//                                       });
//                                     },
//                                   ),
//                                 ),
//                               // CheckboxListTile(
//                               //   activeColor: HexColor('2E8BD4'),
//                               //   title: const Text("Delivered"),
//                               //   value: checkboxValue,
//                               //   onChanged: balanceAmount(advanceAmount: yourAdvanceAmount, receivedAmount: yourReceivedAmount) == 0
//                               //       ? (bool? value) {
//                               //     setState(() {
//                               //       checkboxValue = value!;
//                               //     });
//                               //   }
//                               //       : null,
//                               //   controlAffinity: ListTileControlAffinity.leading,
//                               // ),
//                               // CheckboxListTile(
//                               //   activeColor: HexColor('2E8BD4'),
//                               //   title: const Text("Delivered"),
//                               //   value: checkboxValue,
//                               //   onChanged: provider.multipliedSum == 0
//                               //       ? (bool? value) {
//                               //           setState(() {
//                               //             checkboxValue = value!;
//                               //           });
//                               //         }
//                               //       : null, // Disable the checkbox if multipliedSum is not zero
//                               //   controlAffinity: ListTileControlAffinity
//                               //       .leading, // <-- leading Checkbox
//                               // ),
//                               CheckboxListTile(
//                                 activeColor: HexColor('2E8BD4'),
//                                 title: const Text("Delivered"),
//                                 value: checkboxValue,
//                                 onChanged: (provider.multipliedSum -
//                                             advanceAmount -
//                                             receivedAmount) ==
//                                         0
//                                     ? (bool? value) {
//                                         setState(() {
//                                           checkboxValue = value!;
//                                         });
//                                       }
//                                     : null, // Disable the checkbox if the balance amount is not zero
//                                 controlAffinity: ListTileControlAffinity
//                                     .leading, // <-- leading Checkbox
//                               ),
//
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Text(
//                                     ' Balance Amount: ₹  ${provider.multipliedSum - advanceAmount - receivedAmount}',
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.green)),
//                               ),
//                               // const Padding(
//                               //   padding: EdgeInsets.all(8.0),
//                               //   child: Text('₹'),
//                               // ),
//                             ],
//                           ),
//                         ),
//
//                         const SizedBox(height: 10),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             TextButton(
//                               style: TextButton.styleFrom(
//                                   backgroundColor: Colors.grey[300]),
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               child: const Text(
//                                 'Cancel',
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//
//                             if (widget.isEditable &&
//                                 (provider.multipliedSum -
//                                         advanceAmount -
//                                         receivedAmount) ==
//                                     0)
//                               ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: HexColor('2E8BD4'),
//                                 ),
//                                 onPressed: () {
//                                   // Add your download logic here
//                                 },
//                                 child: const Text('Download'),
//                               ),
//
//                             // if (widget.isEditable)
//                             //   ElevatedButton(
//                             //       style: ElevatedButton.styleFrom(
//                             //           backgroundColor: HexColor('2E8BD4')),
//                             //       onPressed: () {},
//                             //       child: const Text('Download')
//                             //   ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: HexColor('2E8BD4')),
//                               onPressed: () async {
//                                 for (int i = 0;
//                                     i < provider.quantityControllers.length;
//                                     i++) {
//                                   double qty = double.parse(
//                                       provider.quantityControllers[i].text);
//                                   double rate = double.parse(
//                                       provider.rateControllers[i].text);
//                                   double gross = double.parse(
//                                       provider.grossControllers[i].text);
//                                   provider.setOrderInvoiceDto(EstimateModel(
//                                     qty: qty,
//                                     rate: rate,
//                                     gross: gross,
//                                     productName:
//                                         provider.selectedService.length > i
//                                             ? provider
//                                                 .selectedService[i].productName
//                                             : '',
//                                     taxPercentage: 0,
//                                     isSittingService: false,
//                                     productProfileId:
//                                         provider.selectedService.length > i
//                                             ? provider.selectedService[i]
//                                                 .productProfileId
//                                             : -1,
//                                     unitId: 0,
//                                   ));
//                                 }
//                                 if (widget.isEditable == true) {
//                                   provider.createOrEstimateInvoice(
//                                       context: context,
//                                       totalAmount: provider.multipliedSum,
//                                       invoiceDate:
//                                           '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}',
//                                       customerId: provider.selectedCustomer?.id,
//                                       balanceAmount: (provider.multipliedSum -
//                                               advanceAmount -
//                                               receivedAmount)
//                                           .toString());
//                                 }
//                                 await provider
//                                     .createOrEstimateInvoice(
//                                         context: context,
//                                         totalAmount: provider.multipliedSum,
//                                         invoiceDate:
//                                             '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}',
//                                         customerId:
//                                             provider.selectedCustomer?.id,
//                                         balanceAmount: (provider.multipliedSum -
//                                                 advanceAmount -
//                                                 receivedAmount)
//                                             .toString())
//                                     .then((value) {
//                                   Navigator.of(context).pop();
//
//                                   if (checkboxValue == true) {
//                                     provider.getSendInvoiceWhatsapp(
//                                         context: context,
//                                         salesInvoiceId: widget.id);
//                                   }
//                                   if (widget.isEditable) {
//                                     provider.getInvoiceEdit(context: context);
//                                   }
//                                 });
//                               },
//
//                               // await provider.createOrEstimateInvoice(
//                               //     context: context,
//                               //     totalAmount: provider.multipliedSum,
//                               //     invoiceDate: DateTime.now().toIso8601String(),
//                               //     customerId: provider.selectedCustomer?.id,
//                               //     balanceAmount: (provider.multipliedSum -
//                               //             advanceAmount -
//                               //             receivedAmount)
//                               //         .toString()
//                               //     Navigator.of(context).pop(),
//                               //     );
//
//                               child: Text(checkboxValue ? 'Send' : 'Save'),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         )
//                       ],
//                     ),
//                   ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _customPopupItemBuilder2(
//       BuildContext context, Result serviceDetails, bool isSelected) {
//     return Column(
//       children: [
//         Container(
//           margin: const EdgeInsets.symmetric(horizontal: 8),
//           decoration: !isSelected
//               ? null
//               : BoxDecoration(
//                   border: Border.all(color: Theme.of(context).primaryColor),
//                   borderRadius: BorderRadius.circular(5),
//                   color: Colors.white,
//                 ),
//           child: ListTile(
//             selected: isSelected,
//             leading: Text(serviceDetails.name.toString()),
//           ),
//         ),
//         const Divider(),
//       ],
//     );
//   }
//
//   Widget _customPopupItemBuilder3(
//       BuildContext context, cust.Result customer, bool isSelected) {
//     return Column(
//       children: [
//         Container(
//           margin: const EdgeInsets.symmetric(horizontal: 8),
//           decoration: !isSelected
//               ? null
//               : BoxDecoration(
//                   border: Border.all(color: Theme.of(context).primaryColor),
//                   borderRadius: BorderRadius.circular(5),
//                   color: Colors.white,
//                 ),
//           child: ListTile(
//             selected: isSelected,
//             title: Text(customer.name.toString()),
//             subtitle: Text(customer.mobile.toString()),
//           ),
//         ),
//         const Divider(),
//       ],
//     );
//   }
// }
