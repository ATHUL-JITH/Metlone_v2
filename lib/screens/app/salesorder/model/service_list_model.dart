import 'package:flutter/foundation.dart';

class ServiceDetailsModel {
  String productName;
  int productProfileId;

  ServiceDetailsModel({
    required this.productName,
    required this.productProfileId,
  });
}

class YourProviderClass with ChangeNotifier {}
