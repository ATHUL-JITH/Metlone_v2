import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:metlonev2_app/screens/app/salesorder/provider/salesorder_provider.dart';
import 'package:provider/provider.dart';

import '../../../style/colors_class.dart';
import '../../../style/text_field_widget.dart';

class NewUser extends StatefulWidget {
  const NewUser({super.key});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController mobileCodeController = TextEditingController();
  final TextEditingController phoneCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<SalesOrderProvider>(
              builder: (context, provider, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SafeArea(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Add Customer',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFieldWidget(
                              // function: () {
                              //   provider.setName = provider.serviceController.text!;
                              // },
                              controller: customerNameController,
                              textInputType: TextInputType.name,
                              label: 'Customer Name',
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFieldWidget(
                              // function: () {
                              //   provider.setName = provider.serviceController.text!;
                              // },
                              controller: emailController,
                              textInputType: TextInputType.name,
                              label: 'E-mail',
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: IntlPhoneField(
                                onCountryChanged: (val) {
                                  phoneCodeController.text = val.code;
                                },
                                controller: phoneController,
                                initialCountryCode: 'IN',
                                decoration: InputDecoration(
                                    label: const Text('Primary Mobile No'),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorClass.lightGray
                                                .withOpacity(0.7),
                                            width: 1),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(06),
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorClass.lightGray
                                                .withOpacity(0.7),
                                            width: 1),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(06),
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorClass.lightGray
                                                .withOpacity(0.7),
                                            width: 1),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(06),
                                        ))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: IntlPhoneField(
                                onCountryChanged: (val) {
                                  mobileCodeController.text = val.code;
                                },
                                controller: mobileController,
                                initialCountryCode: 'IN',
                                decoration: InputDecoration(
                                    label: const Text('Secondary Mobile No'),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorClass.lightGray
                                                .withOpacity(0.7),
                                            width: 1),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(06),
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorClass.lightGray
                                                .withOpacity(0.7),
                                            width: 1),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(06),
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorClass.lightGray
                                                .withOpacity(0.7),
                                            width: 1),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(06),
                                        ))),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFieldWidget(
                              // function: () {
                              //   provider.setName = provider.serviceController.text!;
                              // },
                              controller: gstController,
                              textInputType: TextInputType.name,
                              label: 'GSTIN',
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: HexColor('2E8BD4')),
                                onPressed: () async {
                                  if (gstController.text.length != 15) {
                                    FloatingSnackBar(
                                        message: "Please enter a valid GSTIN",
                                        context: context);
                                  } else {
                                    await provider.getIfCustomerExits(
                                      context: context,
                                      mobileCode: mobileCodeController.text,
                                      customerEmail: emailController.text,
                                      customerMobile: phoneController.text,
                                      customerName: customerNameController.text,
                                      customerPhone: mobileController.text,
                                      gst: gstController.text,
                                      isEstimate: false,
                                      isNonTax: false,
                                      phoneCode: phoneCodeController.text,
                                    );
                                  }
                                },
                                child: const Text(
                                  'ADD',
                                ))
                          ],
                        )),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
