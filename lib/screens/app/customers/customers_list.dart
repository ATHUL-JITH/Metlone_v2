import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:metlonev2_app/screens/app/customers/customer_list_edit_dialog.dart';
import 'package:metlonev2_app/screens/app/customers/customers_list_details.dart';
import 'package:metlonev2_app/screens/app/customers/provider/customer_provider.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';

import '../../../style/colors_class.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({Key? key}) : super(key: key);

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  @override
  void initState() {
    Future.microtask(() async {
      final CustomerProvider customerProvider = Provider.of<CustomerProvider>(
        context,
        listen: false,
      );
      customerProvider.getCustomerListLoading = true;
      customerProvider.getCustomerListLoading;
      await customerProvider.getCustomerList(
          context: context,
          name: '',
          skipCount: customerProvider.currentSkipCount.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor('FFFFFF'),
      body: Consumer<CustomerProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8),
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
                      color: ColorClass.white),
                  child: TextFormField(
                    onChanged: (val) {
                      provider.getCustomerList(
                          context: context,
                          name: val,
                          skipCount: provider.currentSkipCount.toString());
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                        hintText: 'search...',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 2, color: ColorClass.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 2, color: ColorClass.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 2, color: ColorClass.transparent)),
                        fillColor: ColorClass.greyFillColor,
                        isDense: true,
                        filled: true),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              provider.getCustomerListLoading
                  ? const CircularProgressIndicator()
                  : provider.customerList != null &&
                          provider.customerList!.result != null &&
                          provider.customerList!.result!.items != null &&
                          provider.customerList!.result!.items!.isNotEmpty
                      ? Expanded(
                          child: ListView.separated(
                            itemCount:
                                provider.customerList?.result?.items?.length ??
                                    0,
                            separatorBuilder: (context, index) {
                              return const Divider(
                                height: 18,
                                thickness: 1,
                              );
                            },
                            itemBuilder: (context, index) {
                              return ListTile(
                                trailing: IconButton(
                                  icon: const Icon(Icons.arrow_forward_ios),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CustomerEdit(
                                              customer: provider.customerList
                                                  ?.result?.items?[index]),
                                        ));
                                  },
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CustomersDetails(
                                        customerId: provider.customerList
                                                ?.result?.items?[index].id
                                                .toString() ??
                                            '0',
                                      ),
                                    ),
                                  );
                                },
                                leading: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: HexColor('2E8BD4'),
                                    radius: 20,
                                    child: const Icon(Icons.person,
                                        color: Colors.white),
                                  ),
                                ),
                                title: Text(
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    provider.customerList?.result?.items?[index]
                                            .name ??
                                        ''),
                                subtitle: Text(
                                  provider.customerList?.result?.items?[index]
                                          .mobile ??
                                      '',
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            },
                            // itemCount: arrNames.length,
                          ),
                        )
                      : Text('No Data'),
              provider.customerList != null &&
                      provider.customerList!.result != null &&
                      provider.customerList!.result!.items != null &&
                      provider.customerList!.result!.items!.isNotEmpty
                  ? NumberPaginator(
                      config: const NumberPaginatorUIConfig(
                        buttonSelectedBackgroundColor: Colors.white,
                        buttonSelectedForegroundColor: Colors.blue,
                        // buttonUnselectedBackgroundColor: Colors.white,
                        // buttonUnselectedForegroundColor: Colors.white,
                        mode: ContentDisplayMode.numbers,
                        height: 40,
                      ),
                      initialPage: 0,
                      numberPages:
                          (provider.customerList!.result!.totalCount! / 10)
                              .ceil(),
                      onPageChange: (int index) async {
                        print('Index $index  skip ${(index * 20).toString()}');
                        if (index != 0) {
                          provider.getCustomerList(
                              context: context,
                              name: '',
                              skipCount: (index * 20).toString());
                        } else {
                          provider.getCustomerList(
                              context: context, name: '', skipCount: '0');
                        }
                      },
                    )
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
