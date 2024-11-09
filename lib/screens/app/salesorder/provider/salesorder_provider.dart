// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:core';
import 'dart:developer';

import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:metlonev2_app/screens/app/customers/provider/customer_provider.dart';
import 'package:metlonev2_app/screens/app/salesorder/model/branch_setting_info_model.dart';
import 'package:metlonev2_app/screens/app/salesorder/model/create_invoice_success_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/api_support.dart';
import '../../customers/model/send_invoice_whatsapp_model.dart';
import '../model/branch_info_header_model.dart';
import '../model/create_invoice.model.dart';
import '../model/create_new_order_model.dart';
import '../model/estimate_or_invoice_model.dart';
import '../model/get_all_customer_name_model.dart' as cust;
import '../model/sales_order_for_edit_model.dart';
import '../model/salesorder_model.dart';
import '../model/service_detail_model.dart';
import '../model/service_list_model.dart';
import '../model/whatsapp_model.dart';

class SalesOrderProvider extends ChangeNotifier {
  int currentSkipCount = 0;
  int currentMaxResult = 10;
  //new changes
  updateMaxCountAndSkipCount(
    int index,
  ) {
    currentSkipCount = index * 10 - 10;
    currentMaxResult = index * 10;
    notifyListeners();
  }

  bool salesOrderLoading = false;
  // bool getSalesOrderLoading = false;
  // bool getSalesOrderDetailsLoading = false;
  // bool getCreateInvoiceDetailsLoading = false;
  // bool getBranchSettingsInfoDetailsLoading = false;
  // bool getCompanyBranchDetailsLoading = false;
  // bool getAllCustomerNameDetailsLoading = false;
  // bool getAllServiceDetailsLoading = false;
  // bool getWhatsappMessageLoading = false;
  // bool isContainerVisible = false;
  // bool getUpadateStatusLoading = false;
  // bool getIfCustomerExitsLoading = false;
  // bool getCreateOrEstimateLoading = false;

  CreateInvoiceSuccessModel? invoiceDetails;
  Salesorder? salesOrder;
  CreateInvoice? createInvoice;
  CreateOrder? newOrder;
  CompanyBranch? comapnyBranchHeader;
  BranchSettingInfoModel? branchSettingInfoModel;
  cust.ComapanyName? getCustomer;
  cust.Result? selectedCustomer;
  ServiceDetails? getService;
  WhtasappMsg? whatsapp;
  num multipliedSum = 0;
  double balanceAmountFromApi = 0.0;
  double constantBalanceAmountFromApi = 0.0;

  updateBalanceAmountFromApi(double newValue) {
    log("Entered inside provider function $newValue");
    balanceAmountFromApi = constantBalanceAmountFromApi - newValue;
    notifyListeners();
    log(" after complting $balanceAmountFromApi");
  }

  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();

  void returnMultiply() {
    multipliedSum = 0;
    for (int i = 0; i < quantityControllers.length; i++) {
      log("Inside the for loop");
      if (rateControllers[i].text.isNotEmpty &&
          quantityControllers[i].text.isNotEmpty) {
        log("If condition success${rateControllers[i].text} qty ${quantityControllers[i].text}");

        double quantity = double.parse(quantityControllers[i].text);
        double rate = double.parse(rateControllers[i].text);
        double result = quantity * rate;
        multipliedSum += result;

        grossControllers[i].text = result.toString();
      }
    }
    notifyListeners();
  }

  double balanceAmount({required advanceAmount, required receivedAmount}) {
    return advanceAmount - receivedAmount;
  }

  /// forms list
  List<TextEditingController> quantityControllers = [];
  List<TextEditingController> rateControllers = [];
  List<TextEditingController> grossControllers = [];
  List<TextEditingController> unitController = [];

  List<FocusNode> quantityFocusNodes = [];
  List<FocusNode> rateFocusNodes = [];
  List<FocusNode> grossFocusNodes = [];

  List<String> serviceNameList = [];
  List<int> serviceIdList = [];

  form2addFields() {
    quantityControllers.add(TextEditingController());
    rateControllers.add(TextEditingController());
    grossControllers.add(TextEditingController());
    quantityFocusNodes.add(FocusNode());
    rateFocusNodes.add(FocusNode());
    grossFocusNodes.add(FocusNode());
    notifyListeners();
  }

  void deleteFields() {
    if (quantityControllers.isNotEmpty) {
      quantityControllers.removeLast();
      rateControllers.removeLast();
      grossControllers.removeLast();
      quantityFocusNodes.removeLast();
      rateFocusNodes.removeLast();
      grossFocusNodes.removeLast();
      selectedService.removeLast();
      notifyListeners();
    }
  }

