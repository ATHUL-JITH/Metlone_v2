import 'dart:convert';
import 'dart:developer';

import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:metlonev2_app/screens/app/customers/model/create_new_customer_model.dart';
import 'package:metlonev2_app/screens/app/customers/model/customer_list_details_model.dart';
import 'package:metlonev2_app/screens/app/customers/model/customer_list_model.dart'
    as customer;
import 'package:metlonev2_app/screens/app/customers/model/send_invoice_whatsapp_model.dart';
import 'package:metlonev2_app/screens/app/salesorder/model/get_all_customer_name_model.dart'
    as cust;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/api_support.dart';
import '../../salesorder/provider/salesorder_provider.dart';
import '../model/customer_invoice_model.dart';
import '../model/customer_list_model.dart';
import '../model/invoice_details_model.dart';

class CustomerProvider extends ChangeNotifier {
  final TextEditingController customerController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  int currentSkipCount = 0;
  int currentMaxResult = 10;
  updateMaxCountAndSkipCount(
    int index,
  ) {
    currentSkipCount = index * 10 - 10;
    currentMaxResult = index * 10;
    notifyListeners();
  }

  bool getCustomerListLoading = false;
  bool getCustomerInvoiceDetailsLoading = false;

  CustomerList? customerList;
  EstimateInvoice? customerInvoice;

