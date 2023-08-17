// To parse this JSON data, do
//
//     final homeResponse = homeResponseFromJson(jsonString);

import 'dart:convert';

HomeResponse homeResponseFromJson(String str) =>
    HomeResponse.fromJson(json.decode(str));

String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

class HomeResponse {
  int? statusCode;
  HomeList? body;
  String? error;

  HomeResponse({this.statusCode, this.body, this.error});

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
      statusCode: json["statusCode"],
      body: HomeList.fromJson(json["body"]),
      error: json["error"]);

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "body": body!.toJson(),
        "error": error,
      };
}

class HomeList {
  String? id;
  dynamic dbnC;
  String? schoolNameC;
  String? schoolC;
  Account? account;
  List<DashboardSection>? dashboardSections;

  HomeList({
    this.id,
    this.dbnC,
    this.schoolNameC,
    this.schoolC,
    this.account,
    this.dashboardSections,
  });

  factory HomeList.fromJson(Map<String, dynamic> json) => HomeList(
        id: json["Id"],
        dbnC: json["DBN__c"],
        schoolNameC: json["School_Name__c"],
        schoolC: json["School__c"],
        account: Account.fromJson(json["Account"]),
        dashboardSections: json["DashboardSections"] == null
            ? []
            : List<DashboardSection>.from(json["DashboardSections"]
                .map((x) => DashboardSection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DBN__c": dbnC,
        "School_Name__c": schoolNameC,
        "School__c": schoolC,
        "Account": account!.toJson(),
        "DashboardSections": dashboardSections == null
            ? []
            : List<dynamic>.from(dashboardSections!.map((x) => x.toJson())),
      };
}

class Account {
  String? id;
  String? dbnC;
  SchoolApp? schoolApp;

  Account({
    this.id,
    this.dbnC,
    this.schoolApp,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["Id"],
        dbnC: json["DBN__c"],
        schoolApp: json["SchoolApp"] == null
            ? null
            : SchoolApp.fromJson(json["SchoolApp"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DBN__c": dbnC,
        "SchoolApp": schoolApp?.toJson(),
      };
}

class SchoolApp {
  String? id;
  String? schoolNameC;
  String? appLogoC;
  String? primaryColorC;
  String? secondaryColorC;
  String? contactNameC;
  String? backgroundColorC;

  SchoolApp({
    this.id,
    this.schoolNameC,
    this.appLogoC,
    this.primaryColorC,
    this.secondaryColorC,
    this.contactNameC,
    this.backgroundColorC,
  });

  factory SchoolApp.fromJson(Map<String, dynamic> json) => SchoolApp(
        id: json["Id"],
        schoolNameC: json["School_Name__c"],
        appLogoC: json["App_Logo__c"],
        primaryColorC: json["Primary_Color__c"],
        secondaryColorC: json["Secondary_Color__c"],
        contactNameC: json["Contact_Name__c"],
        backgroundColorC: json["Background_Color__c"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "School_Name__c": schoolNameC,
        "App_Logo__c": appLogoC,
        "Primary_Color__c": primaryColorC,
        "Secondary_Color__c": secondaryColorC,
        "Contact_Name__c": contactNameC,
        "Background_Color__c": backgroundColorC,
      };
}

class DashboardSection {
  String? dashboardSectionC;
  String? sortOrder;
  String? sectionTypeC;
  String? dashboardWidgetC;
  String? id;
  List<DashboardSubSection>? dashboardSubSections;

  DashboardSection({
    this.dashboardSectionC,
    this.sortOrder,
    this.sectionTypeC,
    this.dashboardWidgetC,
    this.id,
    this.dashboardSubSections,
  });

  factory DashboardSection.fromJson(Map<String, dynamic> json) =>
      DashboardSection(
        dashboardSectionC: json["Dashboard_Section__c"],
        sortOrder: json["Sort_Order__c"],
        sectionTypeC: json["Section_Type__c"],
        dashboardWidgetC: json["Dashboard_Widget__c"],
        id: json["Id"],
        dashboardSubSections: json["DashboardSubSections"] == null
            ? []
            : List<DashboardSubSection>.from(json["DashboardSubSections"]
                .map((x) => DashboardSubSection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Dashboard_Section__c": dashboardSectionC,
        "Sort_Order__c": sortOrder,
        "Section_Type__c": sectionTypeC,
        "Dashboard_Widget__c": dashboardWidgetC,
        "Id": id,
        "DashboardSubSections": dashboardSubSections == null
            ? []
            : List<dynamic>.from(dashboardSubSections!.map((x) => x.toJson())),
      };
}

class DashboardSubSection {
  String? id;
  String? subSectionC;
  String? widgetC;
  String? sectionTypeC;
  String? embedUrlC;
  List<DashboardSubSubSection>? dashboardSubSubSections;

  DashboardSubSection({
    this.id,
    this.subSectionC,
    this.widgetC,
    this.sectionTypeC,
    this.embedUrlC,
    this.dashboardSubSubSections,
  });

  factory DashboardSubSection.fromJson(Map<String, dynamic> json) =>
      DashboardSubSection(
        id: json["Id"],
        subSectionC: json["Sub_Section__c"],
        widgetC: json["Widget__c"],
        sectionTypeC: json["Section_Type__c"],
        embedUrlC: json["Embed_URL__c"],
        dashboardSubSubSections: json["DashboardSubSubSections"] == null
            ? []
            : List<DashboardSubSubSection>.from(json["DashboardSubSubSections"]
                .map((x) => DashboardSubSubSection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Sub_Section__c": subSectionC,
        "Widget__c": widgetC,
        "Section_Type__c": sectionTypeC,
        "Embed_URL__c": embedUrlC,
        "DashboardSubSubSections": dashboardSubSubSections == null
            ? []
            : List<dynamic>.from(
                dashboardSubSubSections!.map((x) => x.toJson())),
      };
}

class DashboardSubSubSection {
  String? empty;

  DashboardSubSubSection({
    this.empty,
  });

  factory DashboardSubSubSection.fromJson(Map<String, dynamic> json) =>
      DashboardSubSubSection(
        empty: json[""],
      );

  Map<String, dynamic> toJson() => {
        "": empty,
      };
}








// // To parse this JSON data, do
// //
// //     final homeResponse = homeResponseFromJson(jsonString);

// import 'dart:convert';

// HomeResponse homeResponseFromJson(String str) =>
//     HomeResponse.fromJson(json.decode(str));

// String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

// class HomeResponse {
//   int? statusCode;
//   List<HomeList>? body;
//   String? error;

//   HomeResponse({this.statusCode, this.body, this.error});

//   factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
//         statusCode: json["statusCode"],
//         body: json["body"] == null
//             ? []
//             : List<HomeList>.from(
//                 json["body"]!.map((x) => HomeList.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "statusCode": statusCode,
//         "body": body == null
//             ? []
//             : List<dynamic>.from(body!.map((x) => x.toJson())),
//       };
// }

// class HomeList {
//   String? id;
//   dynamic dbnC;
//   String? schoolNameC;
//   String? schoolC;
//   Account? account;
//   List<DashboardSection>? dashboardSections;

//   HomeList(
//       {this.id,
//       this.dbnC,
//       this.schoolNameC,
//       this.schoolC,
//       this.dashboardSections,
//       this.account});

//   factory HomeList.fromJson(Map<String, dynamic> json) => HomeList(
//         id: json["Id"],
//         dbnC: json["DBN__c"],
//         schoolNameC: json["School_Name__c"],
//         schoolC: json["School__c"],
//         account: Account.fromJson(json["Account"]),
//         dashboardSections: json["DashboardSections"] == null
//             ? []
//             : List<DashboardSection>.from(json["DashboardSections"]
//                 .map((x) => DashboardSection.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "DBN__c": dbnC,
//         "School_Name__c": schoolNameC,
//         "School__c": schoolC,
//         "DashboardSections": dashboardSections == null
//             ? []
//             : List<dynamic>.from(dashboardSections!.map((x) => x.toJson())),
//       };
// }

// class Account {
//   String? id;
//   dynamic dbnC;
//   dynamic schoolApp;

//   Account({
//     this.id,
//     this.dbnC,
//     this.schoolApp,
//   });

//   factory Account.fromJson(Map<String, dynamic> json) => Account(
//         id: json["Id"],
//         dbnC: json["DBN__c"],
//         schoolApp: json["SchoolApp"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "DBN__c": dbnC,
//         "SchoolApp": schoolApp,
//       };
// }

// class DashboardSection {
//   String? dashboardSectionC;
//   String? sectionTypeC;
//   String? dashboardWidgetC;
//   List<DashboardSubSection>? dashboardSubSections;

//   DashboardSection({
//     this.dashboardSectionC,
//     this.sectionTypeC,
//     this.dashboardWidgetC,
//     this.dashboardSubSections,
//   });

//   factory DashboardSection.fromJson(Map<String, dynamic> json) =>
//       DashboardSection(
//         dashboardSectionC: json["Dashboard_Section__c"],
//         sectionTypeC: json["Section_Type__c"],
//         dashboardWidgetC: json["Dashboard_Widget__c"],
//         dashboardSubSections: json["DashboardSubSections"] == null
//             ? []
//             : List<DashboardSubSection>.from(json["DashboardSubSections"]
//                 .map((x) => DashboardSubSection.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "Dashboard_Section__c": dashboardSectionC,
//         "Section_Type__c": sectionTypeC,
//         "Dashboard_Widget__c": dashboardWidgetC,
//         "DashboardSubSections": dashboardSubSections == null
//             ? []
//             : List<dynamic>.from(dashboardSubSections!.map((x) => x.toJson())),
//       };
// }

// class DashboardSubSection {
//   String? id;
//   String? subSectionC;
//   String? widgetC;
//   String? sectionTypeC;
//   String? embedUrlC;
//   List<DashboardSubSubSection>? dashboardSubSubSections;

//   DashboardSubSection({
//     this.id,
//     this.subSectionC,
//     this.widgetC,
//     this.sectionTypeC,
//     this.embedUrlC,
//     this.dashboardSubSubSections,
//   });

//   factory DashboardSubSection.fromJson(Map<String, dynamic> json) =>
//       DashboardSubSection(
//         id: json["Id"],
//         subSectionC: json["Sub_Section__c"],
//         widgetC: json["Widget__c"],
//         sectionTypeC: json["Section_Type__c"],
//         embedUrlC: json["Embed_URL__c"],
//         dashboardSubSubSections: json["DashboardSubSubSections"] == null
//             ? []
//             : List<DashboardSubSubSection>.from(json["DashboardSubSubSections"]
//                 .map((x) => DashboardSubSubSection.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "Sub_Section__c": subSectionC,
//         "Widget__c": widgetC,
//         "Section_Type__c": sectionTypeC,
//         "Embed_URL__c": embedUrlC,
//         "DashboardSubSubSections": dashboardSubSubSections == null
//             ? []
//             : List<dynamic>.from(
//                 dashboardSubSubSections!.map((x) => x.toJson())),
//       };
// }

// class DashboardSubSubSection {
//   String? empty;

//   DashboardSubSubSection({
//      this.empty,
//   });

//   factory DashboardSubSubSection.fromJson(Map<String, dynamic> json) =>
//       DashboardSubSubSection(
//         empty: json[""],
//       );

//   Map<String, dynamic> toJson() => {
//         "": empty,
//       };
// }
