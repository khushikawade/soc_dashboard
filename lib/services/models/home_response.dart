// To parse this JSON data, do
//
//     final homeResponse = homeResponseFromJson(jsonString);

import 'dart:convert';

HomeResponse homeResponseFromJson(String str) =>
    HomeResponse.fromJson(json.decode(str));

String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

class HomeResponse {
  int? statusCode;
  List<HomeList>? body;
  String? error;

  HomeResponse({this.statusCode, this.body, this.error});

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        statusCode: json["statusCode"],
        body: json["body"] == null
            ? []
            : List<HomeList>.from(
                json["body"]!.map((x) => HomeList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "body": body == null
            ? []
            : List<dynamic>.from(body!.map((x) => x.toJson())),
      };
}

class HomeList {
  Attributes? attributes;
  String? id;
  String? ownerId;
  String? isDeleted;
  String? name;
  String? createdDate;
  String? createdById;
  String? lastModifiedDate;
  String? lastModifiedById;
  String? systemModstamp;
  dynamic lastActivityDate;
  String? lastViewedDate;
  String? lastReferencedDate;
  dynamic connectionReceivedId;
  dynamic connectionSentId;
  dynamic appBuildStatusC;
  String? appInformationC;
  String? appLogoC;
  String? backgroundColorC;
  String? bottomNavigationC;
  String? contactAddressC;
  String? contactEmailC;
  dynamic contactImageC;
  String? contactNameC;
  String? contactOfficeLocationLatitudeS;
  String? contactOfficeLocationLongitudeS;
  ContactOfficeLocationC? contactOfficeLocationC;
  String? contactPhoneC;
  String? fontColorC;
  String? fullLogoC;
  String? primaryColorC;
  String? schoolNameC;
  String? secondaryColorC;
  String? socialApiUrlC;
  String? schoolFullAppIdC;
  String? splashScreenC;
  String? familyBannerImageC;
  String? staffBannerImageC;
  String? studentBannerImageC;
  String? aboutBannerImageC;
  String? schoolBannerImageC;
  String? resourcesBannerImageC;
  dynamic playStoreUrlC;
  dynamic appStoreUrlC;
  String? bannerHeightFactorC;
  String? familyBannerColorC;
  String? staffBannerColorC;
  String? studentBannerColorC;
  String? aboutBannerColorC;
  String? schoolBannerColorC;
  String? resourcesBannerColorC;
  bool? testSchoolC;
  String? stateC;
  String? needsCustomAppC;
  String? createFamiliesSectionC;
  String? createStaffSectionC;
  String? createStudentSectionC;
  String? createStudentSection2C;
  String? disableDarkModeC;
  String? pushNotificationOptOutC;
  dynamic rssFeedUrlC;
  String? rssCodeForFeedC;
  String? authenticationUrlC;
  String? enableGradEdC;
  String? successfulPushDeliveriesPerPushC;
  String? totalNewsInteractionsC;
  String? totalSocialInteractionsC;
  String? totalPushMessagesSentC;
  String? darkModeIconColorC;
  String? januaryBannerImageC;
  String? februaryBannerImageC;
  String? marchBannerImageC;
  String? aprilBannerImageC;
  String? mayBannerImageC;
  String? juneBannerImageC;
  String? julyBannerImageC;
  String? augustBannerImageC;
  String? septemberBannerImageC;
  String? octoberBannerImageC;
  String? novemberBannerImageC;
  String? decemberBannerImageC;
  String? parentCoordinatorEmailC;
  String? slackEmailC;
  dynamic calendarIdC;
  dynamic calendarBannerImageC;
  dynamic calendarBannerColorC;
  String? enableGoogleSsoC;
  String? dashboardUrlC;

