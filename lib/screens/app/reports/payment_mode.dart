import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:metlonev2_app/screens/app/reports/model/branch_dropdown_model.dart';
import 'package:metlonev2_app/screens/app/reports/provider/reports_provider.dart';
import 'package:metlonev2_app/style/theme_button.dart';
import 'package:provider/provider.dart';

import '../../../style/colors_class.dart';
import '../../../widgets/card_widget_payment_mode.dart';

class PaymentMode extends StatefulWidget {
  const PaymentMode({Key? key}) : super(key: key);

  @override
  State<PaymentMode> createState() => _PaymentModeState();
}

class _PaymentModeState extends State<PaymentMode> {
  String dropDownValue = '5';

  bool checkboxValue = true;

  DateTime fromDate = DateTime(
      DateTime.now().year, DateTime.now().month - 6, DateTime.now().day);
  DateTime toDate = DateTime.now();


  @override
  void initState() {
    Future.microtask(() async {
      final ReportsProvider reportsProvider = Provider.of<ReportsProvider>(
        context,
        listen: false,
      );
      reportsProvider.getPaymentModeDetailsLoading = true;
      reportsProvider.getPaymentModeDetailsLoading;

      reportsProvider.getBranchDetailsLoading = true;
      reportsProvider.getBranchDetailsLoading;
      await reportsProvider
          .getBranchDetails(
            context: context,
          )
          .then(
            (value) => reportsProvider.getPaymentModeDetails(
              context: context,
              fromDate: DateFormat('yyyy-MM-dd').format(
                fromDate,
              ),
              toDate: DateFormat('yyyy-MM-dd').format(
                toDate,
              ),
              paymentType: reportsProvider.selectedPaymentType,
              branchId: reportsProvider.selectedBranchForDropDown?.branchId
                      .toString() ??
                  '0',
            ),
          );
    });
    super.initState();
  }

  void _showFromDatePicker() {
    showDatePicker(
            context: context,
            initialDate: fromDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      fromDate = value!;
      setState(() {});
    });
  }

  DateTime selectedDateTimeTwo = DateTime.now();
  void _showToDatePicker() {
    showDatePicker(
            context: context,
            initialDate: toDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        toDate = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ReportsProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Colors.grey[200],
                        onPressed: _showFromDatePicker,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const Text(
                                'From Date',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                '${fromDate.day}-${fromDate.month}-${fromDate.year}',
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
                      onPressed: _showToDatePicker,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Text(
                              'To Date',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '${toDate.day}-${toDate.month}-${toDate.year}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Payment Mode',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      value: provider.selectedPaymentType,
                      onChanged: (String? newValue) {
                        provider.setSelectedPaymentType = newValue!;
                      },
                      items: const [
                        DropdownMenuItem<String>(
                          value: '0',
                          child: Text('All'),
                        ),
                        DropdownMenuItem<String>(
                          value: '1',
                          child: Text('Cash'),
                        ),
                        DropdownMenuItem<String>(
                          value: '5',
                          child: Text('Card'),
                        ),
                        DropdownMenuItem<String>(
                          value: '6',
                          child: Text('UPI'),
                        ),
                      ],
                    ),
                  ),
                ]),
                ThemeButton(
                  function: () {
                    provider.getPaymentModeDetails(
                      context: context,
                      fromDate: DateFormat('yyyy.MM.dd').format(fromDate),
                      toDate: DateFormat('yyyy.MM.dd').format(toDate),
                      paymentType: provider.selectedPaymentType,
                      branchId: provider.selectedBranchForDropDown?.branchId
                              .toString() ??
                          '0',
                    );
                  },
                  label: 'Search',
                  color: ColorClass.primaryAccent,
                ),
                Divider(
                  color: Colors.grey[200],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: provider.getPaymentModeDetailsLoading
                      ? const CircularProgressIndicator(
                          color: Colors.blue,
                        )
                      : Column(
                          children: provider.paymentMode?.result!
                                      .paymentModeReports ==
                                  null
                              ? [const SizedBox()]
                              : provider
                                  .paymentMode!.result!.paymentModeReports!
                                  .map<Widget>((e) => CardWidgetPayment(
                                        listItem: e,
                                      ))
                                  .toList(),
                        ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 50,
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
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total Rate"),
                  const Spacer(),
                  Consumer<ReportsProvider>(
                    builder: (context, provider, child) {
                      return Text(
                          provider.paymentMode?.result?.totalRate.toString() ??
                              '');
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
