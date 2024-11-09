import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:metlonev2_app/screens/app/reports/payment_mode.dart';
import 'package:metlonev2_app/screens/app/reports/sales_register.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage>
    with SingleTickerProviderStateMixin {
  List<String> tabs = ['Sales Register', 'Payment Mode'];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFFFFF'),
      body: Column(
        children: [
          Container(
            color: Colors.white, // Customize the container's color
            child: TabBar(
              tabs: const [
                Tab(text: 'Sales Register'),
                Tab(text: 'Payment Mode'),
              ],
              controller: _tabController,
              labelColor: Colors.black,
              indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.black.withOpacity(0.5),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                SalesRegister(),
                PaymentMode(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
