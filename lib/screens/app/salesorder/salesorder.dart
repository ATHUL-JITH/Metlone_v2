import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:metlonev2_app/screens/app/salesorder/edit_invoice.dart';
import 'package:metlonev2_app/screens/app/salesorder/provider/salesorder_provider.dart';
import 'package:metlonev2_app/screens/app/salesorder/salesorder_invoice.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';

import '../../../style/colors_class.dart';

class SalesOrder extends StatefulWidget {
  const SalesOrder({Key? key}) : super(key: key);

  @override
  State<SalesOrder> createState() => _SalesOrderState();
}

class _SalesOrderState extends State<SalesOrder> {
  final GlobalKey<EditInvoiceState> editInvoiceKey =
      GlobalKey<EditInvoiceState>();
  @override
  void initState() {
    Future.microtask(() async {
      final SalesOrderProvider salesOrderProvider =
          Provider.of<SalesOrderProvider>(
        context,
        listen: false,
      );
      salesOrderProvider.salesOrderLoading = true;
      salesOrderProvider.salesOrderLoading;
      await salesOrderProvider.getSalesOrderDetails(
        context: context,
        searchKeyword: '',
        skipCount: salesOrderProvider.currentSkipCount.toString(),
        minInvoiceDate: DateFormat('yyyy.MM.dd').format(selectedDateOne),
        maxInvoiceDate: DateFormat('yyyy.MM.dd').format(selectedDateTwo),
        statusId: '3',
      );
    });
    super.initState();
  }

  List<String> tabs = ['Pending', 'Ready to Delivery'];
  String selectedStatus = '0';
  String salesDrop = 'All';

  // DateTime selectedDate = DateTime.now();

  DateTime selectedDateOne = DateTime(
      DateTime.now().year, DateTime.now().month - 6, DateTime.now().day);
  DateTime selectedDateTwo = DateTime.now();

  TextEditingController toDateControllerOne = TextEditingController(
    text: DateFormat('dd-MM-yyyy').format(
      DateTime(
          DateTime.now().year, DateTime.now().month - 6, DateTime.now().day),
    ),
  );
  TextEditingController toDateControllerTwo = TextEditingController(
    text: DateFormat('dd-MM-yyyy').format(
      DateTime.now(),
    ),
  );

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      context: context,
      builder: (BuildContext context) => Consumer<SalesOrderProvider>(
        builder: (context, provider, child) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              Future<void> showDatePickerOne() async {
                final DateTime now = DateTime.now();
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2023, 4, 1),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                );

