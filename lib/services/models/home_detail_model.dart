// To parse this JSON data, do
//
//     final homeDataModel = homeDataModelFromJson(jsonString);

import 'dart:convert';

HomeDataModel homeDataModelFromJson(String str) =>
    HomeDataModel.fromJson(json.decode(str));

String homeDataModelToJson(HomeDataModel data) => json.encode(data.toJson());

class HomeDataModel {
  int? statusCode;
  HomDetail? body;
  String? error;

  HomeDataModel({this.statusCode, this.body, this.error});

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
      statusCode: json["statusCode"],
      body: HomDetail.fromJson(
        json["body"],
      ),
      error: json["error"]);

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "HomDetail": body?.toJson(),
        "error": error,
      };
}

class HomDetail {
  String? id;
  String? createdById;
  dynamic customSectionNameC;
  String? dashboardSectionC;
  String? name;
  String? dashboardWidgetC;
  String? dataDashboardC;
  dynamic embedUrlC;
  String? hideC;
  dynamic iFrameC;
  String? image1C;
  String? image1LinkC;
  dynamic image2C;
  dynamic image2LinkC;
  dynamic image3C;
  dynamic image3LinkC;
  String? lastModifiedById;
  String? ownerId;
  dynamic sectionTypeC;
  String? sortOrderC;
  String? subTitle1C;
  dynamic subTitle2C;
  dynamic subTitle3C;
  String? text1C;
  dynamic text2C;
  dynamic text3C;
  String? titleC;

  HomDetail({
    this.id,
    this.createdById,
    this.customSectionNameC,
    this.dashboardSectionC,
    this.name,
    this.dashboardWidgetC,
    this.dataDashboardC,
    this.embedUrlC,
    this.hideC,
    this.iFrameC,
    this.image1C,
    this.image1LinkC,
    this.image2C,
    this.image2LinkC,
    this.image3C,
    this.image3LinkC,
    this.lastModifiedById,
    this.ownerId,
    this.sectionTypeC,
    this.sortOrderC,
    this.subTitle1C,
    this.subTitle2C,
    this.subTitle3C,
    this.text1C,
    this.text2C,
    this.text3C,
    this.titleC,
  });

  factory HomDetail.fromJson(Map<String, dynamic> json) => HomDetail(
        id: json["Id"],
        createdById: json["CreatedById"],
        customSectionNameC: json["Custom_Section_Name__c"],
        dashboardSectionC: json["Dashboard_Section__c"],
        name: json["Name"],
        dashboardWidgetC: json["Dashboard_Widget__c"],
        dataDashboardC: json["Data_Dashboard__c"],
        embedUrlC: json["Embed_URL__c"],
        hideC: json["Hide__c"],
        iFrameC: json["IFrame__c"],
        image1C: json["Image_1__c"],
        image1LinkC: json["Image_1_Link__c"],
        image2C: json["Image_2__c"],
        image2LinkC: json["Image_2_Link__c"],
        image3C: json["Image_3__c"],
        image3LinkC: json["Image_3_Link__c"],
        lastModifiedById: json["LastModifiedById"],
        ownerId: json["OwnerId"],
        sectionTypeC: json["Section_Type__c"],
        sortOrderC: json["Sort_Order__c"],
        subTitle1C: json["Sub_Title_1__c"],
        subTitle2C: json["Sub_Title_2__c"],
        subTitle3C: json["Sub_Title_3__c"],
        text1C: json["Text_1__c"],
        text2C: json["Text_2__c"],
        text3C: json["Text_3__c"],
        titleC: json["Title__c"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CreatedById": createdById,
        "Custom_Section_Name__c": customSectionNameC,
        "Dashboard_Section__c": dashboardSectionC,
        "Name": name,
        "Dashboard_Widget__c": dashboardWidgetC,
        "Data_Dashboard__c": dataDashboardC,
        "Embed_URL__c": embedUrlC,
        "Hide__c": hideC,
        "IFrame__c": iFrameC,
        "Image_1__c": image1C,
        "Image_1_Link__c": image1LinkC,
        "Image_2__c": image2C,
        "Image_2_Link__c": image2LinkC,
        "Image_3__c": image3C,
        "Image_3_Link__c": image3LinkC,
        "LastModifiedById": lastModifiedById,
        "OwnerId": ownerId,
        "Section_Type__c": sectionTypeC,
        "Sort_Order__c": sortOrderC,
        "Sub_Title_1__c": subTitle1C,
        "Sub_Title_2__c": subTitle2C,
        "Sub_Title_3__c": subTitle3C,
        "Text_1__c": text1C,
        "Text_2__c": text2C,
        "Text_3__c": text3C,
        "Title__c": titleC,
      };
}
