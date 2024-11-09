import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/app/reports/model/payment_mode_model.dart';
import '../style/text_style_class.dart';

class CardWidgetPayment extends StatefulWidget {
  const CardWidgetPayment({
    Key? key,
    required this.listItem,
  }) : super(
          key: key,
        );
  final PaymentModeReport listItem;
  @override
  State<CardWidgetPayment> createState() => _CardWidgetPaymentState();
}

class _CardWidgetPaymentState extends State<CardWidgetPayment> {
  String getPaymentModeText(int? paymentMode) {
    switch (paymentMode) {
      case 1:
        return 'Cash';
      case 6:
        return 'UPI';
      case 5:
        return 'Card';
      default:
        return 'Unknown Payment Mode'; // Handle other cases as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // height: 200,
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
                        '${widget.listItem.saleNo}',
                        style: TextStyleClass.jakarthaBlackBold14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('MMM dd, yyyy')
                                .format(widget.listItem.date ?? DateTime.now()),
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
                        '${widget.listItem.userName}',
                        style: TextStyleClass.jakarthaSemiBlack14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Amount: ${widget.listItem.rate}',
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
                        '${widget.listItem.mobile}',
                        style: TextStyleClass.jakarthaSemiBlack14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        getPaymentModeText(widget.listItem.paymentMode),
                        style: TextStyleClass.jakarthaSemiBlack14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
