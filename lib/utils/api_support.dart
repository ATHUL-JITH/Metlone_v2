class ApiSupport {
  ///APP NAME
  static const String appName = "Phototech";

  /// [QA API URLS] --------------------------------------------------------------
  static const String baseUrl = "https://qaapiv2.metlone.com";
  static const String originUrl = "https://qaappv2.metlone.com";

  /// [ENDPOINTS] --------------------------------------------------------------
  static String serviceDetails =
      "/api/services/app/CustomerDashboardService/GetServiceDetails";

  static String authenticate = "/api/TokenAuth/Authenticate";

  static String profilePicture = "/api/services/app/Profile/GetProfilePicture";

  static String totalRevenue =
      "/api/services/app/CustomerDashboardService/TottalRevenue";
  static String salesOrderForEdit({required id}) =>
      '/api/services/app/SalesInvoices/GetSalesOrderForEdit?Id=$id';
  static String loginDetails =
      "https://qaapiv2.metlone.com/api/services/app/Session/GetCurrentLoginInformations";

  static String graphPaymentDetails =
      "/api/services/app/CustomerDashboardService/GetAllPaymentsForGraph";
  static String createOrEstimateInvoice =
      '/api/services/app/SalesInvoices/CreateEstimateOrInvoice';
  static String editInvoices =
      '/api/services/app/SalesInvoices/CreateEstimateOrInvoice';

  static String getUsers = "/api/services/app/User/GetUsers";
  static String getAllSalesOrder({
    required searchKeyWord,
    String salesNoFilter = '',
    required String skipCount,
    String maxInvoiceDate = '',
    String minInvoiceDate = '',
    required statusId,
  }) =>
      '/api/services/app/SalesInvoices/GetAllSalesOrder?Filter=$searchKeyWord&SalesNoFilter=$salesNoFilter&MaxInvoiceDateFilter=$maxInvoiceDate&MinInvoiceDateFilter=$minInvoiceDate&MaxSalesDateFilter=&MinSalesDateFilter=&CustomerNameFilter=&InvoiceNoFilter=&StatusId=$statusId&Sorting=&SkipCount=$skipCount&MaxResultCount=10';

  static String getAll({required String name}) =>
      '/api/services/app/ProductProfiles/GetAll?Filter=$name&NameFilter=&MaxProductTypeFilter=13&MinProductTypeFilter=0&UnitNameFilter=&UnitName2Filter=&UnitName3Filter=&PartNoFilter=&InputBranchId=0&ProductId=0&ItemBranchNameFilter=&Sorting=&SkipCount=0&MaxResultCount=100';
  static String getBranchHeaderDetails({required String id}) =>
      '/api/services/app/Shared/GetCompanyBranchinfoHeader?InputBranchId=$id';
  static String customersList({
    required String name,
    required String skipCount,
  }) =>
      "/api/services/app/Customers/GetAll?Filter=$name&NameFilter=&Sorting=&SkipCount=$skipCount&MaxResultCount=20";
  static String customersListDetails(
          {required customerId, required statusId, required invoiceNo}) =>
      '/api/services/app/SalesInvoices/GetAllEstimateOrInvoiceByCustomer?CustomerId=$customerId&Filter=$invoiceNo&SalesOrderDate=&StatusId=3&Sorting=&SkipCount=0&MaxResultCount=10';
  static String createNewCustomer =
      '/api/services/app/Customers/CreateNewCustomer';

  static String invoiceDetails({required id}) =>
      '/api/services/app/SalesInvoices/GetSalesOrderForEdit?Id=$id';
  static String createOrEdit =
      '/api/services/app/ProductProfiles/CreateOrEditService';
  static String getAllReports(
          {required fromDate,
          required toDate,
          required paymentType,
          required branchId}) =>
      '/api/services/app/SalesReports/GetAllPayments?fromDateString=$fromDate&toDateString=$toDate&branchId=$branchId&paymentTypeId=$paymentType';
  static String delete({required id}) =>
      '/api/services/app/ProductProfiles/Delete?Id=$id';
  static String customerExits({required phoneNumber}) =>
      '/api/services/app/Customers/IsCustomerExists?mobileNumber=$phoneNumber';
  static String edit({required id}) =>
      "/api/services/app/ProductProfiles/GetAll?Filter=&NameFilter=&MaxProductTypeFilter=13&MinProductTypeFilter=0&UnitNameFilter=&UnitName2Filter=&UnitName3Filter=&PartNoFilter=&InputBranchId=0&ProductId=0&ItemBranchNameFilter=&Sorting=&SkipCount=0&MaxResultCount=10";
  static String branchDetailss =
      '/api/services/app/AccountsReportService/GetBranchListBasedOnPermission';
  static String salesRegister({
    required salesOrderType,
    required branchId,
    required fromDate,
    required toDate,
    required customerId,
  }) =>
      '/api/services/app/SalesReports/GetSalesRegister?fromDateString=$fromDate&toDateString=$toDate&branchId=$branchId&customerId=$customerId&saleOrderType=$salesOrderType';
  static String customDropDown =
      '/api/services/app/CommonLookup/GetAllCustomerdropDown';
  static String branchSettingsInfo =
      '/api/services/app/Branchs/BranchSettingsInfo';
  static String getAllCustomers =
      '/api/services/app/Customers/GetAllCustomer?name=&mobile=&IsEstimate=false';
  static String getAllServices =
      '/api/services/app/ProductProfiles/GetAllServicesWithoutPagination';
  static String whatsappMsg = '/api/services/app/Shared/SendWatsAppMessage';
  static String sendInvoiceWhatsapp({required salesInvoiceId}) =>
      '/api/services/app/SalesInvoices/PrintInvoice?salesInvoiceId=$salesInvoiceId&IsWhatsAppEnabled=true';
  static String mySettings =
      '/api/services/app/Profile/GetCurrentUserProfileForEdit';
  static String updateUserProfile =
      '/api/services/app/Profile/UpdateCurrentUserProfile';
  static String changePassword = '/api/services/app/Profile/ChangePassword';
  static String updateStatus({required invoiceId, required statusId}) =>
      '/api/services/app/SalesInvoices/UpdateDeliveryStatus?invoiceId=$invoiceId&statusId=$statusId';
  static String createOrEstimate =
      '/api/services/app/SalesInvoices/CreateEstimateOrInvoice';
  static String customerBranchInfo({required branchId}) =>
      '/api/services/app/Shared/GetCompanyBranchinfoHeader?InputBranchId=$branchId';
  static String customerInvoiceEstimate(
          {required customerId, required searchKeyWord, statusId = '1'}) =>
      '/api/services/app/SalesInvoices/GetAllEstimateOrInvoiceByCustomer?CustomerId=$customerId&Filter=$searchKeyWord&SalesOrderDate=&StatusId=$statusId&Sorting=&SkipCount=0&MaxResultCount=10';
  static String sendMail({required String email, required String subject}) {
    return "/api/services/app/ECEmailService/POSEmailJSonData?email=$email&Subject=$subject";
  }

  static String isNumberExist({required String mobile}) =>
      '/api/services/app/Customers/IsCustomerExists?mobileNumber=$mobile';

  static String getAllCustomerDropDown =
      '/api/services/app/CommonLookup/GetAllCustomerdropDown';
  static String getSalesRegister({
    required fromDateString,
    required toDateString,
    required branchId,
    required customerId,
    required salesOrderType,
  }) =>
      '/api/services/app/SalesReports/GetSalesRegister?fromDateString=$fromDateString&toDateString=$toDateString&branchId=$branchId&customerId=$customerId&saleOrderType=$salesOrderType';

  static Map<String, String> headers(
      {String? sessionId, String? token, bool origin = false}) {
    // log(token.toString(), name: 'Header Token');

    return {
      "accept": "application/json",
      if (origin) 'Origin': originUrl,
      "content-type": "application/json",
      if (token != null) "authorization": "Bearer $token",
    };
  }
}
