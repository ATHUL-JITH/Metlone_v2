import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:metlonev2_app/screens/app/customers/model/customer_list_model.dart';
import 'package:metlonev2_app/screens/app/customers/provider/customer_provider.dart';
import 'package:provider/provider.dart';

import '../../../style/colors_class.dart';
import '../../../style/text_field_widget.dart';

class CustomerEdit extends StatefulWidget {
  const CustomerEdit({
    Key? key,
    required this.customer,
  }) : super(key: key);
  final Item? customer;

  @override
  State<CustomerEdit> createState() => _CustomerEditState();
}

class _CustomerEditState extends State<CustomerEdit> {
  @override
  void initState() {
    Future.microtask(() async {
      final CustomerProvider customerProvider = Provider.of<CustomerProvider>(
        context,
        listen: false,
      );
      customerProvider.createCustomerLoading = true;
      customerProvider.setTextFieldData(data: widget.customer);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<CustomerProvider>(
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
                              'Edit Customer',
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
                              controller: provider.customerController,
                              textInputType: TextInputType.name,
                              label: 'Customer Name',
                              textInputAction: TextInputAction.next,
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFieldWidget(
                              // function: () {
                              //   provider.setName = provider.serviceController.text!;
                              // },
                              controller: provider.emailController,
                              textInputType: TextInputType.name,
                              label: 'E-mail',
                              textInputAction: TextInputAction.next,
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: IntlPhoneField(
                                controller: provider.phoneController,
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
                                controller: provider.mobileController,
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
                              controller: provider.gstController,
                              textInputType: TextInputType.name,
                              label: 'GSTIN',
                              textInputAction: TextInputAction.next,
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: HexColor('2E8BD4')),
                                onPressed: () async {
                                  await provider.getEditCustomer(
                                    data: widget.customer,
                                    context: context,
                                  );
                                },
                                child: const Text(
                                  'Save',
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