  Future<void> getCustomerList({
    required BuildContext context,
    required String name,
    required String skipCount,
  }) async {
    try {
      getCustomerListLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl +
            ApiSupport.customersList(name: name, skipCount: skipCount),
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
        customerList = customerListFromJson(response.body);
        getCustomerListLoading = false;
        notifyListeners();
      } else {
        getCustomerListLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      getCustomerListLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  ///customersList Api

  bool getCustomerListDetailsLoading = false;
  CustomersListDetails? customersListDetails;

  Future<void> getCustomerListDetails(
      {required BuildContext context,
      required customerId,
      required invoiceNo}) async {
    try {
      getCustomerListDetailsLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl +
            ApiSupport.customersListDetails(
                customerId: customerId, statusId: 0, invoiceNo: ''),
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
        customersListDetails = customersListDetailsFromJson(response.body);
        getCustomerListDetailsLoading = false;
        notifyListeners();
      } else {
        getCustomerListDetailsLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      getCustomerListDetailsLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  setTextFieldData({
    required customer.Item? data,
  }) {
    customerController.text = data?.name ?? "";
    phoneController.text = data?.phone ?? "";
    mobileController.text = data?.mobile ?? "";
    gstController.text = data?.gsttin ?? "";
    emailController.text = data?.email ?? "";
    notifyListeners();
  }

  ///InvoiceDetails api
  bool getInvoiceDetailsLoading = false;
  GetInvoiceDetails? invoiceDetails;

  Future<void> getInvoiceDetails(
      {required BuildContext context, required id}) async {
    try {
      getInvoiceDetailsLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.invoiceDetails(id: id),
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      /// response
      final Response response = await get(url, headers: headers);
      log(url.toString());
      notifyListeners();
      if (response.statusCode == 200) {
        log("RESPONSE  ${response.body}");
        invoiceDetails = getInvoiceDetailsFromJson(response.body);
        log('working');
        getInvoiceDetailsLoading = false;
        notifyListeners();

        getInvoiceDetailsLoading = false;
      } else {
        getInvoiceDetailsLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      getInvoiceDetailsLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  ///create new customer api
  bool createCustomerLoading = false;
  CreateNewCustomer? newCustomer;
  Future<void> getEditCustomer({
    required BuildContext context,
    customer.Item? data,
    bool isCreate = false,
    String? customerName,
    String? customerEmail,
    String? customerMobile,
    bool? isNonTax,
    String? gst,
    bool? isEstimate,
    String? mobileCode,
    String? phoneCode,
    String? customerPhone,
  }) async {
    try {
      createCustomerLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.createNewCustomer,
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      ///body
      final body = isCreate
          ? {
              "name": customerName,
              "email": customerEmail,
              "mobile": customerMobile,
              "isNonTax": false,
              "gsttin": gst,
              "isEstimate": false,
              "mobileCode": mobileCode,
              "phoneCode": phoneCode,
              "phone": customerPhone,
              "id": 0
            }
          : {
              "id": data?.id,
              "name": customerController.text,
              "email": emailController.text,
              "mobile": mobileController.text,
              "phone": phoneController.text,
              "contactPersonName": data?.contactPersonName,
              "contactPersonPhone": data?.contactPersonPhone,
              "creditLimit": data?.creditLimit,
              "discountPercentage": data?.discountPercentage,
              "isWholeSaleCustomer": data?.isWholeSaleCustomer,
              "isCreateUser": data?.isCreateUser,
              "userId": data?.userId,
              "custCode": data?.custCode,
              "isAuthorized": data?.isAuthorized,
              "place": data?.place,
              "showforAllBranches": data?.showforAllBranches,
              "address1": data?.address1,
              "address2": data?.address2,
              "city": data?.city,
              "gsttin": gstController.text,
              "pincode": data?.pincode,
              "taxRegrNo": data?.taxRegrNo,
              "cstRegNo": data?.cstRegNo,
              "panNo": data?.panNo,
              "state": data?.state,
              "adhar": data?.adhar,
              "openingBalanceAmount": data?.openingBalanceAmount,
              "customerTaxType": data?.customerTaxType,
              "rating": data?.rating,
              "executiveId": data?.executiveId,
              "areaAndPlaceId": data?.areaAndPlaceId,
              "isBranchCustomer": data?.isBranchCustomer,
              "distributorName": data?.distributorName,
              "paymentTerms": data?.paymentTerms,
              "currencyMasterName": data?.currencyMasterName,
              "executiveName": data?.executiveName,
              "areaAndPlaceName": data?.areaAndPlaceName,
              "isSalesCustomer": data?.isSalesCustomer,
              "mobileCode": data?.mobileCode,
              "phoneCode": data?.phoneCode,
            };

      /// response
      final Response response =
          await post(url, body: json.encode(body), headers: headers);
      log(url.toString());

      if (response.statusCode == 200) {
        log("RESPONSE  ${response.body}");
        newCustomer = createNewCustomerFromJson(response.body);
        notifyListeners();
        log('working$newCustomer');
        createCustomerLoading = false;
        if (isCreate) {
          final SalesOrderProvider salesOrderProvider =
              Provider.of<SalesOrderProvider>(
            context,
            listen: false,
          );
          log('${newCustomer?.result.name}Name check');

          salesOrderProvider.setSelectedCustomer = cust.Result(
            name: newCustomer?.result.name,
            id: newCustomer?.result.id,
            email: newCustomer?.result.email,
            gsttin: newCustomer?.result.gsttin,
            phoneCode: newCustomer?.result.phoneCode,
            phone: newCustomer?.result.phone,
            mobile: newCustomer?.result.mobile,
            mobileCode: newCustomer?.result.mobileCode,
          );
          salesOrderProvider.customerNameController.text =
              newCustomer?.result.name ?? "";
          salesOrderProvider.emailController.text =
              newCustomer?.result.email ?? "";
          salesOrderProvider.gstController.text =
              newCustomer?.result.gsttin ?? "";
          FloatingSnackBar(
            message: 'Customer created successfully',
            context: context,
            textColor: Colors.black,
            textStyle: const TextStyle(color: Colors.blue),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: Colors.white,
          );
        }

        notifyListeners();
        // getCustomerList(context: context, displayName: '')
        //     .then((value) => Navigator.pop(context));
      } else {
        createCustomerLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      createCustomerLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  ///sendInvoiceWhatsapp

  bool sendInvoiceLoading = true;
  SendInvoiceWhatsapp? invoiceWhatsapp;
  Future<void> sendInvoice(
      {required BuildContext context, required salesInvoiceId}) async {
    try {
      sendInvoiceLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl +
            ApiSupport.sendInvoiceWhatsapp(salesInvoiceId: salesInvoiceId),
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      /// response
      final Response response = await post(url, headers: headers);
      log(url.toString());

      if (response.statusCode == 200) {
        log("RESPONSE OF WHATSAPP API  ${response.body}");
        invoiceWhatsapp = sendInvoiceWhatsappFromJson(response.body);
        log('working');
        sendInvoiceLoading = false;

        notifyListeners();
      } else {
        sendInvoiceLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      sendInvoiceLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> getCustomerInvoiceDetails({
    required BuildContext context,
    required customerId,
    required searchKeyWord,
    statusId = '1',
  }) async {
    try {
      getCustomerInvoiceDetailsLoading = true;
      getCustomerListDetailsLoading = true;

      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");
      log("sales id  $searchKeyWord");

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl +
            ApiSupport.customerInvoiceEstimate(
              customerId: customerId,
              searchKeyWord: searchKeyWord,
              statusId: statusId,
            ),
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      /// response
      final Response response = await get(url, headers: headers);
      log(url.toString());
      notifyListeners();
      customersListDetails = null;
      notifyListeners();
      if (response.statusCode == 200) {
        log("CUSTOMEERR  ${response.body}");
        customersListDetails = customersListDetailsFromJson(response.body);
        getCustomerListDetailsLoading = false;
        getCustomerInvoiceDetailsLoading = false;
        notifyListeners();
      } else {
        getCustomerInvoiceDetailsLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      getCustomerInvoiceDetailsLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }
}
