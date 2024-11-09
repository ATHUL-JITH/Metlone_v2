import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/api_support.dart';
import '../model/branch_dropdown_model.dart';
import '../model/customer_branch_model.dart';
import '../model/customer_dropdown_model.dart';
import '../model/payment_mode_model.dart';
import '../model/sales_model.dart';

class ReportsProvider extends ChangeNotifier {
  bool getPaymentModeDetailsLoading = false;
  bool getBranchDetailsLoading = false;
  bool getSalesDetailsLoading = false;
  bool getAllCustomerDropDownLoading = false;
  bool getCustomerCompanyBranchDetailsLoading = false;
  String selectedPaymentType = '0';
  set setSelectedPaymentType(String newValue) {
    selectedPaymentType = newValue;
    notifyListeners();
  }

  String selectedSalesOrderType = '0';
  set setSelectedSalesOrderType(String newValue) {
    selectedSalesOrderType = newValue;
    notifyListeners();
  }

  String dealerDropDown = '0';
  set setDealerType(String newValue) {
    dealerDropDown = newValue;
    notifyListeners();
  }

  Paymentmode? paymentMode;
  SalesRegister? sales;
  CustomerDropdowns? customerDropDown;
  Item? customerDropDownId;
  CustomerBranch? customerBranchHeader;

  set setSelectedCustomerFromDropDeo(Item newVal) {
    customerDropDownId = newVal;
    notifyListeners();
  }

  DropDownBrnach? selectedBranchForDropDown;
  BranchForDropDown? branchList;
  set setSelectedBranchFromDropDown(DropDownBrnach newValue) {
    selectedBranchForDropDown = newValue;
    notifyListeners();
  }

  // SalesRegisterSearch? search;

