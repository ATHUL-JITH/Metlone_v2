// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:metlonev2_app/screens/app/setup/provider/user_provider.dart';
import 'package:provider/provider.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  int _currentPage = 0;
//   @override
  @override
  void initState() {
    Future.microtask(() async {
      final UserProvider userProvider = Provider.of<UserProvider>(
        context,
        listen: false,
      );
      userProvider.getUserProviderDetailsLoading = true;
      userProvider.getUserProviderDetailsLoading;
      await userProvider.getUserProviderDetails(
        context: context,
        skipCount: 0,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: provider.getUserProviderDetailsLoading
                    ? const CircularProgressIndicator()
                    : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: DataTable(
                          showBottomBorder: true,
                          headingRowColor: MaterialStatePropertyAll<Color>(
                              HexColor('#D3D3D3')),
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text(
                                'USERNAME',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'EMAIL',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'PHONE',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'STATUS',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          rows: provider.userCreate!.result!.items!.map((e) {
                            return DataRow(cells: [
                              DataCell(Text(
                                '${e.name}',
                                style: const TextStyle(color: Colors.black),
                              )),
                              DataCell(Text(
                                '${e.emailAddress}',
                                style: const TextStyle(color: Colors.black),
                              )),
                              DataCell(Text(
                                '${e.phoneNumber}',
                                style: const TextStyle(color: Colors.black),
                              )),
                              DataCell(Text(
                                e.isActive == true ? 'Active' : 'Inactive',
                                style: TextStyle(
                                  color: e.isActive == true
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              )),
                            ]);
                          }).toList(), // [
                        ),
                      ),
              ),
              const Spacer(),
              // NumberPaginator(
              //   // by default, the paginator shows numbers as center content
              //   numberPages: 10,
              //   onPageChange: (int index) {
              //     setState(() {
              //       _currentPage = index;
              //     });
              //   },
              // ),
            ],
          ),
        );
      },
    );
  }
}