                if (picked != null && picked != selectedDateOne) {
                  selectedDateOne = picked;
                  // Format the selected date as "dd-MM-yyyy"
                  final formattedDate = DateFormat('dd-MM-yyyy').format(picked);
                  toDateControllerOne.text = formattedDate;
                }
              }

              Future<void> showDatePickerTwo() async {
                final DateTime now = DateTime.now();
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: now,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                );

                if (picked != null && picked != selectedDateTwo) {
                  selectedDateTwo = picked;
                  // Format the selected date as "dd-MM-yyyy"
                  final formattedDate = DateFormat('dd-MM-yyyy').format(picked);
                  toDateControllerTwo.text = formattedDate;
                }
              }

              return Container(
                height: 380,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Expanded(
                        child: TextField(
                          onTap: () {
                            showDatePickerOne();
                          },
                          keyboardType: TextInputType.none,
                          showCursor: false,
                          controller: toDateControllerOne,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.calendar_today),
                            labelText: 'From Date',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: const TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        onTap: () {
                          showDatePickerTwo();
                        },
                        keyboardType: TextInputType.none,
                        showCursor: false,
                        controller: toDateControllerTwo,
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.calendar_today),
                          labelText: 'To Date',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: const TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  value: selectedStatus,
                                  borderRadius: BorderRadius.circular(10),
                                  icon: const Icon(Icons.arrow_drop_down),
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: (String? newValue) {
                                    // provider.getSalesOrderDetails(
                                    //   context: context,
                                    //   skipCount: '0',
                                    //   statusId: selectedStatus,
                                    //   minInvoiceDate: DateFormat('yyyy.MM.dd')
                                    //       .format(selectedDateOne),
                                    //   maxInvoiceDate: DateFormat('yyyy.MM.dd')
                                    //       .format(selectedDateTwo),
                                    // );
                                    setState(() {
                                      selectedStatus = newValue!;
                                    });
                                  },
                                  items: const [
                                    DropdownMenuItem<String>(
                                      value: '3',
                                      child: Text('All'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '0',
                                      child: Text('Pending'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '1',
                                      child: Text('Ready to Delivery'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '2',
                                      child: Text('Delivered'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '4',
                                      child: Text('Cancelled'),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.grey[300]),
                            child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Back',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      HexColor('2E8BD4'))),
                              onPressed: () {
                                provider.getSalesOrderDetails(
                                  context: context,
                                  skipCount: '0',
                                  searchKeyword: '',
                                  minInvoiceDate: DateFormat('yyyy.MM.dd')
                                      .format(selectedDateOne),
                                  // statusId: 3,
                                  maxInvoiceDate: DateFormat('yyyy.MM.dd')
                                      .format(selectedDateTwo),
                                  // maxInvoiceDate: DateFormat('yyyy.MM.dd')
                                  //     .format(selectedDateTwo),
                                  statusId: selectedStatus,
                                );
                                Navigator.pop(context);
                              },
                              child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'Filter',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _searchController;
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: HexColor('#FFFFFF'),
        body: Consumer<SalesOrderProvider>(
          builder: (context, provider, child) {
            return RefreshIndicator(
              onRefresh: () async {
                await provider.getSalesOrderDetails(
                  context: context,
                  searchKeyword: '',
                  skipCount: '0',
                  minInvoiceDate:
                      DateFormat('yyyy.MM.dd').format(selectedDateOne),
                  maxInvoiceDate:
                      DateFormat('yyyy.MM.dd').format(selectedDateTwo),
                  statusId: '3',
                );
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: ColorClass.boxShadowColor,
                                    blurRadius: 15.0,
                                  ),
                                ],
                                border: Border.all(
                                  width: 2,
                                  color: ColorClass.borderColor,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: ColorClass.white),
                            child: TextFormField(
                              onChanged: (val) {
                                provider.getSalesOrderDetails(
                                    context: context,
                                    skipCount:
                                        provider.currentSkipCount.toString(),
                                    statusId: '0',
                                    searchKeyword: val,
                                    maxInvoiceDate: '',
                                    minInvoiceDate: '');
                              },
                              cursorColor: Colors.blue,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      color: Colors.blue,
                                      onPressed: () {
                                        _displayBottomSheet(context);
                                      },
                                      icon: const Icon(Icons.filter_alt)),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Colors.blue,
                                  ),
                                  hintText: 'search...',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          width: 2,
                                          color: ColorClass.transparent)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          width: 2,
                                          color: ColorClass.transparent)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          width: 2,
                                          color: ColorClass.transparent)),
                                  fillColor: ColorClass.greyFillColor,
                                  isDense: true,
                                  filled: true),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: const Text(
                            'New Order',
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  // isEditable: false,
                                  // brnachId: '',
                                  builder: (context) => EditInvoice(
                                    id: '0',
                                    key: editInvoiceKey,
                                    fileName: '',
                                    date: '',
                                    totalAmount: '',
                                    balanceAmount: '',
                                    advanceAmount: '',
                                    isEditable: false,
                                    brnachId: '',
                                  ),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Expanded(
                    child: PendingScreen(),
                  ),
                  provider.salesOrder != null &&
                          provider.salesOrder!.result != null &&
                          provider.salesOrder!.result!.items != null &&
                          provider.salesOrder!.result!.items!.isNotEmpty
                      ? NumberPaginator(
                          config: const NumberPaginatorUIConfig(
                            // buttonSelectedBackgroundColor: Colors.white,
                            // buttonSelectedForegroundColor: Colors.white,
                            // buttonUnselectedBackgroundColor: Colors.white,
                            // buttonUnselectedForegroundColor: Colors.white,
                            mode: ContentDisplayMode.numbers,
                            height: 40,
                          ),
                          initialPage: 0,
                          numberPages:
                              (provider.salesOrder!.result!.totalCount! / 10)
                                  .ceil(),
                          onPageChange: (int index) async {
                            log('Index $index  skip ${(index * 20).toString()}');
                            if (index != 0) {
                              provider.getSalesOrderDetails(
                                statusId: selectedStatus,
                                searchKeyword: '',
                                context: context,
                                skipCount: (index * 20).toString(),
                                maxInvoiceDate: '',
                                minInvoiceDate: '',
                              );
                            } else {
                              provider.getSalesOrderDetails(
                                  statusId: selectedStatus,
                                  context: context,
                                  skipCount: '0',
                                  searchKeyword: '',
                                  maxInvoiceDate: '',
                                  minInvoiceDate: '');
                            }
                          },
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            );
          },
        ),
        // floatingActionButton: FloatingActionButton(
        //     backgroundColor: HexColor('2E8BD4'),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => EditInvoice(
        //             isEditable: false,
        //             brnachId: '',
        //           ),
        //         ),
        //       );
        //     },
        //     child: const Icon(Icons.add, color: Colors.white)),
      ),
    );
  }
}
