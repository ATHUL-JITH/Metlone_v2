// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login? loginFromJson(String? str) {
  if (str == null) return null;
  return Login.fromJson(json.decode(str));
}

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Result result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  Login({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory Login.fromJson(dynamic json) => Login(
        result: Result.fromJson(json["result"]),
        targetUrl: json["targetUrl"],
        success: json["success"],
        error: json["error"],
        unAuthorizedRequest: json["unAuthorizedRequest"],
        abp: json["__abp"],
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "targetUrl": targetUrl,
        "success": success,
        "error": error,
        "unAuthorizedRequest": unAuthorizedRequest,
        "__abp": abp,
      };
}

class Result {
  dynamic user;
  dynamic impersonatorUser;
  dynamic tenant;
  dynamic impersonatorTenant;
  Application application;
  Theme theme;

  Result({
    required this.user,
    required this.impersonatorUser,
    required this.tenant,
    required this.impersonatorTenant,
    required this.application,
    required this.theme,
  });

  factory Result.fromJson(dynamic json) => Result(
        user: json["user"],
        impersonatorUser: json["impersonatorUser"],
        tenant: json["tenant"],
        impersonatorTenant: json["impersonatorTenant"],
        application: Application.fromJson(json["application"]),
        theme: Theme.fromJson(json["theme"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "impersonatorUser": impersonatorUser,
        "tenant": tenant,
        "impersonatorTenant": impersonatorTenant,
        "application": application.toJson(),
        "theme": theme.toJson(),
      };
}

class Application {
  String version;
  DateTime releaseDate;
  String currency;
  String currencySign;
  bool allowTenantsToChangeEmailSettings;
  bool userDelegationIsEnabled;
  int twoFactorCodeExpireSeconds;
  Features features;

  Application({
    required this.version,
    required this.releaseDate,
    required this.currency,
    required this.currencySign,
    required this.allowTenantsToChangeEmailSettings,
    required this.userDelegationIsEnabled,
    required this.twoFactorCodeExpireSeconds,
    required this.features,
  });

  factory Application.fromJson(dynamic json) => Application(
        version: json["version"],
        releaseDate: DateTime.parse(json["releaseDate"]),
        currency: json["currency"],
        currencySign: json["currencySign"],
        allowTenantsToChangeEmailSettings:
            json["allowTenantsToChangeEmailSettings"],
        userDelegationIsEnabled: json["userDelegationIsEnabled"],
        twoFactorCodeExpireSeconds: json["twoFactorCodeExpireSeconds"],
        features: json["features"] != null
            ? Features.fromJson(json["features"])
            : Features(),
      );
  Map<String, dynamic> toJson() => {
        "version": version,
        "releaseDate": releaseDate.toIso8601String(),
        "currency": currency,
        "currencySign": currencySign,
        "allowTenantsToChangeEmailSettings": allowTenantsToChangeEmailSettings,
        "userDelegationIsEnabled": userDelegationIsEnabled,
        "twoFactorCodeExpireSeconds": twoFactorCodeExpireSeconds,
        "features": features.toJson(),
      };
}

class Features {
  Features();

  factory Features.fromJson(Map<String, dynamic> json) => Features();

  Map<String, dynamic> toJson() => {};
}

class Theme {
  BaseSettings baseSettings;
  bool isLeftMenuUsed;
  bool isTopMenuUsed;
  bool isTabMenuUsed;
  bool allowMenuScroll;

  Theme({
    required this.baseSettings,
    required this.isLeftMenuUsed,
    required this.isTopMenuUsed,
    required this.isTabMenuUsed,
    required this.allowMenuScroll,
  });

  factory Theme.fromJson(Map<String, dynamic> json) => Theme(
        baseSettings: BaseSettings.fromJson(json["baseSettings"]),
        isLeftMenuUsed: json["isLeftMenuUsed"],
        isTopMenuUsed: json["isTopMenuUsed"],
        isTabMenuUsed: json["isTabMenuUsed"],
        allowMenuScroll: json["allowMenuScroll"],
      );

  Map<String, dynamic> toJson() => {
        "baseSettings": baseSettings.toJson(),
        "isLeftMenuUsed": isLeftMenuUsed,
        "isTopMenuUsed": isTopMenuUsed,
        "isTabMenuUsed": isTabMenuUsed,
        "allowMenuScroll": allowMenuScroll,
      };
}

class BaseSettings {
  String theme;
  Layout layout;
  Header header;
  SubHeader subHeader;
  Menu menu;
  Footer footer;

  BaseSettings({
    required this.theme,
    required this.layout,
    required this.header,
    required this.subHeader,
    required this.menu,
    required this.footer,
  });

  factory BaseSettings.fromJson(Map<String, dynamic> json) => BaseSettings(
        theme: json["theme"],
        layout: Layout.fromJson(json["layout"]),
        header: Header.fromJson(json["header"]),
        subHeader: SubHeader.fromJson(json["subHeader"]),
        menu: Menu.fromJson(json["menu"]),
        footer: Footer.fromJson(json["footer"]),
      );

  Map<String, dynamic> toJson() => {
        "theme": theme,
        "layout": layout.toJson(),
        "header": header.toJson(),
        "subHeader": subHeader.toJson(),
        "menu": menu.toJson(),
        "footer": footer.toJson(),
      };
}

class Footer {
  bool fixedFooter;

  Footer({
    required this.fixedFooter,
  });

  factory Footer.fromJson(Map<String, dynamic> json) => Footer(
        fixedFooter: json["fixedFooter"],
      );

  Map<String, dynamic> toJson() => {
        "fixedFooter": fixedFooter,
      };
}

class Header {
  bool desktopFixedHeader;
  bool mobileFixedHeader;
  String headerSkin;
  dynamic minimizeDesktopHeaderType;

  Header({
    required this.desktopFixedHeader,
    required this.mobileFixedHeader,
    required this.headerSkin,
    required this.minimizeDesktopHeaderType,
  });

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        desktopFixedHeader: json["desktopFixedHeader"],
        mobileFixedHeader: json["mobileFixedHeader"],
        headerSkin: json["headerSkin"],
        minimizeDesktopHeaderType: json["minimizeDesktopHeaderType"],
      );

  Map<String, dynamic> toJson() => {
        "desktopFixedHeader": desktopFixedHeader,
        "mobileFixedHeader": mobileFixedHeader,
        "headerSkin": headerSkin,
        "minimizeDesktopHeaderType": minimizeDesktopHeaderType,
      };
}

class Layout {
  String layoutType;

  Layout({
    required this.layoutType,
  });

  factory Layout.fromJson(Map<String, dynamic> json) => Layout(
        layoutType: json["layoutType"],
      );

  Map<String, dynamic> toJson() => {
        "layoutType": layoutType,
      };
}

class Menu {
  String position;
  String asideSkin;
  bool fixedAside;
  bool allowAsideMinimizing;
  bool defaultMinimizedAside;
  String submenuToggle;
  bool searchActive;
  bool enableSecondary;
  bool hoverableAside;

  Menu({
    required this.position,
    required this.asideSkin,
    required this.fixedAside,
    required this.allowAsideMinimizing,
    required this.defaultMinimizedAside,
    required this.submenuToggle,
    required this.searchActive,
    required this.enableSecondary,
    required this.hoverableAside,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        position: json["position"],
        asideSkin: json["asideSkin"],
        fixedAside: json["fixedAside"],
        allowAsideMinimizing: json["allowAsideMinimizing"],
        defaultMinimizedAside: json["defaultMinimizedAside"],
        submenuToggle: json["submenuToggle"],
        searchActive: json["searchActive"],
        enableSecondary: json["enableSecondary"],
        hoverableAside: json["hoverableAside"],
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "asideSkin": asideSkin,
        "fixedAside": fixedAside,
        "allowAsideMinimizing": allowAsideMinimizing,
        "defaultMinimizedAside": defaultMinimizedAside,
        "submenuToggle": submenuToggle,
        "searchActive": searchActive,
        "enableSecondary": enableSecondary,
        "hoverableAside": hoverableAside,
      };
}

class SubHeader {
  bool fixedSubHeader;
  String subheaderStyle;
  int subheaderSize;
  String titleStlye;
  String containerStyle;

  SubHeader({
    required this.fixedSubHeader,
    required this.subheaderStyle,
    required this.subheaderSize,
    required this.titleStlye,
    required this.containerStyle,
  });

  factory SubHeader.fromJson(Map<String, dynamic> json) => SubHeader(
        fixedSubHeader: json["fixedSubHeader"],
        subheaderStyle: json["subheaderStyle"],
        subheaderSize: json["subheaderSize"],
        titleStlye: json["titleStlye"],
        containerStyle: json["containerStyle"],
      );

  Map<String, dynamic> toJson() => {
        "fixedSubHeader": fixedSubHeader,
        "subheaderStyle": subheaderStyle,
        "subheaderSize": subheaderSize,
        "titleStlye": titleStlye,
        "containerStyle": containerStyle,
      };
}