  Future<void> getPaymentModeDetails(
      {required BuildContext context,
      required fromDate,
      required toDate,
      required String paymentType,
      required String branchId}) async {
    try {
      getPaymentModeDetailsLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");
      // String loanId = preferences.getString('referenceId') ?? '0';

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl +
            ApiSupport.getAllReports(
              fromDate: fromDate,
              toDate: toDate,
              paymentType: paymentType,
              branchId: branchId,
            ),
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      /// response
      final Response response = await get(url, headers: headers);
      log(url.toString());
      // userCreate = null;
      notifyListeners();
      if (response.statusCode == 200) {
        // log("Paymenttt  ${response.body}");
        log("PAYMENT  ${response.body}");
        paymentMode = paymentmodeFromJson(response.body);

        getPaymentModeDetailsLoading = false;
        notifyListeners();
      } else {
        getPaymentModeDetailsLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      getPaymentModeDetailsLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getCustomerCompanyBranchDetails(
      {required BuildContext context, required String branchId}) async {
    try {
      getCustomerCompanyBranchDetailsLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");
      // String loanId = preferences.getString('referenceId') ?? '0';

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl +
            ApiSupport.customerBranchInfo(
              branchId: branchId,
            ),
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      /// response
      final Response response = await get(url, headers: headers);
      log(url.toString());
      // userCreate = null;
      notifyListeners();
      if (response.statusCode == 200) {
        log("RESPONSE  ${response.body}");
        getCustomerCompanyBranchDetailsLoading = false;
        notifyListeners();
      } else {
        getCustomerCompanyBranchDetailsLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      getCustomerCompanyBranchDetailsLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getBranchDetails({
    // required BuildContext ,
    required BuildContext context,
  }) async {
    try {
      getBranchDetailsLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");
      // String loanId = preferences.getString('referenceId') ?? '0';

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.branchDetailss,
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      /// response
      final Response response = await get(url, headers: headers);
      log(url.toString());
      notifyListeners();
      if (response.statusCode == 200) {
        log("RESPONSE OF BRANCH DETAILS ${response.body}");
        branchList = branchForDropDownFromJson(response.body);
        if (branchList != null || branchList!.result.isNotEmpty) {
          selectedBranchForDropDown = branchList?.result.first;
          notifyListeners();
        } //
        // branche = branchdetailsFromJson(response.body);
        // setSelectedBranch = branche?.result?.first.branchId.toString() ?? '';
        getBranchDetailsLoading = false;
        notifyListeners();
      } else {
        getBranchDetailsLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      getBranchDetailsLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getSalesDetails(
      {required BuildContext context,
      required branchId,
      required salesOrderType,
      required fromDate,
      required toDate,
      required customerId}) async {
    try {
      getSalesDetailsLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl +
            ApiSupport.salesRegister(
                salesOrderType: salesOrderType,
                branchId: branchId,
                fromDate: fromDate,
                toDate: toDate,
                customerId: customerId),
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      /// response
      final Response response = await get(url, headers: headers);
      log(url.toString());
      // userCreate = null;
      notifyListeners();
      if (response.statusCode == 200) {
        log("Sales${response.body}");
        sales = salesRegisterFromJson(response.body);
        log(response.body);
        // setSelectedDropDown(dropdown?.result?.items?.toString() ?? '', 0);
        // dropdown?.result?.second?.displayName.toString() ?? '';
        getSalesDetailsLoading = false;
        notifyListeners();
      } else {
        getSalesDetailsLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      getSalesDetailsLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getAllCustomerDropDown({
    required BuildContext context,
  }) async {
    try {
      getAllCustomerDropDownLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");
      // String loanId = preferences.getString('referenceId') ?? '0';

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.getAllCustomerDropDown,
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      /// response
      final Response response = await get(url, headers: headers);
      log(url.toString());
      // userCreate = null;
      notifyListeners();
      if (response.statusCode == 200) {
        log("RESPONSE  ${response.body}");
        customerDropDown = customerDropdownsFromJson(response.body);

        getAllCustomerDropDownLoading = false;
        notifyListeners();
      } else {
        getAllCustomerDropDownLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      getAllCustomerDropDownLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  // Future<void> getSearchSalesRegister(
  //     {required BuildContext context,
  //     required fromDateString,
  //     required toDateString,
  //     required customerId,
  //     required branchId,
  //     required salesOrderType}) async {
  //   try {
  //     getSearchSalesRegisterLoading = true;
  //     notifyListeners();
  //
  //     /// token
  //     final SharedPreferences preferences =
  //         await SharedPreferences.getInstance();
  //     final String? token = preferences.getString("token");
  //     log("TOKEN $token");
  //     // String loanId = preferences.getString('referenceId') ?? '0';
  //
  //     /// url
  //     final Uri url = Uri.parse(ApiSupport.baseUrl +
  //         ApiSupport.getSalessRegister(
  //             fromDateString: fromDateString,
  //             toDateString: toDateString,
  //             branchId: branchId,
  //             customerId: customerId,
  //             salesOrderType: salesOrderType));
  //
  //     /// headers
  //     final Map<String, String> headers =
  //         ApiSupport.headers(token: token, origin: true);
  //
  //     /// response
  //     final Response response = await get(url, headers: headers);
  //     log(url.toString());
  //     // userCreate = null;
  //     notifyListeners();
  //     if (response.statusCode == 200) {
  //       log("SSSSSSSSSSSSSSSSSSSSSSSEEEEEEEEEEEEEEEARCH${response.body}");
  //       print(response.body);
  //       search = salesRegisterSearchFromJson(response.body);
  //       // setSelectedDropDown(dropdown?.result?.items?.toString() ?? '', 0);
  //       // dropdown?.result?.second?.displayName.toString() ?? '';
  //       getSearchSalesRegisterLoading = false;
  //       notifyListeners();
  //     } else {
  //       getSearchSalesRegisterLoading = false;
  //       notifyListeners();
  //       log(response.body);
  //       log("000000000000000000000000000000000000");
  //       // log("Server Error / $url / ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     getSearchSalesRegisterLoading = false;
  //     notifyListeners();
  //     rethrow;
  //   }
  //   notifyListeners();
  // }
}