  HomeList({
    this.attributes,
    this.id,
    this.ownerId,
    this.isDeleted,
    this.name,
    this.createdDate,
    this.createdById,
    this.lastModifiedDate,
    this.lastModifiedById,
    this.systemModstamp,
    this.lastActivityDate,
    this.lastViewedDate,
    this.lastReferencedDate,
    this.connectionReceivedId,
    this.connectionSentId,
    this.appBuildStatusC,
    this.appInformationC,
    this.appLogoC,
    this.backgroundColorC,
    this.bottomNavigationC,
    this.contactAddressC,
    this.contactEmailC,
    this.contactImageC,
    this.contactNameC,
    this.contactOfficeLocationLatitudeS,
    this.contactOfficeLocationLongitudeS,
    this.contactOfficeLocationC,
    this.contactPhoneC,
    this.fontColorC,
    this.fullLogoC,
    this.primaryColorC,
    this.schoolNameC,
    this.secondaryColorC,
    this.socialApiUrlC,
    this.schoolFullAppIdC,
    this.splashScreenC,
    this.familyBannerImageC,
    this.staffBannerImageC,
    this.studentBannerImageC,
    this.aboutBannerImageC,
    this.schoolBannerImageC,
    this.resourcesBannerImageC,
    this.playStoreUrlC,
    this.appStoreUrlC,
    this.bannerHeightFactorC,
    this.familyBannerColorC,
    this.staffBannerColorC,
    this.studentBannerColorC,
    this.aboutBannerColorC,
    this.schoolBannerColorC,
    this.resourcesBannerColorC,
    this.testSchoolC,
    this.stateC,
    this.needsCustomAppC,
    this.createFamiliesSectionC,
    this.createStaffSectionC,
    this.createStudentSectionC,
    this.createStudentSection2C,
    this.disableDarkModeC,
    this.pushNotificationOptOutC,
    this.rssFeedUrlC,
    this.rssCodeForFeedC,
    this.authenticationUrlC,
    this.enableGradEdC,
    this.successfulPushDeliveriesPerPushC,
    this.totalNewsInteractionsC,
    this.totalSocialInteractionsC,
    this.totalPushMessagesSentC,
    this.darkModeIconColorC,
    this.januaryBannerImageC,
    this.februaryBannerImageC,
    this.marchBannerImageC,
    this.aprilBannerImageC,
    this.mayBannerImageC,
    this.juneBannerImageC,
    this.julyBannerImageC,
    this.augustBannerImageC,
    this.septemberBannerImageC,
    this.octoberBannerImageC,
    this.novemberBannerImageC,
    this.decemberBannerImageC,
    this.parentCoordinatorEmailC,
    this.slackEmailC,
    this.calendarIdC,
    this.calendarBannerImageC,
    this.calendarBannerColorC,
    this.enableGoogleSsoC,
    this.dashboardUrlC,
  });

