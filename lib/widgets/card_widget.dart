import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:metlonev2_app/screens/app/salesorder/model/salesorder_model.dart';
import 'package:metlonev2_app/screens/app/salesorder/provider/salesorder_provider.dart';
import 'package:provider/provider.dart';

import '../screens/app/salesorder/edit_invoice.dart';
import '../screens/app/salesorder/edit_invoice_new.dart';
import '../style/colors_class.dart';
import '../style/dropdown_textfield.dart';
import '../style/text_style_class.dart';
import '../style/theme_button.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    required this.listItem,
  });
  final Item listItem;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  Color containerColor = Colors.orange; // Initial color
  String containerText = 'Pending';
  late int totalAmount;
  // void _updateContainerColor(bool isChecked) {
  //   setState(() {
  //     containerText = isChecked ? 'Ready to Delivery' : 'Pending';
  //     containerColor = isChecked ? Colors.green : Colors.orange;
  //   });
  // }

  void _showPopup({String? remarks}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Remarks'),
          content: Text(
            '$remarks',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: ThemeButton(
                    function: () {
                      Navigator.pop(context);
                    },
                    label: 'Close',
                    color: ColorClass.gradiantColor1,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  bool checkboxValues = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditInvoice(
                id: widget.listItem.id.toString(),
                fileName: '',
                date: '',
                totalAmount: '',
                advanceAmount: '',
                balanceAmount: '',
                isEditable: true,
                brnachId: '',
              ),
            ));
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<SalesOrderProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    // child: Container(
                    //   decoration: BoxDecoration(
                    //     color: containerColor,
                    //     borderRadius: BorderRadius.circular(
                    //       15,
                    //     ),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 8.0, vertical: 4.0),
                    //     child: Text(
                    //       containerText,
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //   ),
                    // ),
                  ),
                  Container(
                    height: 170,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          10), // Adjust the radius as needed
                      border: Border.all(
                        width: 1,
                        color: Colors.black26,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),

                                child: Text(
                                  '${widget.listItem.salesNo}',
                                  style: TextStyleClass.jakarthaBlackBold14,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  DateFormat('MMM dd, yyyy').format(
                                      widget.listItem.invoiceDate ??
                                          DateTime.now()),
                                  style: TextStyleClass.jakarthaSemiBlack14,
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.listItem.customerName}',
                                      style: TextStyleClass.jakarthaSemiBlack14,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '${widget.listItem.phoneNumber}',
                                      style: TextStyleClass.jakarthaSemiBlack14,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '₹  ${widget.listItem.totalAmount}',
                                    style:
                                        TextStyleClass.jakarthaBlackSemiBold20,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Expanded(
                          //     child: Checkbox(
                          //   value: checkboxValues,
                          //   onChanged: (value) {
                          //     setState(() {
                          //       checkboxValues = value!;
                          //       _updateContainerColor(checkboxValues);
                          //       _showPopup();
                          //     });
                          //   },
                          // )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // widget.listItem.status.toString()=='2'?
                              Container(
                                child: Text(''),
                              ),
                              widget.listItem.status.toString() == '2'
                                  ? Text(
                                      'Delivered',
                                      style: TextStyle(
                                          color: ColorClass.blueGreen),
                                    )
                                  : SizedBox(
                                      height: 50,
                                      width: 200.0,
                                      child: DropDownTextField(
                                          value:
                                              widget.listItem.status.toString(),
                                          hintText: 'Status',
                                          itemList: const [
                                            DropdownMenuItem(
                                              value: '0',
                                              child: Text(
                                                'Pending',
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: '1',
                                              child: Text(
                                                'Ready to delivery',
                                                style: TextStyle(
                                                    color: ColorClass.green),
                                              ),
                                            ),
                                            /*  DropdownMenuItem(
                                              value: '2',
                                              child: Text(
                                                'Delivered',
                                                style: TextStyle(
                                                    color:
                                                        ColorClass.blueGreen),
                                              ),
                                            ),*/
                                          ],
                                          onChanged: (newValue) async {
                                            await provider.getUpdateStatus(
                                              context: context,
                                              invoiceId:
                                                  widget.listItem.id.toString(),
                                              statusId: newValue,
                                            );
                                          }),
                                    ),
                              widget.listItem.remarks != null
                                  ? GestureDetector(
                                      onTap: () {
                                        _showPopup(
                                            remarks: widget.listItem.remarks);
                                      },
                                      child: const Icon(
                                        Icons.article,
                                      ))
                                  : const SizedBox.shrink(),
                            ],
                          ),

                          // Row(
                          //   children: [
                          //
                          //   ],
                          // ),

                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: DropDownTextField(
                          //       value: 'Pending',
                          //       onChanged: (val) {},
                          //       hideBorder: false,
                          //       hintText: 'Pending',
                          //       itemList: const [
                          //         DropdownMenuItem(
                          //           value: 'Pending',
                          //           child: Text('Pending',
                          //               style: TextStyleClass.jakarthaBlackSemiBold14),
                          //         ),
                          //         DropdownMenuItem(
                          //           value: 'Ready to delivery',
                          //           child: Text('Ready to delivery',
                          //               style: TextStyleClass.jakarthaBlackSemiBold14),
                          //         ),
                          //       ]),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
