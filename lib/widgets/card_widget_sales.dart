import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/app/reports/model/sales_model.dart';
import '../style/text_style_class.dart';

class CardWidgetSales extends StatefulWidget {
  const CardWidgetSales({
    super.key,
    required this.listItem,
  });
  final SalesRegisterListDto listItem;

  @override
  State<CardWidgetSales> createState() => _CardWidgetSalesState();
}

class _CardWidgetSalesState extends State<CardWidgetSales> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 120,
        // width: 410,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(10), // Adjust the radius as needed
          border: Border.all(
            width: 1,
            color: Colors.black26,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${widget.listItem.invoiceNo}',
                      style: TextStyleClass.jakarthaBlackBold14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          DateFormat('MMM dd, yyyy').format(
                              widget.listItem.invoiceDate ?? DateTime.now()),
                          style: TextStyleClass.jakarthaSemiBlack14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.listItem.customer ?? '',
                      style: TextStyleClass.jakarthaBlackBold14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.listItem.gross == null
                          ? ""
                          : widget.listItem.gross.toString(),
                      style: TextStyleClass.jakarthaBlackBold14,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.listItem.custGstinNo ?? '',
                      style: TextStyleClass.jakarthaBlackBold14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.listItem.totalTax == null
                          ? ''
                          : widget.listItem.totalTax.toString(),
                      style: TextStyleClass.jakarthaBlackBold14,
                    ),
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
