import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:metlonev2_app/screens/app/customers/provider/customer_provider.dart';
import 'package:provider/provider.dart';

class InvoiceDetails extends StatefulWidget {
  const InvoiceDetails({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;
  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {
  @override
  void initState() {
    Future.microtask(() async {
      final CustomerProvider customerProvider = Provider.of<CustomerProvider>(
        context,
        listen: false,
      );
      customerProvider.getInvoiceDetailsLoading = true;
      await customerProvider.getInvoiceDetails(
        id: widget.id,
        context: context,
      );
    });
    super.initState();
  }

  double returnSum({required List? dataList}) {
    double sum = 0;
    for (int i = 0; i < dataList!.length; i++) {
      sum = sum + dataList[i].gross!;
    }
    return sum;
  }

  double receivedAmount({required sum, required advanceAmount}) {
    return sum - advanceAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Invoice Details'),
            backgroundColor: HexColor('2E8BD4'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DataTable(
                    border: TableBorder.all(color: Colors.grey),
                    columnSpacing: 20,
                    headingRowColor:
                        MaterialStatePropertyAll<Color>(HexColor('#D3D3D3')),
                    dataRowColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Item Details',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Quantity',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Rate',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Amount',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: (provider.invoiceDetails?.result.salesInvoice
                                .salesInvoiceDetailsListDto ??
                            [])
                        .map((e) {
                      return DataRow(cells: [
                        DataCell(Text('${e.productName}')),
                        DataCell(Text('${e.qty}')),
                        DataCell(Text('${e.rate}')),
                        DataCell(Text('${e.gross}'))
                        // Add cells for Quantity, Rate, and Amount here using data from 'e'
                      ]);
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                  'Sub Total: ₹ ${returnSum(dataList: provider.invoiceDetails?.result.salesInvoice.salesInvoiceDetailsListDto).toString()}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                  'Advance Amount: ₹${provider.invoiceDetails?.result.salesInvoice.advanceAmount}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                  'Received Amount: ₹ ${receivedAmount(sum: returnSum(dataList: provider.invoiceDetails?.result.salesInvoice.salesInvoiceDetailsListDto), advanceAmount: provider.invoiceDetails?.result.salesInvoice.advanceAmount)}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                  ' Balance Amount: ₹${provider.invoiceDetails?.result.salesInvoice.balanceAmount}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[200]),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'back',
                            style: TextStyle(color: Colors.black),
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: HexColor('2E8BD4')),
                          onPressed: () {
                            provider.sendInvoice(
                              context: context,
                              salesInvoiceId: widget.id,
                            );
                          },
                          child: const Text(
                            'Send',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