  factory HomeList.fromJson(Map<String, dynamic> json) => HomeList(
        attributes: json["attributes"] == null
            ? null
            : Attributes.fromJson(json["attributes"]),
        id: json["Id"],
        ownerId: json["OwnerId"],
        isDeleted: json["IsDeleted"],
        name: json["Name"],
        createdDate: json["CreatedDate"],
        createdById: json["CreatedById"],
        lastModifiedDate: json["LastModifiedDate"],
        lastModifiedById: json["LastModifiedById"],
        systemModstamp: json["SystemModstamp"],
        lastActivityDate: json["LastActivityDate"],
        lastViewedDate: json["LastViewedDate"],
        lastReferencedDate: json["LastReferencedDate"],
        connectionReceivedId: json["ConnectionReceivedId"],
        connectionSentId: json["ConnectionSentId"],
        appBuildStatusC: json["App_Build_Status__c"],
        appInformationC: json["App_Information__c"],
        appLogoC: json["App_Logo__c"],
        backgroundColorC: json["Background_Color__c"],
        bottomNavigationC: json["Bottom_Navigation__c"],
        contactAddressC: json["Contact_Address__c"],
        contactEmailC: json["Contact_Email__c"],
        contactImageC: json["Contact_Image__c"],
        contactNameC: json["Contact_Name__c"],
        contactOfficeLocationLatitudeS:
            json["Contact_Office_Location__Latitude__s"],
        contactOfficeLocationLongitudeS:
            json["Contact_Office_Location__Longitude__s"],
        contactOfficeLocationC: json["Contact_Office_Location__c"] == null
            ? null
            : ContactOfficeLocationC.fromJson(
                json["Contact_Office_Location__c"]),
        contactPhoneC: json["Contact_Phone__c"],
        fontColorC: json["Font_Color__c"],
        fullLogoC: json["Full_Logo__c"],
        primaryColorC: json["Primary_Color__c"],
        schoolNameC: json["School_Name__c"],
        secondaryColorC: json["Secondary_Color__c"],
        socialApiUrlC: json["Social_API_URL__c"],
        schoolFullAppIdC: json["School_Full_App_ID__c"],
        splashScreenC: json["Splash_Screen__c"],
        familyBannerImageC: json["Family_Banner_Image__c"],
        staffBannerImageC: json["Staff_Banner_Image__c"],
        studentBannerImageC: json["Student_Banner_Image__c"],
        aboutBannerImageC: json["About_Banner_Image__c"],
        schoolBannerImageC: json["School_Banner_Image__c"],
        resourcesBannerImageC: json["Resources_Banner_Image__c"],
        playStoreUrlC: json["Play_Store_URL__c"],
        appStoreUrlC: json["App_Store_URL__c"],
        bannerHeightFactorC: json["Banner_Height_Factor__c"],
        familyBannerColorC: json["Family_Banner_Color__c"],
        staffBannerColorC: json["Staff_Banner_Color__c"],
        studentBannerColorC: json["Student_Banner_Color__c"],
        aboutBannerColorC: json["About_Banner_Color__c"],
        schoolBannerColorC: json["School_Banner_Color__c"],
        resourcesBannerColorC: json["Resources_Banner_Color__c"],
        testSchoolC: json["Test_School__c"],
        stateC: json["State__c"],
        needsCustomAppC: json["Needs_Custom_App__c"],
        createFamiliesSectionC: json["Create_Families_Section__c"],
        createStaffSectionC: json["Create_Staff_Section__c"],
        createStudentSectionC: json["Create_Student_Section__c"],
        createStudentSection2C: json["Create_Student_Section_2__c"],
        disableDarkModeC: json["Disable_Dark_Mode__c"],
        pushNotificationOptOutC: json["Push_Notification_Opt_Out__c"],
        rssFeedUrlC: json["RSS_feed_URL__c"],
        rssCodeForFeedC: json["RSS_Code_for_feed__c"],
        authenticationUrlC: json["Authentication_URL__c"],
        enableGradEdC: json["Enable_GradEd__c"],
        successfulPushDeliveriesPerPushC:
            json["Successful_Push_Deliveries_per_Push__c"],
        totalNewsInteractionsC: json["Total_News_Interactions__c"],
        totalSocialInteractionsC: json["Total_Social_Interactions__c"],
        totalPushMessagesSentC: json["Total_Push_Messages_Sent__c"],
        darkModeIconColorC: json["Dark_Mode_Icon_Color__c"],
        januaryBannerImageC: json["January_Banner_Image__c"],
        februaryBannerImageC: json["February_Banner_Image__c"],
        marchBannerImageC: json["March_Banner_Image__c"],
        aprilBannerImageC: json["April_Banner_Image__c"],
        mayBannerImageC: json["May_Banner_Image__c"],
        juneBannerImageC: json["June_Banner_Image__c"],
        julyBannerImageC: json["July_Banner_Image__c"],
        augustBannerImageC: json["August_Banner_Image__c"],
        septemberBannerImageC: json["September_Banner_Image__c"],
        octoberBannerImageC: json["October_Banner_Image__c"],
        novemberBannerImageC: json["November_Banner_Image__c"],
        decemberBannerImageC: json["December_Banner_Image__c"],
        parentCoordinatorEmailC: json["Parent_Coordinator_Email__c"],
        slackEmailC: json["Slack_Email__c"],
        calendarIdC: json["Calendar_Id__c"],
        calendarBannerImageC: json["Calendar_Banner_Image__c"],
        calendarBannerColorC: json["Calendar_Banner_Color__c"],
        enableGoogleSsoC: json["Enable_Google_SSO__c"],
        dashboardUrlC: json["Dashboard_URL__c"],
      );

