// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// class ChartScreen extends StatelessWidget {
//   final List<ChartData> cashData = [
//     ChartData('January', 9000),
//     ChartData('February', 2500),
//     ChartData('March', 1800),
//     ChartData('April', 3500),
//   ];
//
//   final List<ChartData> cardData = [
//     ChartData('January', 1500),
//     ChartData('February', 2000),
//     ChartData('March', 2200),
//     ChartData('April', 3000),
//   ];
//   final List<ChartData> upiData = [
//     ChartData('January', 1500),
//     ChartData('February', 2000),
//     ChartData('March', 2200),
//     ChartData('April', 3000),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bar Chart'),
//       ),
//       body: Center(
//         child: Container(
//           height: 400, // Adjust the height as needed
//           padding: EdgeInsets.all(16),
//           child: SfCartesianChart(
//             primaryXAxis: CategoryAxis(),
//             primaryYAxis: NumericAxis(
//               title: AxisTitle(text: 'payment Mode'),
//             ),
//             series: <ColumnSeries<ChartData, String>>[
//               ColumnSeries<ChartData, String>(
//                 dataSource: cashData,
//                 xValueMapper: (ChartData data, _) => data.x,
//                 yValueMapper: (ChartData data, _) => data.y,
//                 name: 'Income',
//               ),
//               ColumnSeries<ChartData, String>(
//                 dataSource: upiData,
//                 xValueMapper: (ChartData data, _) => data.x,
//                 yValueMapper: (ChartData data, _) => data.y,
//                 name: 'Expense',
//               ),
//               ColumnSeries<ChartData, String>(
//                 dataSource: cardData,
//                 xValueMapper: (ChartData data, _) => data.x,
//                 yValueMapper: (ChartData data, _) => data.y,
//                 name: 'Money',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Bar Chart Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ChartScreen(),
//     );
//   }
// }
//
// // class ChartData {
// //   ChartData(this.x, this.y);
// //
// //   final String x;
// //   final double y;
// // }
