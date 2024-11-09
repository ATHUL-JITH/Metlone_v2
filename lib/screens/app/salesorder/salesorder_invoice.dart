import 'package:flutter/material.dart';
import 'package:metlonev2_app/screens/app/salesorder/provider/salesorder_provider.dart';
import 'package:provider/provider.dart';

import '../../../widgets/card_widget.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  late PageController pageController;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    );
    Future.microtask(() async {
      final SalesOrderProvider salesOrderProvider =
          Provider.of<SalesOrderProvider>(
        context,
        listen: false,
      );
      salesOrderProvider.salesOrderLoading = true;
      salesOrderProvider.salesOrderLoading;

      // salesOrderProvider.getCreateInvoiceDetailsLoading = true;
      // salesOrderProvider.getCreateInvoiceDetailsLoading;
      //
      // salesOrderProvider.getCompanyBranchDetailsLoading = true;
      // salesOrderProvider.getCompanyBranchDetailsLoading;
      //
      // salesOrderProvider.getUpadateStatusLoading = true;
      // salesOrderProvider.getUpadateStatusLoading;

      await salesOrderProvider.getBranchSettingsInfoDetails(
        context: context,
      );
      // await salesOrderProvider.getCreateInvoiceDetails(
      //   context: context,
      // );
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<SalesOrderProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  /*  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditInvoice(
                        balanceAmount: '',
                        fileName: '',
                        date: '',
                        totalAmount: '',
                        advanceAmount: '',
                        isEditable: true,
                        brnachId: '',
                        id: '',
                      ),
                    ),
                  );*/
                },
                child: provider.salesOrderLoading
                    ? const CircularProgressIndicator(
                        color: Colors.blue,
                      )
                    : Column(
                        children: provider.salesOrder!.result!.items == null
                            ? [const SizedBox()]
                            : provider.salesOrder!.result!.items!
                                .map<Widget>((e) => CardWidget(
                                      listItem: e,
                                    ))
                                .toList(),
                      ),
              ),
            ],
          ),
        ),
      );
    });
  }
}


class Order {
  final String invoiceNo;
  final String name;
  final double amount;
  String status;

  int mobile;

  Order({
    required this.invoiceNo,
    required this.name,
    required this.amount,
    required this.status,
    required this.mobile,
  });
}