  void setInvoiceServicesData() {
    if (editInvoices != null &&
        editInvoices?.result != null &&
        editInvoices?.result?.salesInvoice != null &&
        editInvoices?.result?.salesInvoice?.salesInvoiceDetailsListDto !=
            null) {
      for (int i = 0;
          i <
              editInvoices!
                  .result!.salesInvoice!.salesInvoiceDetailsListDto!.length;
          i++) {
        final item =
            editInvoices!.result!.salesInvoice!.salesInvoiceDetailsListDto![i];
        quantityControllers.add(
          TextEditingController(
            text: item.qty?.toString() ?? '',
          ),
        );
        rateControllers.add(
          TextEditingController(
            text: item.rate?.toString() ?? '',
          ),
        );
        grossControllers.add(
          TextEditingController(
            text: item.gross?.toString() ?? '',
          ),
        );
        multipliedSum = (item.qty ?? 0) * (item.rate ?? 0);
        quantityFocusNodes.add(FocusNode());
        rateFocusNodes.add(FocusNode());
        grossFocusNodes.add(FocusNode());

        setServiceDetailsForm(item.productProfileId.toString(), i);
      }
    }
  }

  setServiceDetailsForm(
    String newValue,
    int index,
  ) {
    log('NewValue $newValue, index $index');
    serviceNameList.insert(
      index,
      newValue,
    );

    notifyListeners();
  }

  List<EstimateModel> orderInvoiceDto = [];

  setOrderInvoiceDto(EstimateModel newValue) {
    orderInvoiceDto.add(newValue);
    notifyListeners();
  }

  ///Create or Estimate invoice
  set setSelectedCustomer(cust.Result selectedOne) {
    selectedCustomer = selectedOne;
    notifyListeners();
  }

  // ServiceDetailsModel selectService = ServiceDetailsModel(
  //   productName: '',
  //   productProfileId: 0,
  // );

  List<ServiceDetailsModel> get serviceDetails => selectedService;
  List<ServiceDetailsModel> selectedService = [];
  void selectServices(ServiceDetailsModel service, index) {
    selectedService.insert(
      index,
      service,
    );
    notifyListeners();
  }

  //
  // bool salesOrderLoading = false;

