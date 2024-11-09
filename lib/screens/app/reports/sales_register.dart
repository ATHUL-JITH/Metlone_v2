import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:metlonev2_app/screens/app/reports/model/customer_dropdown_model.dart';
import 'package:metlonev2_app/screens/app/reports/provider/reports_provider.dart';
import 'package:provider/provider.dart';

import '../../../style/colors_class.dart';
import '../../../style/theme_button.dart';
import '../../../widgets/card_widget_sales.dart';
import 'model/branch_dropdown_model.dart';

class SalesRegister extends StatefulWidget {
  const SalesRegister({Key? key}) : super(key: key);

  @override
  State<SalesRegister> createState() => _SalesRegisterState();
}

class _SalesRegisterState extends State<SalesRegister> {
  String dropDown1 = 'QA';
  String salesDrop = 'ALL';
  String dealersDrop = 'All';

  bool checkboxValue = true;
  DateTime fromDate = DateTime(
      DateTime.now().year, DateTime.now().month - 6, DateTime.now().day);
  @override
  void initState() {
    Future.microtask(() async {
      final ReportsProvider reportsProvider = Provider.of<ReportsProvider>(
        context,
        listen: false,
      );
      reportsProvider.getSalesDetailsLoading = true;
      reportsProvider.getSalesDetailsLoading;

      reportsProvider.getAllCustomerDropDownLoading = true;
      reportsProvider.getAllCustomerDropDownLoading;

      await reportsProvider
          .getAllCustomerDropDown(context: context)
          .then((value) => reportsProvider.getSalesDetails(
                context: context,
                // salesOrderType: '',
                branchId: reportsProvider.selectedBranchForDropDown?.branchId
                        .toString() ??
                    '0',
                fromDate: DateFormat('yyyy.MM.dd').format(fromDate),
                toDate: DateFormat('yyyy.MM.dd').format(toDate),
                salesOrderType: reportsProvider.selectedSalesOrderType,

                customerId:
                    reportsProvider.customerDropDownId?.id.toString() ?? '0',
              ));
    });
    super.initState();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime(2023, 4, 1),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        fromDate = value!;
      });
    });
  }

  DateTime toDate = DateTime.now();
  void _showDatePickerTwo() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        toDate = value!;
      });
    });
  }

  void convertJsonToCsv(List<Map<String, dynamic>> jsonDataList) {
    // Convert the JSON data to a List<List<dynamic>>
    List<List<dynamic>> csvData = [];
    if (jsonDataList.isNotEmpty) {
      // Extracting headers from the first entry
      var headers = jsonDataList[0].keys.toList();
      csvData.add(headers);

      // Extracting data from each entry
      for (var data in jsonDataList) {
        var row = data.values.toList();
        csvData.add(row);
      }
    }

    // Convert List<List<dynamic>> to CSV format
    String csv = const ListToCsvConverter().convert(csvData);

    // Write CSV data to a file
    // File('data.csv' as List<Object>).writeAsString(csv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ReportsProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Colors.grey[200],
                    onPressed: _showDatePicker,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const Text(
                            'From Date',
                            style: TextStyle(color: Colors.black),
                          ),
                          // const Icon(Icons.calendar_today),
                          Text(
                            DateFormat('dd-MM-yyy').format(fromDate),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                MaterialButton(
                  color: Colors.grey[200],
                  onPressed: _showDatePickerTwo,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const Text(
                          'To Date',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                        ),
                        // const Icon(Icons.calendar_today),
                        Text(
                          DateFormat('dd-MM-yyy ').format(toDate),
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DropdownButtonFormField<DropDownBrnach?>(
                        decoration: InputDecoration(
                          labelText: 'Branch',
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        value: provider.selectedBranchForDropDown,
                        onChanged: (newValue) {
                          provider.selectedBranchForDropDown = newValue;
                        },
                        items: provider.branchList?.result.map((e) {
                          return DropdownMenuItem<DropDownBrnach>(
                            value: e,
                            child: Text(e.name ?? ''),
                          );
                        }).toList()),
                  ),
                ],
              ),
              // Column(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(20.0),
              //       child: DropdownSearch<String>(
              //         mode: Mode.MENU,
              //         showSelectedItem: true,
              //         items: [
              //           "QA",
              //           "Development",
              //           "Design",
              //           "Management"
              //         ], // Replace with your list of items
              //         label: "Branch",
              //         onChanged: (String? newValue) {
              //           setState(() {
              //             dropDown1 = newValue!;
              //           });
              //         },
              //         selectedItem: dropDown1,
              //         showSearchBox: true,
              //         searchBoxDecoration: InputDecoration(
              //           border: OutlineInputBorder(),
              //           contentPadding: EdgeInsets.symmetric(horizontal: 12),
              //           labelText: "Search Branch",
              //         ),
              //         dropdownSearchDecoration: InputDecoration(
              //           labelText: 'Branch',
              //           contentPadding:
              //               EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(5.0),
              //           ),
              //         ),
              //         dropdownBuilder: (context, item, isSelected) {
              //           return ListTile(
              //             title: Text(item),
              //             selected: isSelected,
              //           );
              //         },
              //       ),
              //     ),
              //   ],
              // ),

              // Column(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(20.0),
              //       child: DropdownButtonFormField<String>(
              //         decoration: InputDecoration(
              //           labelText: 'Branch',
              //           contentPadding:
              //               EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(5.0),
              //           ),
              //         ),
              //         value: dropDown1,
              //         onChanged: (String? newValue) {
              //           setState(() {
              //             dropDown1 = newValue!;
              //           });
              //         },
              //         items: const [
              //           DropdownMenuItem<String>(
              //             value: 'QA',
              //             child: const Text('QA'),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DropdownButtonFormField<Item?>(
                      decoration: InputDecoration(
                        labelText: 'Dealer',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      value: provider.customerDropDownId,
                      onChanged: (newVal) {
                        provider.customerDropDownId = newVal;
                      },
                      items: [
                        const DropdownMenuItem<Item>(
                          value:
                              null, // You can set it to the appropriate default value
                          child: Text('All'),
                        ),
                        if (provider.customerDropDown?.result?.items != null)
                          ...provider.customerDropDown!.result!.items!
                              .map<DropdownMenuItem<Item>>((e) {
                            return DropdownMenuItem<Item>(
                              value: e,
                              child: Text(
                                  "${e.displayName}"), // Assuming 'e' is of type String
                            );
                          }).toList(),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Sales Order Type',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      value: provider.selectedSalesOrderType,
                      onChanged: (String? newValue) {
                        provider.setSelectedSalesOrderType = newValue!;
                      },
                      items: const [
                        DropdownMenuItem<String>(
                          value: '0',
                          child: Text('ALL'),
                        ),
                        DropdownMenuItem<String>(
                          value: '2',
                          child: Text('Invoice B2C'),
                        ),
                        DropdownMenuItem<String>(
                          value: '3',
                          child: Text('Invoice B2B'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              ThemeButton(
                function: () {
                  provider.getSalesDetails(
                    context: context,
                    fromDate: DateFormat('yyyy.MM.dd').format(fromDate),
                    toDate: DateFormat('yyyy.MM.dd').format(toDate),
                    branchId: provider.selectedBranchForDropDown?.branchId
                            .toString() ??
                        '0',
                    salesOrderType: provider.selectedSalesOrderType,
                    customerId:
                        provider.customerDropDownId?.id.toString() ?? '0',
                  );
                },
                label: 'Search',
                color: ColorClass.primaryAccent,
              ),
              SizedBox(
                height: 3,
              ),
              // ThemeButton(
              //   function: () {},
              //   label: 'Export To Excel',
              //   color: ColorClass.primaryAccent,
              // ),

              Divider(color: Colors.grey[200]),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: provider
                        .getSalesDetailsLoading // Check if data is still loading
                    ? const CircularProgressIndicator(
                        color: Colors.blue,
                      )
                    : Column(
                        children:
                            provider.sales?.result!.salesRegisterListDto == null
                                ? [const SizedBox()]
                                : provider.sales!.result!.salesRegisterListDto!
                                    .map<Widget>((e) => CardWidgetSales(
                                          listItem: e,
                                        ))
                                    .toList(),
                      ),
              ),
            ]),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: ColorClass.greyFillColor,
          border: Border.all(
            color: ColorClass.borderColor,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(6),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total Gross"),
                  Spacer(),
                  Consumer<ReportsProvider>(
                    builder: (context, provider, child) {
                      return Text(
                          provider.sales?.result?.totalGross.toString() ?? '');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Tax Amount"),
                  Spacer(),
                  Consumer<ReportsProvider>(
                    builder: (context, provider, child) {
                      return Text(
                          provider.sales?.result?.totalTax.toString() ?? '');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
