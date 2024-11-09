import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:metlonev2_app/screens/app/dashboard/model/dashboard_total_revenue_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../api/dashboardapi/service.dart';
import '../../../../utils/api_support.dart';
import '../../login/model/profilepic_model.dart';
import '../model/graph_payment_model.dart';

class DashBoardProvider with ChangeNotifier {
  Service? serviceDetails;
  PaymentForGraph? graphPaymentDetails;
  bool getServiceDetailsLoading = false;
  bool getGraphPaymentDetailsLoading = true;

  // Future<void> getServiceDetails({
  //   required BuildContext context,
  // }) async {
  //   try {
  //     getServiceDetailsLoading = true;
  //     notifyListeners();
  //
  //     /// token
  //     final SharedPreferences preferences =
  //         await SharedPreferences.getInstance();
  //     final String? token = preferences.getString("token");
  //     log("TOKEN $token");
  //
  //     // String loanId = preferences.getString('referenceId') ?? '0';
  //
  //     /// url
  //     final Uri url = Uri.parse(
  //       ApiSupport.baseUrl + ApiSupport.serviceDetails,
  //     );
  //
  //     /// headers
  //     final Map<String, String> headers =
  //         ApiSupport.headers(token: token, origin: true);
  //
  //     /// response
  //     final Response response = await get(url, headers: headers);
  //     log(url.toString());
  //
  //     if (response.statusCode == 200) {
  //       log("RESPONSE  ${response.body}");
  //       _serviceDetails = serviceFromJson(response.body);
  //
  //       getServiceDetailsLoading = false;
  //       notifyListeners();
  //     } else {
  //       getServiceDetailsLoading = false;
  //       notifyListeners();
  //       log(response.body);
  //       log("Server Error / $url / ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     getServiceDetailsLoading = false;
  //
  //     notifyListeners();
  //     rethrow;
  //   }
  //   notifyListeners();
  // }
  ///chartapi
  Future<Service?> getServiceDetails() async {
    log("Step 0 passed");

    /// token
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? token = preferences.getString("token");
    log("TOKEN $token");

    /// headers
    final Map<String, String> headers =
        ApiSupport.headers(token: token, origin: true);

    /// url
    final Uri url = Uri.parse(
      ApiSupport.baseUrl + ApiSupport.serviceDetails,
    );

    /// response
    final Response response = await get(url, headers: headers);
    log(url.toString());
    serviceDetails = null;
    notifyListeners();
    if (response.statusCode == 200) {
      log("RESPONSE  ${response.body}");
      serviceDetails = serviceFromJson(response.body);
      notifyListeners();
      return serviceDetails;
    } else {
      getServiceDetailsLoading = false;
      notifyListeners();
      log(response.body);
      log('server error');
    }
  }

  // late List<PaymentData> graph;

  List<ChartData> cashChartData = [];
  List<ChartData> upiChartData = [];
  List<ChartData> cardChartData = [];
  setGraphList() {
    cashChartData = [
      ChartData(
        graphPaymentDetails?.result?[0].monthName.toString() ?? '',
        graphPaymentDetails?.result?[0].cash!.toDouble() ?? 0.0,
      ),
      ChartData(
        graphPaymentDetails?.result![1].monthName.toString() ?? '',
        graphPaymentDetails?.result![1].cash!.toDouble() ?? 0.0,
      ),
      ChartData(
        graphPaymentDetails?.result![2].monthName.toString() ?? '',
        graphPaymentDetails?.result![2].cash!.toDouble() ?? 0.0,
      ),
      ChartData(
        graphPaymentDetails?.result![3].monthName.toString() ?? '',
        graphPaymentDetails?.result![3].cash!.toDouble() ?? 0.0,
      ),
    ];
    upiChartData = [
      ChartData(
        graphPaymentDetails?.result![0].monthName.toString() ?? '',
        graphPaymentDetails?.result![0].upi!.toDouble() ?? 0.0,
      ),
      ChartData(
        graphPaymentDetails?.result![1].monthName.toString() ?? '',
        graphPaymentDetails?.result![1].upi!.toDouble() ?? 0.0,
      ),
      ChartData(
        graphPaymentDetails?.result![2].monthName.toString() ?? '',
        graphPaymentDetails?.result![2].upi!.toDouble() ?? 0.0,
      ),
      ChartData(
        graphPaymentDetails?.result![3].monthName.toString() ?? '',
        graphPaymentDetails?.result![3].upi!.toDouble() ?? 0.0,
      ),
    ];
    cardChartData = [
      ChartData(
        graphPaymentDetails?.result![0].monthName.toString() ?? '',
        graphPaymentDetails?.result![0].card!.toDouble() ?? 0.0,
      ),
      ChartData(
        graphPaymentDetails?.result![1].monthName.toString() ?? '',
        graphPaymentDetails?.result![1].card!.toDouble() ?? 0.0,
      ),
      ChartData(
        graphPaymentDetails?.result![2].monthName.toString() ?? '',
        graphPaymentDetails?.result![2].card!.toDouble() ?? 0.0,
      ),
      ChartData(
        graphPaymentDetails?.result![3].monthName.toString() ?? '',
        graphPaymentDetails?.result![3].card!.toDouble() ?? 0.0,
      ),
    ];
    notifyListeners();
  }