  Map<String, dynamic> toJson() => {
        "attributes": attributes?.toJson(),
        "Id": id,
        "OwnerId": ownerId,
        "IsDeleted": isDeleted,
        "Name": name,
        "CreatedDate": createdDate,
        "CreatedById": createdById,
        "LastModifiedDate": lastModifiedDate,
        "LastModifiedById": lastModifiedById,
        "SystemModstamp": systemModstamp,
        "LastActivityDate": lastActivityDate,
        "LastViewedDate": lastViewedDate,
        "LastReferencedDate": lastReferencedDate,
        "ConnectionReceivedId": connectionReceivedId,
        "ConnectionSentId": connectionSentId,
        "App_Build_Status__c": appBuildStatusC,
        "App_Information__c": appInformationC,
        "App_Logo__c": appLogoC,
        "Background_Color__c": backgroundColorC,
        "Bottom_Navigation__c": bottomNavigationC,
        "Contact_Address__c": contactAddressC,
        "Contact_Email__c": contactEmailC,
        "Contact_Image__c": contactImageC,
        "Contact_Name__c": contactNameC,
        "Contact_Office_Location__Latitude__s": contactOfficeLocationLatitudeS,
        "Contact_Office_Location__Longitude__s":
            contactOfficeLocationLongitudeS,
        "Contact_Office_Location__c": contactOfficeLocationC?.toJson(),
        "Contact_Phone__c": contactPhoneC,
        "Font_Color__c": fontColorC,
        "Full_Logo__c": fullLogoC,
        "Primary_Color__c": primaryColorC,
        "School_Name__c": schoolNameC,
        "Secondary_Color__c": secondaryColorC,
        "Social_API_URL__c": socialApiUrlC,
        "School_Full_App_ID__c": schoolFullAppIdC,
        "Splash_Screen__c": splashScreenC,
        "Family_Banner_Image__c": familyBannerImageC,
        "Staff_Banner_Image__c": staffBannerImageC,
        "Student_Banner_Image__c": studentBannerImageC,
        "About_Banner_Image__c": aboutBannerImageC,
        "School_Banner_Image__c": schoolBannerImageC,
        "Resources_Banner_Image__c": resourcesBannerImageC,
        "Play_Store_URL__c": playStoreUrlC,
        "App_Store_URL__c": appStoreUrlC,
        "Banner_Height_Factor__c": bannerHeightFactorC,
        "Family_Banner_Color__c": familyBannerColorC,
        "Staff_Banner_Color__c": staffBannerColorC,
        "Student_Banner_Color__c": studentBannerColorC,
        "About_Banner_Color__c": aboutBannerColorC,
        "School_Banner_Color__c": schoolBannerColorC,
        "Resources_Banner_Color__c": resourcesBannerColorC,
        "Test_School__c": testSchoolC,
        "State__c": stateC,
        "Needs_Custom_App__c": needsCustomAppC,
        "Create_Families_Section__c": createFamiliesSectionC,
        "Create_Staff_Section__c": createStaffSectionC,
        "Create_Student_Section__c": createStudentSectionC,
        "Create_Student_Section_2__c": createStudentSection2C,
        "Disable_Dark_Mode__c": disableDarkModeC,
        "Push_Notification_Opt_Out__c": pushNotificationOptOutC,
        "RSS_feed_URL__c": rssFeedUrlC,
        "RSS_Code_for_feed__c": rssCodeForFeedC,
        "Authentication_URL__c": authenticationUrlC,
        "Enable_GradEd__c": enableGradEdC,
        "Successful_Push_Deliveries_per_Push__c":
            successfulPushDeliveriesPerPushC,
        "Total_News_Interactions__c": totalNewsInteractionsC,
        "Total_Social_Interactions__c": totalSocialInteractionsC,
        "Total_Push_Messages_Sent__c": totalPushMessagesSentC,
        "Dark_Mode_Icon_Color__c": darkModeIconColorC,
        "January_Banner_Image__c": januaryBannerImageC,
        "February_Banner_Image__c": februaryBannerImageC,
        "March_Banner_Image__c": marchBannerImageC,
        "April_Banner_Image__c": aprilBannerImageC,
        "May_Banner_Image__c": mayBannerImageC,
        "June_Banner_Image__c": juneBannerImageC,
        "July_Banner_Image__c": julyBannerImageC,
        "August_Banner_Image__c": augustBannerImageC,
        "September_Banner_Image__c": septemberBannerImageC,
        "October_Banner_Image__c": octoberBannerImageC,
        "November_Banner_Image__c": novemberBannerImageC,
        "December_Banner_Image__c": decemberBannerImageC,
        "Parent_Coordinator_Email__c": parentCoordinatorEmailC,
        "Slack_Email__c": slackEmailC,
        "Calendar_Id__c": calendarIdC,
        "Calendar_Banner_Image__c": calendarBannerImageC,
        "Calendar_Banner_Color__c": calendarBannerColorC,
        "Enable_Google_SSO__c": enableGoogleSsoC,
        "Dashboard_URL__c": dashboardUrlC,
      };
}

class Attributes {
  String? type;
  String? url;

  Attributes({
    this.type,
    this.url,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };
}

class ContactOfficeLocationC {
  double? latitude;
  double? longitude;

  ContactOfficeLocationC({
    this.latitude,
    this.longitude,
  });

  factory ContactOfficeLocationC.fromJson(Map<String, dynamic> json) =>
      ContactOfficeLocationC(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