  Future<void> createOrEstimateInvoice({
    required BuildContext context,
    required totalAmount,
    required invoiceDate,
    required customerId,
    required balanceAmount,
    required advanceAmount,
    required isDelivered,
  }) async {
    try {
      salesOrderLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.createOrEstimateInvoice,
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      ///body
      final body = {
        ''
            "invoiceDate": invoiceDate,
        "totalAmount": totalAmount,
        "customerId": selectedCustomer?.id ?? '',
        "salesInvoiceDetailsListDto": List.generate(
            orderInvoiceDto.length,
            (index) => {
                  'qty': orderInvoiceDto[index].qty,
                  'rate': orderInvoiceDto[index].rate,
                  'gross': orderInvoiceDto[index].gross,
                  'productName': selectedService.length > index
                      ? selectedService[index].productName
                      : '',
                  'taxPercentage': 0,
                  'isSittingService': false,
                  'productProfileId': selectedService.length > index
                      ? selectedService[index].productProfileId
                      : -1,
                  'unitId': 534,
                }),

        // json.encode(orderInvoiceDto),
        "paymentType": 1,
        "isDefault": false,
        "isManual": false,
        "isEstimate": false,
        "advanceAmount": advanceAmount,
        'remarks': remarksController.text,
        "isFullyPaid": isDelivered,
        "isStudioApp": false,
        "balanceAmount": balanceAmount,
        "payments": [],
        "sittingServiceDetails": referenceController.text,
      };

      log('create saleorder request body${body.toString()}');

      /// response
      final Response response =
          await post(url, body: json.encode(body), headers: headers);
      log(url.toString());

      if (response.statusCode == 200) {
        clearState();
        CreateInvoiceSuccessModel createInvoiceSuccessModel =
            createInvoiceSuccessModelFromJson(response.body);
        log("Post Workingman  ${response.body}");
        if (isDelivered) {
          await getSendInvoiceWhatsapp(
            context: context,
            salesInvoiceId: createInvoiceSuccessModel.result.invoiceNo,
          );
        }
        await getWhatsappMessage(
            context: context,
            whatsappDetails: createInvoiceSuccessModel.result.whatsAppDetails);
        // if (createInvoiceSuccessModel.result.balanceAmount == 0) {
        //   await getWhatsappMessage(
        //           context: context,
        //           whatsappDetails:
        //               createInvoiceSuccessModel.result.whatsAppDetails);
        //       .then(
        //     (value) => getSalesOrderDetails(
        //         context: context,
        //         searchKeyword: '',
        //         skipCount: '0',
        //         statusId: 3,
        //         maxInvoiceDate: '',
        //         minInvoiceDate: ''),
        //   );
        // }
        await getSalesOrderDetails(
            context: context,
            searchKeyword: '',
            skipCount: '0',
            statusId: 3,
            maxInvoiceDate: '',
            minInvoiceDate: '');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invoice created successfully!'),
            duration: Duration(seconds: 2),
          ),
        );
        setSelectedCustomer = cust.Result(
          name: '',
        );
        Navigator.pop(context);

        salesOrderLoading = false;
        notifyListeners();
      } else {
        salesOrderLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      salesOrderLoading = false;

      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  ///InvoiceEdit
  //
  // bool salesOrderLoading = false;

  CreateInvoiceSuccessModel? invoiceEdit;
  Future<void> getInvoiceEdit({
    required BuildContext context,
    required bool isDelivered,
  }) async {
    try {
      salesOrderLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.editInvoices,
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      ///body
      final body = {
        "storeId": editInvoices?.result?.salesInvoice?.storeId,
        "salesNo": editInvoices?.result?.salesInvoice?.salesNo,
        "invoiceDate": editInvoices?.result?.salesInvoice?.invoiceDate != null
            ? DateFormat('yyyy-MM-dd').format(DateTime.tryParse(
                    editInvoices?.result?.salesInvoice?.invoiceDate ?? '') ??
                DateTime.now())
            : '',
        "salesDate": editInvoices?.result?.salesInvoice?.salesDate.toString(),
        "totalAmount": editInvoices?.result?.salesInvoice?.totalAmount,
        "totalDiscount": editInvoices?.result?.salesInvoice?.totalDiscount,
        "specialDiscount": editInvoices?.result?.salesInvoice?.specialDiscount,
        "totalAmountGst": editInvoices?.result?.salesInvoice?.totalAmountGst,
        "freightCharge": editInvoices?.result?.salesInvoice?.freightCharge,
        "otherCharge": editInvoices?.result?.salesInvoice?.otherCharge,
        "roundOff": editInvoices?.result?.salesInvoice?.roundOff,
        "netAmount": editInvoices?.result?.salesInvoice?.netAmount,
        "status": editInvoices?.result?.salesInvoice?.status,
        "invoicefromTally":
            editInvoices?.result?.salesInvoice?.invoicefromTally,
        "customerId": editInvoices?.result?.salesInvoice?.customerId,
        "salesInvoiceDetailsListDto":
            editInvoices?.result?.salesInvoice?.salesInvoiceDetailsListDto
                ?.map((e) => {
                      "rate": e.rate,
                      "batchNo": e.batchNo,
                      "stockId": e.stockId,
                      "qty": e.qty,
                      "totalAmountGst": e.totalAmountGst,
                      "discount": e.discount,
                      "gross": e.gross,
                      "net": e.net,
                      "totalProductTax": e.totalProductTax,
                      "salesInvoiceId": e.salesInvoiceId,
                      "productProfileId": e.productProfileId,
                      "productVarientLinksId": e.productVarientLinksId,
                      "quoteDetailId": e.quoteDetailId,
                      "productName": e.productName,
                      "unitId": e.unitId,
                      "unitName": e.unitName,
                      "branchId": e.branchId,
                      "tenantId": e.tenantId,
                      "companyId": e.companyId,
                      "netWithoutTax": e.netWithoutTax,
                      "remarks": e.remarks,
                      "remarksId": e.remarksId,
                      "remarksName": e.remarksName,
                      "totalSGST": e.totalSgst,
                      "totalCGST": e.totalCgst,
                      "taxPercentage": e.taxPercentage,
                      "gstPercentage": e.gstPercentage,
                      "hsnCode": e.hsnCode,
                      "discountPercentage": e.discountPercentage,
                      "cess": e.cess,
                      "taxableAmount": e.taxableAmount,
                      "totalTaxWithCessDetail": e.totalTaxWithCentralCessDetail,
                      "centralCess": e.centralCess,
                      "totalTaxWithCentralCessDetail":
                          e.totalTaxWithCentralCessDetail,
                      "variationTypeName": e.variationTypeName,
                      "igst": e.igst,
                      "salesQuantityHistoryId": e.salesQuantityHistoryId,
                      "baseUnitId": e.baseUnitId,
                      "baseQty": e.baseQty,
                      "variationTypeId": e.variationTypeId,
                      "variantName": e.variantName,
                      "deliveryId": e.deliveryId,
                      "quoteId": e.quoteId,
                      "qrCodeId": e.qrCodeId,
                      "upiCode": e.upiCode,
                      "qrCode": e.qrCode,
                      "maxrate": e.maxrate,
                      "uniqueID": e.uniqueId,
                      "auditUniqueId": e.auditUniqueId,
                      "isDiscountPercentage": e.isDiscountPercentage,
                      "purchaseRate": e.purchaseRate,
                      "cessMasterPercentage": e.cessMasterPercentage,
                      "cessMasterAmount": e.cessMasterAmount,
                      "isSalesTaxIncluded": e.isSalesTaxIncluded,
                      "salesTaxExcludedRate": e.salesTaxExcludedRate,
                      "stateId": e.stateId,
                      "stateName": e.stateName,
                      "itemBranchId": e.itemBranchId,
                      "productProfileName": e.productProfileName,
                      "boxQuntity": e.boxQuntity,
                      "balanceInStock": e.balanceInStock,
                      "taxMasterId": e.taxMasterId,
                      "isSittingService": e.isSittingService,
                      "sittingServiceDetails": e.sittingServiceDetails,
                      "costCenterId": e.costCenterId,
                      "isNegativestock": e.isNegativestock,
                      "id": e.id
                    })
                .toList(),
        "totalQuantity": editInvoices?.result?.salesInvoice?.totalQuantity,
        "saleDiscount": editInvoices?.result?.salesInvoice?.saleDiscount,
        "isPercentageDiscount":
            editInvoices?.result?.salesInvoice?.isPercentageDiscount,
        "customerDiscountPercentage":
            editInvoices?.result?.salesInvoice?.customerDiscountPercentage,
        "totalTaxWithCess":
            editInvoices?.result?.salesInvoice?.totalTaxWithCess,
        "totalCess": editInvoices?.result?.salesInvoice?.totalCess,
        "transportationMode":
            editInvoices?.result?.salesInvoice?.transportationMode,
        "vehicleNo": editInvoices?.result?.salesInvoice?.vehicleNo,
        "placeOfSupply": editInvoices?.result?.salesInvoice?.placeOfSupply,
        "shippingName": editInvoices?.result?.salesInvoice?.shippingName,
        "shippingAddress1":
            editInvoices?.result?.salesInvoice?.shippingAddress1,
        "shippingAddress2":
            editInvoices?.result?.salesInvoice?.shippingAddress2,
        "shippingGSTINNo": editInvoices?.result?.salesInvoice?.shippingGstinNo,
        "shippingState": editInvoices?.result?.salesInvoice?.shippingState,
        "totalCentralCess":
            editInvoices?.result?.salesInvoice?.totalCentralCess,
        "totalTaxWithCentralCess":
            editInvoices?.result?.salesInvoice?.totalTaxWithCentralCess,
        "invoiceNo": editInvoices?.result?.salesInvoice?.invoiceNo,
        "paymentType": editInvoices?.result?.salesInvoice?.paymentType,
        "isDefault": editInvoices?.result?.salesInvoice?.isDefault,
        "financialYearMasterId":
            editInvoices?.result?.salesInvoice?.financialYearMasterId,
        "isIGST": editInvoices?.result?.salesInvoice?.isIgst,
        "salesOrderId": editInvoices?.result?.salesInvoice?.salesOrderId,
        "deliveryIds": editInvoices?.result?.salesInvoice?.deliveryIds,
        "isSelected": editInvoices?.result?.salesInvoice?.isSelected,
        "branchId": editInvoices?.result?.salesInvoice?.branchId,
        "companyId": editInvoices?.result?.salesInvoice?.companyId,
        "isApp": editInvoices?.result?.salesInvoice?.isApp,
        "isManual": editInvoices?.result?.salesInvoice?.isManual,
        "outCount": editInvoices?.result?.salesInvoice?.outCount,
        "inCount": editInvoices?.result?.salesInvoice?.inCount,
        "totalCessMasterAmount":
            editInvoices?.result?.salesInvoice?.totalCessMasterAmount,
        "totalNet": editInvoices?.result?.salesInvoice?.totalNet,
        "totalTaxable": editInvoices?.result?.salesInvoice?.totalTaxable,
        "ewayBillNo": editInvoices?.result?.salesInvoice?.ewayBillNo,
        "stateName": editInvoices?.result?.salesInvoice?.stateName,
        "stateId": editInvoices?.result?.salesInvoice?.stateId,
        "tempTokenNumber": editInvoices?.result?.salesInvoice?.tempTokenNumber,
        "isMultipleSelected":
            editInvoices?.result?.salesInvoice?.isMultipleSelected,
        "totalQty": editInvoices?.result?.salesInvoice?.totalQty,
        "isEstimate": editInvoices?.result?.salesInvoice?.isEstimate,
        "remarks": editInvoices?.result?.salesInvoice?.remarks,
        "advanceAmount": editInvoices?.result?.salesInvoice?.advanceAmount,
        "isFullyPaid": isDelivered,
        "deliveryStatus": editInvoices?.result?.salesInvoice?.deliveryStatus,
        "isStudioApp": editInvoices?.result?.salesInvoice?.isStudioApp,
        "balanceAmount": editInvoices?.result?.salesInvoice?.balanceAmount,
        "payments": editInvoices?.result?.salesInvoice?.payments != null
            ? editInvoices?.result?.salesInvoice?.payments
                ?.map(
                  (e) => {
                    "paymentId": e.paymentId,
                    "paymentType": e.paymentType,
                    "paymentAmount": e.paymentAmount
                  },
                )
                .toList()
            : [],
        "recievedDate": editInvoices?.result?.salesInvoice?.recievedDate,
        "sittingServiceDetails":
            editInvoices?.result?.salesInvoice?.sittingServiceDetails,
        "paymentModeType": editInvoices?.result?.salesInvoice?.paymentModeType,
        "chequeNo": editInvoices?.result?.salesInvoice?.chequeNo,
        "chequeDate": null,
        "ddNo": editInvoices?.result?.salesInvoice?.ddNo,
        "ddDate": null,
        "referanceNo": editInvoices?.result?.salesInvoice?.referanceNo,
        "transactionID": editInvoices?.result?.salesInvoice?.transactionId,
        "transactionDate": editInvoices?.result?.salesInvoice?.transactionId,
        "bankAccountHeadId":
            editInvoices?.result?.salesInvoice?.bankAccountHeadId,
        "executiveId": editInvoices?.result?.salesInvoice?.executiveId,
        "id": editInvoices?.result?.salesInvoice?.id
      };
      log("Edit Body: ${json.encode(body)}");

      /// response
      final Response response =
          await post(url, body: json.encode(body), headers: headers);
      log(url.toString());

      if (response.statusCode == 200) {
        CreateInvoiceSuccessModel createInvoiceSuccessModel =
            createInvoiceSuccessModelFromJson(response.body);
        if (isDelivered) {
          await getSendInvoiceWhatsapp(
            context: context,
            salesInvoiceId: editInvoices?.result?.salesInvoice?.id,
          );
        }

        await getWhatsappMessage(
            context: context,
            whatsappDetails: createInvoiceSuccessModel.result.whatsAppDetails);
        clearState();
        log('EDIT API ${response.body}');
        await getSalesOrderDetails(
                context: context,
                searchKeyword: '',
                skipCount: '0',
                statusId: 3,
                maxInvoiceDate: '',
                minInvoiceDate: '')
            .then((value) =>
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Invoice Updated successfully!'),
                  duration: Duration(seconds: 2),
                )));
        Navigator.pop(context);
        // invoiceEdit = createInvoiceSuccessModelFromJson(response.body);

        salesOrderLoading = false;
        notifyListeners();
      } else if (response.statusCode == 400) {
        String message = json.decode(response.body)['error']['message'];
        FloatingSnackBar(
          message: message,
          context: context,
        );
        salesOrderLoading = false;
        notifyListeners();
      } else {
        salesOrderLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      salesOrderLoading = false;

      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getSalesOrderDetails({
    required BuildContext context,
    required searchKeyword,
    required String skipCount,
    required statusId,
    required String maxInvoiceDate,
    required String minInvoiceDate,
  }) async {
    try {
      salesOrderLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");
      // log("date  $maxInvoiceDate");
      // String loanId = preferences.getString('referenceId') ?? '0';

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl +
            ApiSupport.getAllSalesOrder(
              statusId: statusId,
              searchKeyWord: searchKeyword,
              skipCount: skipCount,
              minInvoiceDate: minInvoiceDate,
              maxInvoiceDate: maxInvoiceDate,
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
        log("SSsssssales   ${response.body}");
        salesOrder = salesorderFromJson(response.body);
        print("........athul....${salesOrder}");

        salesOrderLoading = false;
        notifyListeners();
      } else {
        salesOrderLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      salesOrderLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getBranchSettingsInfoDetails({
    required BuildContext context,
  }) async {
    try {
      salesOrderLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");
      // String loanId = preferences.getString('referenceId') ?? '0';

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.branchSettingsInfo,
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      /// response
      final Response response = await post(url, headers: headers);
      log(url.toString());

      // final Response response = await get(url, headers: headers);
      // log(url.toString());
      branchSettingInfoModel = null;
      notifyListeners();
      if (response.statusCode == 200) {
        log("NEW ORDER  ${response.body}");
        branchSettingInfoModel = branchSettingInfoModelFromJson(
          response.body,
        );
        await getCompanyBranchDetails(
            context: context,
            branchId:
                branchSettingInfoModel?.result?.branchId.toString() ?? '');
        print("NEW ORDER......${comapnyBranchHeader}");
        salesOrderLoading = false;
        notifyListeners();
      } else {
        salesOrderLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      salesOrderLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getCompanyBranchDetails(
      {required BuildContext context, required String branchId}) async {
    try {
      salesOrderLoading = true;
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
            ApiSupport.getBranchHeaderDetails(
              id: branchId,
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
        comapnyBranchHeader = companyBranchFromJson(response.body);
        print("............${salesOrder}");
        salesOrderLoading = false;
        notifyListeners();
      } else {
        salesOrderLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      salesOrderLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getAllCustomerNameDetails({
    required BuildContext context,
  }) async {
    try {
      salesOrderLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKENNNNNNNNNNNNNNNNNN $token");
      // String loanId = preferences.getString('referenceId') ?? '0';

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.getAllCustomers,
      );
      log(url.toString());

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      /// response
      final Response response = await get(url, headers: headers);
      getCustomer = null;
      notifyListeners();
      if (response.statusCode == 200) {
        log(" CUSTOMER DETAILS NAMEEE ${response.body}");
        getCustomer = cust.comapanyNameFromJson(response.body);
        salesOrderLoading = false;
        log('Logging lengthhhh      ${getCustomer?.result?.length}');
        notifyListeners();
      } else {
        salesOrderLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      log('errrrrrrrrrrrrrooooooooooooooooorrrrrrrrrrrr :$e');
      salesOrderLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getAllServiceDetails({
    required BuildContext context,
  }) async {
    try {
      salesOrderLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");
      // String loanId = preferences.getString('referenceId') ?? '0';

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.getAllServices,
      );
      log(url.toString());

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      /// response
      final Response response = await get(url, headers: headers);
      getService = null;
      notifyListeners();
      if (response.statusCode == 200) {
        log(" SERVICEEEE DETAILS ${response.body}");
        getService = serviceDetailsFromJson(response.body);
        print('${getService!.result!.length} Service list lenth');
        setInvoiceServicesData();

        salesOrderLoading = false;
        notifyListeners();
      } else {
        salesOrderLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      salesOrderLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getWhatsappMessage({
    required BuildContext context,
    required WhatsAppDetails? whatsappDetails,
  }) async {
    try {
      salesOrderLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");
      // String loanId = preferences.getString('referenceId') ?? '0';

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.whatsappMsg,
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      /// body
      final body = {
        "toNumber": whatsappDetails?.toNumber,
        "type": whatsappDetails?.type,
        "message": whatsappDetails?.message,
        "mediaURl": whatsappDetails?.mediaURl,
        "fileName": whatsappDetails?.fileName,
        "instanceId": whatsappDetails?.instanceId,
        "accessToken": whatsappDetails?.accessToken,
      };
      log("Request Body: ${json.encode(body)}");

      /// response
      final Response response =
          await post(url, body: json.encode(body), headers: headers);
      log(url.toString());

      // final Response response = await get(url, headers: headers);
      // log(url.toString());
      whatsapp = null;
      notifyListeners();
      if (response.statusCode == 200) {
        log("w  ${response.body}");

        // log( " requestttttt ${request.body}");
        FloatingSnackBar(
          message: 'Send Successfully',
          context: context,
          textColor: Colors.black,
          textStyle: const TextStyle(color: Colors.blue),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: Colors.white,
        );

        whatsapp = whtasappMsgFromJson(
          response.body,
        );

        salesOrderLoading = false;
        notifyListeners();
      } else {
        salesOrderLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error  ${response.statusCode}");
      }
    } catch (e) {
      salesOrderLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getUpdateStatus(
      {required BuildContext context,
      required String invoiceId,
      required String statusId}) async {
    try {
      salesOrderLoading = true;
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
            ApiSupport.updateStatus(
              invoiceId: invoiceId,
              statusId: statusId,
            ),
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      /// response
      final Response response = await put(url, headers: headers);
      log(url.toString());

      // final Response response = await get(url, headers: headers);
      // log(url.toString());
      notifyListeners();
      if (response.statusCode == 200) {
        log("Update Status  ${response.body}");
        FloatingSnackBar(
          message: 'Status Updated Successfully',
          context: context,
        );
        print('updated Successfully');
        // updateStatus = updateStatusFromJson(
        //   response.body,
        // );

        salesOrderLoading = false;
        notifyListeners();
      } else {
        salesOrderLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      salesOrderLoading = false;
      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  late String subTotal;
  Future<void> getIfCustomerExits({
    required BuildContext context,
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
      salesOrderLoading = true;
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
            ApiSupport.customerExits(phoneNumber: customerMobile),
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      ///body

      /// response
      final Response response = await post(url, headers: headers);
      log(url.toString());

      if (response.statusCode == 200) {
        log("RESPONSE  ${response.body}");

        bool isUserExist = json.decode(response.body)['result'];
        if (isUserExist) {
          FloatingSnackBar(
            message: 'User Already exists',
            context: context,
            textColor: Colors.black,
            textStyle: const TextStyle(color: Colors.blue),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: Colors.white,
          );
          // setSelectedCustomer = getCustomer!.result!.firstWhere(
          //   (element) => element.mobile == phoneController.text,
          // );
          // customerNameController.text = selectedCustomer?.name.toString() ?? '';
          // emailController.text = selectedCustomer?.email.toString() ?? '';
          // gstController.text = selectedCustomer?.gsttin.toString() ?? '';
        } else {
          final CustomerProvider customerProvider =
              Provider.of<CustomerProvider>(
            context,
            listen: false,
          );
          await customerProvider
              .getEditCustomer(
                context: context,
                customerEmail: customerEmail,
                customerMobile: customerMobile,
                customerName: customerName,
                customerPhone: customerPhone,
                gst: gst,
                isEstimate: isEstimate,
                isNonTax: isNonTax,
                mobileCode: mobileCode,
                phoneCode: phoneCode,
                isCreate: true,
              )
              .then((value) => Navigator.pop(context));
        }
        salesOrderLoading = false;
        notifyListeners();
      } else {
        salesOrderLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      salesOrderLoading = false;

      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getCreateOrEstimate({
    required BuildContext context,
  }) async {
    try {
      salesOrderLoading = true;
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
            ApiSupport.customerExits(phoneNumber: phoneController.text),
      );

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      ///body

      /// response
      final Response response = await post(url, headers: headers);
      log(url.toString());

      if (response.statusCode == 200) {
        log("RESPONSE  ${response.body}");
        FloatingSnackBar(
          message: 'Customer Created Successfully',
          context: context,
          textColor: Colors.black,
          textStyle: const TextStyle(color: Colors.blue),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: Colors.white,
        );
        bool isUserExist = json.decode(response.body)['result'];
        if (isUserExist) {
          setSelectedCustomer = getCustomer!.result!.firstWhere(
            (element) => element.mobile == phoneController.text,
          );

          customerNameController.text = selectedCustomer?.name.toString() ?? '';
          emailController.text = selectedCustomer?.email.toString() ?? '';
          gstController.text = selectedCustomer?.gsttin.toString() ?? '';
        } else {}
        salesOrderLoading = false;
        notifyListeners();
      } else {
        salesOrderLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      salesOrderLoading = false;

      notifyListeners();
      rethrow;
    }
    notifyListeners();
  }

  updateBalanceAmount() {
    double sum = 0.0;
    balanceAmountFromApi = 0.0;
    notifyListeners();
    if (editInvoices!.result!.salesInvoice!.payments != null) {
      for (int i = 0;
          i < editInvoices!.result!.salesInvoice!.payments!.length;
          i++) {
        sum = editInvoices!.result!.salesInvoice!.payments![i].paymentAmount! +
            sum;
        notifyListeners();
      }
      balanceAmountFromApi =
          editInvoices!.result!.salesInvoice!.totalAmount! - sum;
      notifyListeners();
    }
  }

  ///SalesOrderForEdit
  // bool getSalesOrderForEditLoading = false;
  EditInvoices? editInvoices;
  updatePaymentList(Payment newPayment) {
    editInvoices?.result?.salesInvoice?.payments?.add(newPayment);
    notifyListeners();
  }

  Future<void> getSalesOrderForEdit(
      {required BuildContext context, required id}) async {
    try {
      salesOrderLoading = true;
      notifyListeners();

      /// token
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? token = preferences.getString("token");
      log("TOKEN $token");

      /// url
      final Uri url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.salesOrderForEdit(id: id),
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
        editInvoices = editInvoicesFromJson(response.body);
        notifyListeners();
        log("Customer id${editInvoices?.result?.customerId?.toInt()}");
        setSelectedCustomer = cust.Result(
          id: editInvoices?.result?.customerId?.toInt(),
          name: editInvoices?.result?.customerName,
          mobile: editInvoices?.result?.customerPhone,
        );
        customerNameController.text = editInvoices?.result?.customerName ?? "";
        emailController.text = editInvoices?.result?.customerEmail ?? "";
        gstController.text = editInvoices?.result?.customerGstin ?? "";
        phoneController.text = editInvoices?.result?.customerPhone ?? "";
        remarksController.text =
            editInvoices?.result?.salesInvoice?.remarks ?? "";
        referenceController.text =
            editInvoices?.result?.salesInvoice?.sittingServiceDetails ?? "";
        // subTotal = editInvoices?.result?.salesInvoice?.totalAmount as String;
        if (editInvoices != null) {
          if (editInvoices!.result != null) {
            if (editInvoices!.result!.salesInvoice != null) {
              if (editInvoices!
                      .result!.salesInvoice!.salesInvoiceDetailsListDto !=
                  null) {
                for (int i = 0;
                    i <
                        editInvoices!.result!.salesInvoice!
                            .salesInvoiceDetailsListDto!.length;
                    i++) {
                  selectServices(
                      ServiceDetailsModel(
                        productProfileId: editInvoices!.result!.salesInvoice!
                            .salesInvoiceDetailsListDto![i].productProfileId!
                            .toInt(),
                        productName: editInvoices!.result!.salesInvoice!
                            .salesInvoiceDetailsListDto![i].productName
                            .toString(),
                      ),
                      i);
                }
              }
              double sum = 0;
              if (editInvoices!.result!.salesInvoice!.payments != null) {
                if (editInvoices!.result!.salesInvoice!.payments!.length == 0) {
                  log('Payment list is empty');
                  balanceAmountFromApi = editInvoices!
                      .result!.salesInvoice!.balanceAmount!
                      .toDouble();
                  constantBalanceAmountFromApi = editInvoices!
                      .result!.salesInvoice!.balanceAmount!
                      .toDouble();
                  notifyListeners();
                } else {
                  for (int i = 0;
                      i < editInvoices!.result!.salesInvoice!.payments!.length;
                      i++) {
                    sum = editInvoices!
                            .result!.salesInvoice!.payments![i].paymentAmount! +
                        sum;
                    notifyListeners();
                  }
                  balanceAmountFromApi =
                      editInvoices!.result!.salesInvoice!.totalAmount! -
                          editInvoices!.result!.salesInvoice!.advanceAmount! -
                          sum;
                  constantBalanceAmountFromApi =
                      editInvoices!.result!.salesInvoice!.totalAmount! -
                          editInvoices!.result!.salesInvoice!.advanceAmount! -
                          sum;
                  notifyListeners();
                }
              }
            }
          }
        }

        notifyListeners();
        log('working');
        salesOrderLoading = false;
        notifyListeners();
      } else {
        salesOrderLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      salesOrderLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  SendInvoiceWhatsapp? invoice;
  Future<void> getSendInvoiceWhatsapp(
      {required BuildContext context, required salesInvoiceId}) async {
    try {
      salesOrderLoading = true;
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
      log("SalesInvoiceId ======$salesInvoiceId");

      /// headers
      final Map<String, String> headers =
          ApiSupport.headers(token: token, origin: true);

      /// response
      final Response response = await post(url, headers: headers);
      log(url.toString());

      if (response.statusCode == 200) {
        log("RESPONSE OF WHATSAPP API  ${response.body}");
        invoice = sendInvoiceWhatsappFromJson(response.body);
        log('working');
        salesOrderLoading = false;

        notifyListeners();
      } else {
        salesOrderLoading = false;
        notifyListeners();
        log(response.body);
        log("Server Error / $url / ${response.statusCode}");
      }
    } catch (e) {
      salesOrderLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  clearState() {
    log('clear');
    mobileController.clear();
    phoneController.clear();
    customerNameController.clear();
    emailController.clear();
    gstController.clear();
    remarksController.clear();
    referenceController.clear();
    quantityControllers.clear();
    rateControllers.clear();
    grossControllers.clear();
    serviceNameList.clear();
    multipliedSum = 0;
    selectedService = [];
    orderInvoiceDto = [];
    selectedCustomer = null;
    quantityFocusNodes.clear();
    rateFocusNodes.clear();
    grossFocusNodes.clear();
    notifyListeners();
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