  Future<void> getGraphPaymentDetails({
    required BuildContext context,
  }) async {
    try {
      getGraphPaymentDetailsLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");
      // String loanId = preferences.getString('referenceId') ?? '0';

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.graphPaymentDetails,
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      /// response
      final Response response = await get(url, headers: headers);
      log(url.toString());

      if (response.statusCode == 200) {
        log("RESPONSE  ${response.body}");
        graphPaymentDetails = paymentForGraphFromJson(response.body);
        setGraphList();
        // graphPaymentDetails?.result?.map((e) {
        //   // return PaymentData(e.monthName.toString(), e.cash ?? );
        // }).toList();

        getGraphPaymentDetailsLoading = false;
        notifyListeners();
      } else {
        getGraphPaymentDetailsLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      getGraphPaymentDetailsLoading = false;

      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  ///ProfilePicture api
  bool getProfilePicLoading = false;

  ProfilePicture? profilePicture;
  Future<void> getProfilePicDetails({
    required BuildContext context,
  }) async {
    try {
      print('wwww');
      getProfilePicLoading = false;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");

      ///url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.profilePicture,
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(origin: true, token: token);

      /// response
      final Response response = await get(url, headers: headers);
      log(url.toString());
      if (response.statusCode == 200) {
        // log("RESPONSE  ${response.body}");
        profilePicture = profilePictureFromJson(response.body);
        getProfilePicLoading = false;
        notifyListeners();
      } else {
        log("Status code is not working ${response.statusCode}");
        getProfilePicLoading = false;
        notifyListeners();
      }
    } catch (e) {
      getProfilePicLoading = false;
      log('Error Caught $e');
    }
  }

  /// TotalRevenue api
  bool getTotalRevenueLoading = false;
  TotalRevenue? totalRevenueModel;
  Future<void> getTotalRevenue({
    required BuildContext context,
  }) async {
    try {
      getTotalRevenueLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");

      ///url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.totalRevenue,
      );

      ///headers
      final Map<String, String> headers = ApiSupport.headers(
        origin: true,
        token: token,
      );

      /// response
      final Response response = await post(
        url,
        headers: headers,
      );
      log(url.toString());

      if (response.statusCode == 200) {
        log("RESPONSE  ${response.body}");
        totalRevenueModel = totalRevenueFromJson(response.body);
        getTotalRevenueLoading = false;

        notifyListeners();
      } else {
        getTotalRevenueLoading = false;
        notifyListeners();
        log('not fetching api');
        log(response.body);
      }
    } catch (e) {
      getTotalRevenueLoading = false;
      log('error$e');
    }
  }

  // Future<PaymentForGraph> getGraphData() async {
  //   return await provider.getGraphPaymentDetails();
  // }
  // _onBackButtonDoubleClicked(BuildContext context) async {
  //   final difference = DateTime.now().difference(backPressedTime);
  //   backPressedTime = DateTime.now();
  //   if (difference >= const Duration(seconds: 2)) {
  //     toast(context, "Click again to close app");
  //     return false;
  //   } else {
  //     SystemNavigator.pop(animated: true);
  //     return true;
  //   }
  // }
  //
  // void toast(BuildContext context, String text) {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(
  //       text,
  //       textAlign: TextAlign.center,
  //     ),
  //     behavior: SnackBarBehavior.floating,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  //   ));
  // }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
