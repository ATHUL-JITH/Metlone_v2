import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:metlonev2_app/screens/app/customers/customer_list_details_invoice.dart';
import 'package:metlonev2_app/screens/app/customers/provider/customer_provider.dart';
import 'package:provider/provider.dart';

import '../../../style/colors_class.dart';
import '../../../style/theme_button.dart';

class CustomersDetails extends StatefulWidget {
  const CustomersDetails({Key? key, required this.customerId})
      : super(key: key);
  final String customerId;

  @override
  State<CustomersDetails> createState() => _CustomersDetailsState();
}

class _CustomersDetailsState extends State<CustomersDetails> {
  String salesDrop = 'All';
  String statusSelected = '0';
  @override
  void initState() {
    Future.microtask(() async {
      final CustomerProvider customerProvider = Provider.of<CustomerProvider>(
        context,
        listen: false,
      );
      customerProvider.getCustomerListDetailsLoading = true;
      await customerProvider.getCustomerInvoiceDetails(
          customerId: widget.customerId,
          context: context,
          searchKeyWord: '',
          statusId: '3'
          // statusId: '',
          );
    });
    super.initState();
  }

  String getStatusText(num? status) {
    if (status == 0) {
      return 'Pending';
    } else if (status == 1) {
      return 'Ready to Delivery';
    } else if (status == 2) {
      return 'Delivered';
    } else {
      return 'Unknown Status'; // Handle other cases as needed
    }
  }

  void _showPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Remarks'),
          content: const Text(
            'Test',
            style: TextStyle(fontWeight: FontWeight.bold),
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

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 180,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Expanded(
                            child: SizedBox(
                              height: 60,
                              width: 360,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                value: statusSelected,
                                borderRadius: BorderRadius.circular(10),
                                icon: const Icon(Icons.arrow_drop_down),
                                style: const TextStyle(color: Colors.black),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    statusSelected = newValue!;
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
                              backgroundColor:
                                  MaterialStatePropertyAll(HexColor('2E8BD4'))),
                          onPressed: () {},
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: HexColor('FFFFFF'),
          appBar: AppBar(
            backgroundColor: HexColor('2E8BD4'),
            title: const Text('Customer Details'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                    color: ColorClass.white,
                  ),
                  child: TextFormField(
                    onChanged: (val) {
                      provider.getCustomerInvoiceDetails(
                          context: context,
                          customerId: widget.customerId,
                          searchKeyWord: val,
                          statusId: '3');
                    },
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        color: Colors.blue,
                        onPressed: () {
                          _displayBottomSheet(context);
                        },
                        icon: const Icon(Icons.filter_alt),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 2,
                          color: ColorClass.transparent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 2,
                          color: ColorClass.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 2,
                          color: ColorClass.transparent,
                        ),
                      ),
                      fillColor: ColorClass.greyFillColor,
                      isDense: true,
                      filled: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DataTable(
                          border: TableBorder.all(color: Colors.grey),
                          columnSpacing: 20,
                          headingRowColor: MaterialStatePropertyAll<Color>(
                              HexColor('#D3D3D3')),
                          dataRowColor: const MaterialStatePropertyAll<Color>(
                              Colors.white),
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Invoice No',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Invoice Date',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Status',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Amount',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Remarks',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                          rows: (provider.customersListDetails?.result.items ??
                                  [])
                              .map((e) {
                            final formattedDate = DateFormat('MMM dd, yyyy')
                                .format(e.invoiceDate);
                            return DataRow(
                              onLongPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InvoiceDetails(
                                      id: e.id.toString(),
                                    ),
                                  ),
                                );
                              },
                              cells: [
                                DataCell(Text(e.salesNo)),
                                DataCell(Text(formattedDate)),
                                DataCell(Text(
                                  getStatusText(e.status),
                                )),
                                DataCell(Text('₹ ${e.totalAmount}')),
                                DataCell(
                                  GestureDetector(
                                    onTap: () {
                                      _showPopup();
                                    },
                                    child: const Icon(
                                      Icons.article,
                                    ),
                                  ),
                                )
                              ],
                              // GestureDetector(
                              //     onTap: () {
                              //       _showPopup();
                              //     },
                              //     child: const Expanded(
                              //         child: Icon(
                              //       Icons.article,
                              //     ))),
                            );
                          }).toList(),
                        ),
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
  }
}
