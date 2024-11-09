import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:metlonev2_app/api/dashboardapi/service.dart';
import 'package:metlonev2_app/screens/app/dashboard/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../style/colors_class.dart';
import '../../../style/text_style_class.dart';
import '../salesorder/provider/salesorder_provider.dart';
import 'model/graph_payment_model.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<ServiceData>? _chartData;
  List<ChartData>? chartData;
  Service? serviceVariable;
  late SfCircularChart chart;
  PaymentForGraph? paymentVariable;
  final _tooltipBehavior = TooltipBehavior(enable: true);

  String selectedOption = 'Monthly';
  String selectedOption1 = 'July';
  String selectedOption2 = 'Aug';
  String selectedOption3 = 'Sep';
  late Future<Service> futureService;
  @override
  void initState() {
    Future.microtask(() async {
      final DashBoardProvider dashBoardProvider =
          Provider.of<DashBoardProvider>(
        context,
        listen: false,
      );
      final SalesOrderProvider salesOrderProvider =
          Provider.of<SalesOrderProvider>(
        context,
        listen: false,
      );
      await dashBoardProvider.getTotalRevenue(context: context);
      // await salesOrderProvider.getSalesOrderDetails(
      //   context: context,
      //   customerName: '',
      // );
      await dashBoardProvider.getProfilePicDetails(context: context);
      await dashBoardProvider.getGraphPaymentDetails(context: context);

      serviceVariable = await getChartData();

      _chartData = [
        ServiceData(
          "Daily Delivered services count",
          serviceVariable?.result.monthlyDeliveredServicesCount ?? 0,
          HexColor('#34B06D'),
        ),
        ServiceData(
          "Daily Pending Service count",
          serviceVariable?.result.monthlyPendingServicesCount ?? 0,
          HexColor('FFC041'),
        ),
      ];
    });
    super.initState();

    // });

    // super.initState();
  }

  DateTime backPressedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Cash', 20),
      ChartData('Card', 35),
      ChartData('UPI', 38),
    ];

    return WillPopScope(
      onWillPop: () => _onBackButtonDoubleClicked(context),
      child: Consumer<DashBoardProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  provider.getTotalRevenueLoading
                      ? const CircularProgressIndicator()
                      : Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Text(
                                          'Total Monthly Revenue',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 20.0),
                                          child: Text(
                                            '₹ ${provider.totalRevenueModel?.result['totalSalesAmount'].toString()}',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: HexColor(
                                                  '009688'), // Customize the color if needed
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Text(
                                          'Total Monthly Service',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 20.0),
                                          child: Text(
                                            '${provider.totalRevenueModel?.result['saleInvoiceCount'].toString()}',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: HexColor(
                                                  '009688'), // Customize the color if needed
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                  provider.getTotalRevenueLoading
                      ? const CircularProgressIndicator()
                      : Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Text(
                                          'Daily Revenue',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 20.0),
                                          child: Text(
                                            '₹ ${provider.totalRevenueModel?.result['dailySailesAmount'].toString()}',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: HexColor(
                                                  '009688'), // Customize the color if needed
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Text(
                                          'Daily Service',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 20.0),
                                          child: Text(
                                            ' ${provider.totalRevenueModel?.result['dailySailesCount'].toString()}',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: HexColor(
                                                  '009688'), // Customize the color if needed
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                  const SizedBox(
                    height: 2,
                  ),
                  Center(
                    child: Card(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: PopupMenuButton(
                              onSelected: (newVal) {
                                selectedOption = newVal;

                                if (newVal == 'Daily') {
                                  _chartData = [
                                    // ServiceData(
                                    //   "Daily Total ServiceCount",
                                    //   serviceVariable?.result
                                    //           .dailyTotalServicesCount ??
                                    //       0,
                                    //   Colors.orange,
                                    // ),
                                    ServiceData(
                                      "Daily Delivered services count",
                                      serviceVariable?.result
                                              .dailyDeliveredServicesCount ??
                                          0,
                                      HexColor('#34B06D'),
                                    ),
                                    ServiceData(
                                      "Daily Pending Service count",
                                      serviceVariable?.result
                                              .dailyPendingServicesCount ??
                                          0,
                                      HexColor('FFC041'),
                                    ),
                                  ];
                                } else if (newVal == 'Weekly') {
                                  _chartData = [
                                    // ServiceData(
                                    //   "Weekly Total ServiceCount",
                                    //   serviceVariable?.result
                                    //           .weeklyTotalServicesCount ??
                                    //       73,
                                    //   Colors.orange,
                                    // ),
                                    ServiceData(
                                      "Weekly Delivered services count",
                                      serviceVariable?.result
                                              .weeklyDeliveredServicesCount ??
                                          2,
                                      HexColor('#34B06D'),
                                    ),
                                    ServiceData(
                                      "Weekly Pending Service count",
                                      serviceVariable?.result
                                              .weeklyPendingServicesCount ??
                                          75,
                                      HexColor('FFC041'),
                                    ),
                                  ];
                                } else {
                                  log('${serviceVariable?.result.monthlyDeliveredServicesCount}ON clickkkkk');

                                  _chartData = [
                                    // ServiceData(
                                    //   "Monthly Total ServiceCount",
                                    //   serviceVariable?.result
                                    //           .monthlyTotalServicesCount ??
                                    //       158,
                                    // ),
                                    ServiceData(
                                      "Monthly Delivered services count",
                                      serviceVariable?.result
                                              .monthlyDeliveredServicesCount ??
                                          14,
                                      HexColor('#34B06D'),
                                    ),
                                    ServiceData(
                                      "Monthly Pending Service count",
                                      serviceVariable?.result
                                              .monthlyPendingServicesCount ??
                                          176,
                                      HexColor('FFC041'),
                                    ),
                                  ];
                                }
                                setState(() {});
                              },
                              itemBuilder: (BuildContext context) {
                                return ['Daily', 'Weekly', 'Monthly']
                                    .map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice,
                                    child: Text(choice),
                                  );
                                }).toList();
                              },
                              initialValue: selectedOption,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Text(selectedOption),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(Icons.calendar_month),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SfCircularChart(
                            annotations: <CircularChartAnnotation>[
                              CircularChartAnnotation(
                                widget: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Total Service',
                                    ),
                                    selectedOption == 'Monthly'
                                        ? Text(
                                            ' ${serviceVariable?.result.monthlyTotalServicesCount}')
                                        : selectedOption == 'Weekly'
                                            ? Text(
                                                '  ${serviceVariable?.result.weeklyTotalServicesCount}')
                                            : Text(
                                                ' ${serviceVariable?.result.dailyTotalServicesCount}'),
                                  ],
                                ),
                              )
                            ],
                            tooltipBehavior: _tooltipBehavior,
                            // legend: Legend(
                            //     isVisible: true,
                            //     legendItemBuilder: (String name, dynamic series,
                            //         dynamic point, int index) {
                            //       if (index == 1) {
                            //         return Container(width: 0, height: 0);
                            //       }
                            //       return Container(
                            //         child: selectedOption == 'Monthly'
                            //             ? Text(
                            //                 'Monthly Total ServiceCount :  ${serviceVariable?.result.monthlyTotalServicesCount}')
                            //             : selectedOption == 'Weekly'
                            //                 ? Text(
                            //                     'Weekly Total ServiceCount :  ${serviceVariable?.result.weeklyTotalServicesCount}')
                            //                 : Text(
                            //                     'Daily Total ServiceCount :  ${serviceVariable?.result.dailyTotalServicesCount}'),
                            //       );
                            //     },
                            //     position: LegendPosition.bottom,
                            //     textStyle: TextStyle(color: Colors.grey[500])),
                            title: ChartTitle(
                              text: 'Service Details',
                            ),
                            series: <CircularSeries>[
                              DoughnutSeries<ServiceData, String>(
                                  enableTooltip: true,
                                  radius: "100",
                                  explode: true,
                                  dataSource: _chartData,
                                  pointColorMapper: (ServiceData data, _) =>
                                      data.color,
                                  xValueMapper: (ServiceData data, _) => data.x,
                                  yValueMapper: (ServiceData data, _) => data.y)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                          child: Column(
                            children: [
                              // Align(
                              //   alignment: Alignment.topRight,
                              //   child: PopupMenuButton(
                              //     icon: const Icon(Icons.calendar_month),
                              //     itemBuilder: (BuildContext context) {
                              //       return ['July', 'Aug', 'Sep']
                              //           .map((String newValue) {
                              //         return PopupMenuItem<String>(
                              //           value: newValue,
                              //           child: Text(newValue),
                              //         );
                              //       }).toList();
                              //     },
                              //   ),
                              // ),
                              SfCartesianChart(
                                legend: Legend(
                                  isVisible: true,
                                  position: LegendPosition
                                      .bottom, // Position the legend at the top
                                ),
                                primaryXAxis: CategoryAxis(),
                                primaryYAxis: NumericAxis(
                                  title: AxisTitle(
                                    text: 'Payment Mode',
                                    textStyle: TextStyleClass.jakarthaBlack12,
                                  ),
                                  // title: Padding(
                                  //   padding: EdgeInsets.only(
                                  //       bottom:
                                  //           8.0), // Add padding to the bottom
                                  //   child: AxisTitle(
                                  //     text: 'Payment Mode',
                                  //     textStyle: TextStyleClass
                                  //         .jakarthaSemiBoldBlack14,
                                  //   ),
                                  // ),
                                  numberFormat: NumberFormat.compact(),
                                ),
                                series: <ColumnSeries<ChartData, String>>[
                                  ColumnSeries<ChartData, String>(
                                    dataSource: provider.cashChartData,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    name: 'Cash',
                                    color: ColorClass.primaryColor,
                                  ),
                                  ColumnSeries<ChartData, String>(
                                    dataSource: provider.upiChartData,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    name: 'UPI',
                                    color: ColorClass.lightGreen,
                                  ),
                                  ColumnSeries<ChartData, String>(
                                    dataSource: provider.cardChartData,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    name: 'Card',
                                    color: ColorClass.yellowColor,
                                  ),
                                ],
                                tooltipBehavior: TooltipBehavior(
                                  enable:
                                      true, // Set to true to enable tooltips
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<Service?> getChartData() async {
    final DashBoardProvider dashBoardProvider = Provider.of<DashBoardProvider>(
      context,
      listen: false,
    );
    return await dashBoardProvider.getServiceDetails();
  }

  _onBackButtonDoubleClicked(BuildContext context) async {
    final difference = DateTime.now().difference(backPressedTime);
    backPressedTime = DateTime.now();
    if (difference >= const Duration(seconds: 2)) {
      toast(context, "Click again to close app");
      return false;
    } else {
      SystemNavigator.pop(animated: true);
      return true;
    }
  }

  void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ));
  }
}

class ServiceData {
  ServiceData(this.x, this.y, [Color? color])
      : color = color ?? Colors.green; // Set a default color if color is null

  final String x;
  final int y;
  final Color color;
}
