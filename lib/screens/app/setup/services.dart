import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:metlonev2_app/screens/app/setup/provider/user_provider.dart';
import 'package:metlonev2_app/style/text_style_class.dart';
import 'package:provider/provider.dart';

import '../../../style/colors_class.dart';
import '../../../style/text_field_widget.dart';
import '../../../style/theme_button.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  void initState() {
    Future.microtask(() async {
      final UserProvider userProvider = Provider.of<UserProvider>(
        context,
        listen: false,
      );

      userProvider.getServiceDetailsLoading = true;
      userProvider.getServiceDetailsLoading;

      userProvider.getCreateOrEditDetailsLoading = true;
      userProvider.getCreateOrEditDetailsLoading;

      userProvider.getDeleteDetailsLoading = true;
      userProvider.getDeleteDetailsLoading;

      await userProvider.getServiceDetails(
        context: context,
        name: '',
      );

      // await userProvider.getServiceDetailsLoading;
    });
    super.initState();
  }

  bool checkboxValue = true;
  // Function to show the add service dialog
  final TextEditingController serviceController = TextEditingController();
  final TextEditingController rateController = TextEditingController();

  void _showAddServiceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<UserProvider>(
          builder: (context, provider, child) {
            return AlertDialog(
              title: const Text('Add Service'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Add your input fields for adding a service here
                  // For example:
                  TextFieldWidget(
                    // function: () {
                    //   provider.setName = provider.serviceController.text!;
                    // },
                    controller: provider.serviceController,
                    textInputType: TextInputType.name,
                    label: 'Service',
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                  ),
                  TextFieldWidget(
                    controller: provider.rateController,
                    textInputType: TextInputType.number,
                    label: 'Rate',
                    obscureText: false,
                  ),
                  CheckboxListTile(
                    activeColor: HexColor('2E8BD4'),
                    title: const Text(
                      "Reference No",
                      style: TextStyleClass.jakarthaBlackBold14,
                    ),
                    value: checkboxValue,
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          checkboxValue = value;
                        });
                      }
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ],
              ),
              actions: [
                // TextButton(
                //   onPressed: () {
                //     // Add your logic to save the service here
                //     // For example, close the dialog:
                //     Navigator.of(context).pop();
                //   },
                //   child: const Text(
                //     'Cancel',
                //     style: TextStyle(color: Colors.black),
                //   ),
                // ),
                TextButton(
                  onPressed: () async {
                    await provider.getCreateOrEditDetails(
                        context: context, id: '0');
                    Navigator.of(context).pop();
                  },
                  child:
                      const Text('Save', style: TextStyle(color: Colors.blue)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: HexColor('2E8BD4'),
            onPressed: () => _showAddServiceDialog(context),
            child: const Icon(Icons.add),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await provider.getServiceDetails(
                context: context,
                name: '',
              );
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
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
                          provider.getServiceDetails(
                            context: context,
                            name: val,
                          );
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

                  // ElevatedButton.icon(
                  //   style: ElevatedButton.styleFrom(
                  //       fixedSize: const Size(150, 50),
                  //       backgroundColor: HexColor('2E8BD4')),
                  //   onPressed: () {},
                  //   icon: const Icon(
                  //     Icons.add_circle,
                  //     size: 20.0,
                  //   ),
                  //   label: const Text('Add Service'),
                  // ),
                  Divider(
                    color: Colors.grey[200],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      dividerThickness: 3,
                      showBottomBorder: true,
                      headingRowColor:
                          MaterialStatePropertyAll<Color>(HexColor('#D3D3D3')),
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Service',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Created On',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Rate',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Edit',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                      rows: (provider.serviceCreate?.result?.items ?? [])
                          .map((e) {
                        // rows: provider.serviceCreate!.result!.items!.map((e) {
                        return DataRow(cells: [
                          DataCell(Text(
                            '${e.name}',
                            style: const TextStyle(color: Colors.black),
                          )),
                          DataCell(Text(
                            '${e.createdOn}',
                            style: const TextStyle(color: Colors.black),
                          )),
                          DataCell(Text(
                            '	${e.saleRate}',
                            style: const TextStyle(color: Colors.black),
                          )),
                          DataCell(PopupMenuButton(
                            tooltip: "",
                            itemBuilder: (context) {
                              return [
                                const PopupMenuItem(
                                  value: 'edit',
                                  child: Row(
                                    children: [
                                      Text(
                                        'Edit',
                                      ),
                                    ],
                                  ),
                                ),
                                const PopupMenuItem(
                                  value: 'delete',
                                  child: Row(
                                    children: [
                                      Text(
                                        'Delete',
                                      ),
                                    ],
                                  ),
                                )
                              ];
                            },
                            onSelected: (String value) {
                              if (value == 'delete') {
                                log("akkkkkkkkkkkkkkkkkkkkk");
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Are you sure'),
                                    content:
                                        const Text('Do you want to delete'),
                                    actions: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ThemeButton(
                                              function: () async {
                                                await provider.getDeleteDetails(
                                                    context: context,
                                                    id: e.id.toString() ?? '');
                                                // await UserProvider.delete(
                                                //   context: context,
                                                //   id: provider.Delete?.result?[success].id.toString() ??
                                                //       '0',,
                                                // );
                                                // Navigator.pop(context);
                                              },
                                              label: 'Yes',
                                              color: ColorClass.blueGreen,
                                            ),
                                          ),
                                          Expanded(
                                            child: ThemeButton(
                                              function: () {
                                                Navigator.pop(context);
                                              },
                                              label: 'Cancel',
                                              color: ColorClass.gradiantColor1,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              } else if (value == 'edit') {}
                            },
                          ))
                        ]);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
