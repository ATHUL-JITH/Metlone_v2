// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:open_file/open_file.dart' as open_file;
// import 'package:path_provider/path_provider.dart' as path_provider;
// import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column;
//
// //Local imports
//
// /// Represents the XlsIO widget class.
// class CreateExcelWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: CreateExcelStatefulWidget(title: 'Create Excel document'),
//     );
//   }
// }
//
// /// Represents the XlsIO stateful widget class.
// class CreateExcelStatefulWidget extends StatefulWidget {
//   /// Initalize the instance of the [CreateExcelStatefulWidget] class.
//   const CreateExcelStatefulWidget({Key? key, required this.title})
//       : super(key: key);
//
//   /// title.
//   final String title;
//   @override
//   // ignore: library_private_types_in_public_api
//   _CreateExcelState createState() => _CreateExcelState();
// }
//
// class _CreateExcelState extends State<CreateExcelStatefulWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextButton(
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: Colors.lightBlue,
//                 disabledForegroundColor: Colors.grey,
//               ),
//               onPressed: generateExcel,
//               child: const Text('Export Excel'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   ///To save the Excel file in the device
//   ///To save the Excel file in the device
//   Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
//     //Get the storage folder location using path_provider package.
//     String? path;
//     if (Platform.isAndroid ||
//         Platform.isIOS ||
//         Platform.isLinux ||
//         Platform.isWindows) {
//       final Directory directory =
//           await path_provider.getApplicationSupportDirectory();
//       path = directory.path;
//     }
//     final File file =
//         File(Platform.isWindows ? '$path\\$fileName' : '$path/$fileName');
//     await file.writeAsBytes(bytes, flush: true);
//     if (Platform.isAndroid || Platform.isIOS) {
//       //Launch the file (used open_file package)
//       await open_file.OpenFile.open('$path/$fileName');
//     } else if (Platform.isWindows) {
//       await Process.run('start', <String>['$path\\$fileName'],
//           runInShell: true);
//     } else if (Platform.isMacOS) {
//       await Process.run('open', <String>['$path/$fileName'], runInShell: true);
//     } else if (Platform.isLinux) {
//       await Process.run('xdg-open', <String>['$path/$fileName'],
//           runInShell: true);
//     }
//   }
//
//   Future<void> generateExcel() async {
//     //Create a Excel document.
//
//     //Creating a workbook.
//     final Workbook workbook = Workbook();
//     //Accessing via index
//     final Worksheet sheet = workbook.worksheets[0];
//     sheet.showGridlines = false;
//
//     // Enable calculation for worksheet.
//     sheet.enableSheetCalculations();
//
//     //Set data in the worksheet.
//     sheet.getRangeByName('A1').columnWidth = 4.82;
//     sheet.getRangeByName('B1:C1').columnWidth = 13.82;
//     sheet.getRangeByName('D1').columnWidth = 13.20;
//     sheet.getRangeByName('E1').columnWidth = 7.50;
//     sheet.getRangeByName('F1').columnWidth = 9.73;
//     sheet.getRangeByName('G1').columnWidth = 8.82;
//     sheet.getRangeByName('H1').columnWidth = 4.46;
//
//     sheet.getRangeByName('A1:H1').cellStyle.backColor = '#333F4F';
//     sheet.getRangeByName('A1:H1').merge();
//     sheet.getRangeByName('B4:D6').merge();
//
//     sheet.getRangeByName('B4').setText('Invoice');
//     sheet.getRangeByName('B4').cellStyle.fontSize = 32;
//
//     sheet.getRangeByName('B8').setText('BILL TO:');
//     sheet.getRangeByName('B8').cellStyle.fontSize = 9;
//     sheet.getRangeByName('B8').cellStyle.bold = true;
//
//     sheet.getRangeByName('B9').setText('Abraham Swearegin');
//     sheet.getRangeByName('B9').cellStyle.fontSize = 12;
//
//     sheet
//         .getRangeByName('B10')
//         .setText('United States, California, San Mateo,');
//     sheet.getRangeByName('B10').cellStyle.fontSize = 9;
//
//     sheet.getRangeByName('B11').setText('9920 BridgePointe Parkway,');
//     sheet.getRangeByName('B11').cellStyle.fontSize = 9;
//
//     sheet.getRangeByName('B12').setNumber(9365550136);
//     sheet.getRangeByName('B12').cellStyle.fontSize = 9;
//     sheet.getRangeByName('B12').cellStyle.hAlign = HAlignType.left;
//
//     final Range range1 = sheet.getRangeByName('F8:G8');
//     final Range range2 = sheet.getRangeByName('F9:G9');
//     final Range range3 = sheet.getRangeByName('F10:G10');
//     final Range range4 = sheet.getRangeByName('F11:G11');
//     final Range range5 = sheet.getRangeByName('F12:G12');
//
//     range1.merge();
//     range2.merge();
//     range3.merge();
//     range4.merge();
//     range5.merge();
//
//     sheet.getRangeByName('F8').setText('INVOICE#');
//     range1.cellStyle.fontSize = 8;
//     range1.cellStyle.bold = true;
//     range1.cellStyle.hAlign = HAlignType.right;
//
//     sheet.getRangeByName('F9').setNumber(2058557939);
//     range2.cellStyle.fontSize = 9;
//     range2.cellStyle.hAlign = HAlignType.right;
//
//     sheet.getRangeByName('F10').setText('DATE');
//     range3.cellStyle.fontSize = 8;
//     range3.cellStyle.bold = true;
//     range3.cellStyle.hAlign = HAlignType.right;
//
//     sheet.getRangeByName('F11').dateTime = DateTime(2020, 08, 31);
//     sheet.getRangeByName('F11').numberFormat =
//         r'[$-x-sysdate]dddd, mmmm dd, yyyy';
//     range4.cellStyle.fontSize = 9;
//     range4.cellStyle.hAlign = HAlignType.right;
//
//     range5.cellStyle.fontSize = 8;
//     range5.cellStyle.bold = true;
//     range5.cellStyle.hAlign = HAlignType.right;
//
//     final Range range6 = sheet.getRangeByName('B15:G15');
//     range6.cellStyle.fontSize = 10;
//     range6.cellStyle.bold = true;
//
//     sheet.getRangeByIndex(15, 2).setText('Code');
//     sheet.getRangeByIndex(16, 2).setText('CA-1098');
//     sheet.getRangeByIndex(17, 2).setText('LJ-0192');
//     sheet.getRangeByIndex(18, 2).setText('So-B909-M');
//     sheet.getRangeByIndex(19, 2).setText('FK-5136');
//     sheet.getRangeByIndex(20, 2).setText('HL-U509');
//
//     sheet.getRangeByIndex(15, 3).setText('Description');
//     sheet.getRangeByIndex(16, 3).setText('AWC Logo Cap');
//     sheet.getRangeByIndex(17, 3).setText('Long-Sleeve Logo Jersey, M');
//     sheet.getRangeByIndex(18, 3).setText('Mountain Bike Socks, M');
//     sheet.getRangeByIndex(19, 3).setText('ML Fork');
//     sheet.getRangeByIndex(20, 3).setText('Sports-100 Helmet, Black');
//
//     sheet.getRangeByIndex(15, 3, 15, 4).merge();
//     sheet.getRangeByIndex(16, 3, 16, 4).merge();
//     sheet.getRangeByIndex(17, 3, 17, 4).merge();
//     sheet.getRangeByIndex(18, 3, 18, 4).merge();
//     sheet.getRangeByIndex(19, 3, 19, 4).merge();
//     sheet.getRangeByIndex(20, 3, 20, 4).merge();
//
//     sheet.getRangeByIndex(15, 5).setText('Quantity');
//     sheet.getRangeByIndex(16, 5).setNumber(2);
//     sheet.getRangeByIndex(17, 5).setNumber(3);
//     sheet.getRangeByIndex(18, 5).setNumber(2);
//     sheet.getRangeByIndex(19, 5).setNumber(6);
//     sheet.getRangeByIndex(20, 5).setNumber(1);
//
//     sheet.getRangeByIndex(15, 6).setText('Price');
//     sheet.getRangeByIndex(16, 6).setNumber(8.99);
//     sheet.getRangeByIndex(17, 6).setNumber(49.99);
//     sheet.getRangeByIndex(18, 6).setNumber(9.50);
//     sheet.getRangeByIndex(19, 6).setNumber(175.49);
//     sheet.getRangeByIndex(20, 6).setNumber(34.99);
//
//     sheet.getRangeByIndex(15, 7).setText('Total');
//     sheet.getRangeByIndex(16, 7).setFormula('=E16*F16+(E16*F16)');
//     sheet.getRangeByIndex(17, 7).setFormula('=E17*F17+(E17*F17)');
//     sheet.getRangeByIndex(18, 7).setFormula('=E18*F18+(E18*F18)');
//     sheet.getRangeByIndex(19, 7).setFormula('=E19*F19+(E19*F19)');
//     sheet.getRangeByIndex(20, 7).setFormula('=E20*F20+(E20*F20)');
//     sheet.getRangeByIndex(15, 6, 20, 7).numberFormat = r'$#,##0.00';
//
//     sheet.getRangeByName('E15:G15').cellStyle.hAlign = HAlignType.right;
//     sheet.getRangeByName('B15:G15').cellStyle.fontSize = 10;
//     sheet.getRangeByName('B15:G15').cellStyle.bold = true;
//     sheet.getRangeByName('B16:G20').cellStyle.fontSize = 9;
//
//     sheet.getRangeByName('E22:G22').merge();
//     sheet.getRangeByName('E22:G22').cellStyle.hAlign = HAlignType.right;
//     sheet.getRangeByName('E23:G24').merge();
//
//     final Range range7 = sheet.getRangeByName('E22');
//     final Range range8 = sheet.getRangeByName('E23');
//     range7.setText('TOTAL');
//     range7.cellStyle.fontSize = 8;
//     range8.setFormula('=SUM(G16:G20)');
//     range8.numberFormat = r'$#,##0.00';
//     range8.cellStyle.fontSize = 24;
//     range8.cellStyle.hAlign = HAlignType.right;
//     range8.cellStyle.bold = true;
//
//     sheet.getRangeByIndex(26, 1).text =
//         '800 Interchange Blvd, Suite 2501, Austin, TX 78721 | support@adventure-works.com';
//     sheet.getRangeByIndex(26, 1).cellStyle.fontSize = 8;
//
//     final Range range9 = sheet.getRangeByName('A26:H27');
//     range9.cellStyle.backColor = '#ACB9CA';
//     range9.merge();
//     range9.cellStyle.hAlign = HAlignType.center;
//     range9.cellStyle.vAlign = VAlignType.center;
//
//     //Save and launch the excel.
//     final List<int> bytes = workbook.saveAsStream();
//     //Dispose the document.
//     workbook.dispose();
//
//     //Save and launch the file.
//     await saveAndLaunchFile(bytes, 'Invoice.xlsx');
//   }
// }
// // import 'dart:io';
// //
// // import 'package:excel/excel.dart';
// // import 'package:path/path.dart';
// //
// // void main(List<String> args) {
// //   //var file = "/Users/kawal/Desktop/excel/test/test_resources/example.xlsx";
// //   //var bytes = File(file).readAsBytesSync();
// //   var excel = Excel.createExcel();
// //   // or
// //   //var excel = Excel.decodeBytes(bytes);
// //
// //   ///
// //   ///
// //   /// reading excel file values
// //   ///
// //   ///
// //   for (var table in excel.tables.keys) {
// //     print(table);
// //     print(excel.tables[table]!.maxCols);
// //     print(excel.tables[table]!.maxRows);
// //     for (var row in excel.tables[table]!.rows) {
// //       print("${row.map((e) => e?.value)}");
// //     }
// //   }
// //
// //   ///
// //   /// Change sheet from rtl to ltr and vice-versa i.e. (right-to-left -> left-to-right and vice-versa)
// //   ///
// //   var sheet1rtl = excel['Sheet1'].isRTL;
// //   excel['Sheet1'].isRTL = false;
// //   print(
// //       'Sheet1: ((previous) isRTL: $sheet1rtl) ---> ((current) isRTL: ${excel['Sheet1'].isRTL})');
// //
// //   var sheet2rtl = excel['Sheet2'].isRTL;
// //   excel['Sheet2'].isRTL = true;
// //   print(
// //       'Sheet2: ((previous) isRTL: $sheet2rtl) ---> ((current) isRTL: ${excel['Sheet2'].isRTL})');
// //
// //   ///
// //   ///
// //   /// declaring a cellStyle object
// //   ///
// //   ///
// //   CellStyle cellStyle = CellStyle(
// //     bold: true,
// //     italic: true,
// //     textWrapping: TextWrapping.WrapText,
// //     fontFamily: getFontFamily(FontFamily.Comic_Sans_MS),
// //     rotation: 0,
// //   );
// //
// //   var sheet = excel['mySheet'];
// //
// //   var cell = sheet.cell(CellIndex.indexByString("A1"));
// //   cell.value = "Heya How are you I am fine ok goood night";
// //   cell.cellStyle = cellStyle;
// //
// //   var cell2 = sheet.cell(CellIndex.indexByString("E5"));
// //   cell2.value = "Heya How night";
// //   cell2.cellStyle = cellStyle;
// //
// //   /// printing cell-type
// //   print("CellType: " + cell.cellType.toString());
// //
// //   ///
// //   ///
// //   /// Iterating and changing values to desired type
// //   ///
// //   ///
// //   for (int row = 0; row < sheet.maxRows; row++) {
// //     sheet.row(row).forEach((Data? cell1) {
// //       if (cell1 != null) {
// //         cell1.value = ' My custom Value ';
// //       }
// //     });
// //   }
// //
// //   excel.rename("mySheet", "myRenamedNewSheet");
// //
// //   var sheet1 = excel['Sheet1'];
// //   sheet1.cell(CellIndex.indexByString('A1')).value = 'Sheet1';
// //
// //   /// fromSheet should exist in order to sucessfully copy the contents
// //   excel.copy('Sheet1', 'newlyCopied');
// //
// //   var sheet2 = excel['newlyCopied'];
// //   sheet2.cell(CellIndex.indexByString('A1')).value = 'Newly Copied Sheet';
// //
// //   /// renaming the sheet
// //   excel.rename('oldSheetName', 'newSheetName');
// //
// //   /// deleting the sheet
// //   excel.delete('Sheet1');
// //
// //   /// unlinking the sheet if any link function is used !!
// //   excel.unLink('sheet1');
// //
// //   sheet = excel['sheet'];
// //
// //   /// appending rows and checking the time complexity of it
// //   Stopwatch stopwatch = Stopwatch()..start();
// //   List<List<String>> list = List.generate(
// //       9000, (index) => List.generate(20, (index1) => '$index $index1'));
// //
// //   print('list creation executed in ${stopwatch.elapsed}');
// //   stopwatch.reset();
// //   list.forEach((row) {
// //     sheet.appendRow(row);
// //   });
// //   print('appending executed in ${stopwatch.elapsed}');
// //
// //   sheet.appendRow([8]);
// //   bool isSet = excel.setDefaultSheet(sheet.sheetName);
// //   // isSet is bool which tells that whether the setting of default sheet is successful or not.
// //   if (isSet) {
// //     print("${sheet.sheetName} is set to default sheet.");
// //   } else {
// //     print("Unable to set ${sheet.sheetName} to default sheet.");
// //   }
// //
// //   var colIterableSheet = excel['ColumnIterables'];
// //
// //   var colIterables = ['A', 'B', 'C', 'D', 'E'];
// //   int colIndex = 0;
// //
// //   colIterables.forEach((colValue) {
// //     colIterableSheet.cell(CellIndex.indexByColumnRow(
// //       rowIndex: colIterableSheet.maxRows,
// //       columnIndex: colIndex,
// //     ))
// //       ..value = colValue;
// //   });
// //
// //   // Saving the file
// //
// //   String outputFile = "/Users/kawal/Desktop/git_projects/r.xlsx";
// //
// //   //stopwatch.reset();
// //   List<int>? fileBytes = excel.save();
// //   //print('saving executed in ${stopwatch.elapsed}');
// //   if (fileBytes != null) {
// //     File(join(outputFile))
// //       ..createSync(recursive: true)
// //       ..writeAsBytesSync(fileBytes);
// //   }
// // }
