import 'package:flutter/material.dart';
import 'package:metlonev2_app/screens/app/dashboard/dashboard_screen..dart';

import '../../../style/text_style_class.dart';
import '../../style/colors_class.dart';

void emailConfirmation(
    {required BuildContext context, required VoidCallback onTap}) {
  showDialog(
    barrierColor: const Color(0x01000000),
    context: context,
    builder: (_) => Center(
      child: AlertDialog(
        alignment: Alignment.center,
        title: SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width / 4,
          // padding: const EdgeInsets.all(15.0),
          // child: Lottie.asset(AnimationClass.orderCompleted),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: 'Thank you for choosing US\n',
                    style: TextStyleClass.jakarthaBlackBold14,
                  ),
                  TextSpan(
                    text: 'Our team will connect you shortly',
                    style: TextStyleClass.jakarthaBlackBold14,
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        ColorClass.primaryColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashBoard(),
                        ),
                      );
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
