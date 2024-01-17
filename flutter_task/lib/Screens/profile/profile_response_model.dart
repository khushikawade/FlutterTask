// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) =>
    ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) =>
    json.encode(data.toJson());

class ProfileResponse {
  String? message;
  bool? success;
  List<ProfileData>? data;
  int? statusCode;

  ProfileResponse({this.message, this.success, this.data, this.statusCode});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        message: json["message"],
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<ProfileData>.from(
                json["data"]!.map((x) => ProfileData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProfileData {
  int? clientId;
  String? clientName;
  String? clientPhone;
  DateTime? createdDate;
  bool? clientStatus;
  int? clientGender;
  String? password;
  String? mail;
  dynamic birthDate;
  int? points;
  dynamic longitude;
  dynamic latitude;
  int? country;
  dynamic savedTime;
  dynamic createdMethod;
  dynamic userId;
  dynamic restId;
  dynamic lastSeen;
  dynamic avatar;
  int? activationStep;
  int? walletBalance;
  dynamic realTimeChannel;
  int? freeQueue;
  dynamic subscription;
  dynamic subscriptionExpiredOn;
  int? totalQueue;
  bool? addedFreeQueue;
  String? loginPassword;
  bool? hasApp;
  dynamic otp;
  dynamic online;
  dynamic providerId;
  int? id;
  int? userid;
  String? username;
  dynamic bio;
  int? countryId;
  String? countryName;
  bool? countryStatus;
  String? countryCode;
  String? countryCurancy;
  String? countryNameAr;
  String? flag;
  bool? restActive;
  int? length;
  dynamic prefix;
  String? shortCode;
  dynamic ticketActive;
  dynamic region;
  List<Setting>? setting;
  Connections? connections;
  Connections? userconnections;
  Followlist? followlist;

  ProfileData({
    this.clientId,
    this.clientName,
    this.clientPhone,
    this.createdDate,
    this.clientStatus,
    this.clientGender,
    this.password,
    this.mail,
    this.birthDate,
    this.points,
    this.longitude,
    this.latitude,
    this.country,
    this.savedTime,
    this.createdMethod,
    this.userId,
    this.restId,
    this.lastSeen,
    this.avatar,
    this.activationStep,
    this.walletBalance,
    this.realTimeChannel,
    this.freeQueue,
    this.subscription,
    this.subscriptionExpiredOn,
    this.totalQueue,
    this.addedFreeQueue,
    this.loginPassword,
    this.hasApp,
    this.otp,
    this.online,
    this.providerId,
    this.id,
    this.userid,
    this.username,
    this.bio,
    this.countryId,
    this.countryName,
    this.countryStatus,
    this.countryCode,
    this.countryCurancy,
    this.countryNameAr,
    this.flag,
    this.restActive,
    this.length,
    this.prefix,
    this.shortCode,
    this.ticketActive,
    this.region,
    this.setting,
    this.connections,
    this.userconnections,
    this.followlist,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        clientId: json["client_id"],
        clientName: json["client_name"],
        clientPhone: json["client_phone"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
        clientStatus: json["client_status"],
        clientGender: json["client_gender"],
        password: json["password"],
        mail: json["mail"],
        birthDate: json["birthDate"],
        points: json["points"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        country: json["country"],
        savedTime: json["savedTime"],
        createdMethod: json["createdMethod"],
        userId: json["userId"],
        restId: json["restId"],
        lastSeen: json["lastSeen"],
        avatar: json["avatar"],
        activationStep: json["activationStep"],
        walletBalance: json["walletBalance"],
        realTimeChannel: json["realTimeChannel"],
        freeQueue: json["freeQueue"],
        subscription: json["subscription"],
        subscriptionExpiredOn: json["subscriptionExpiredOn"],
        totalQueue: json["totalQueue"],
        addedFreeQueue: json["AddedFreeQueue"],
        loginPassword: json["LoginPassword"],
        hasApp: json["hasApp"],
        otp: json["OTP"],
        online: json["online"],
        providerId: json["providerId"],
        id: json["id"],
        userid: json["Userid"],
        username: json["Username"],
        bio: json["Bio"],
        countryId: json["country_id"],
        countryName: json["country_name"],
        countryStatus: json["country_status"],
        countryCode: json["country_code"],
        countryCurancy: json["country_curancy"],
        countryNameAr: json["country_name_ar"],
        flag: json["flag"],
        restActive: json["restActive"],
        length: json["length"],
        prefix: json["prefix"],
        shortCode: json["shortCode"],
        ticketActive: json["ticketActive"],
        region: json["region"],
        setting: json["setting"] == null
            ? []
            : List<Setting>.from(
                json["setting"]!.map((x) => Setting.fromJson(x))),
        connections: json["connections"] == null
            ? null
            : Connections.fromJson(json["connections"]),
        userconnections: json["userconnections"] == null
            ? null
            : Connections.fromJson(json["userconnections"]),
        followlist: json["followlist"] == null
            ? null
            : Followlist.fromJson(json["followlist"]),
      );

  Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "client_name": clientName,
        "client_phone": clientPhone,
        "created_date": createdDate?.toIso8601String(),
        "client_status": clientStatus,
        "client_gender": clientGender,
        "password": password,
        "mail": mail,
        "birthDate": birthDate,
        "points": points,
        "longitude": longitude,
        "latitude": latitude,
        "country": country,
        "savedTime": savedTime,
        "createdMethod": createdMethod,
        "userId": userId,
        "restId": restId,
        "lastSeen": lastSeen,
        "avatar": avatar,
        "activationStep": activationStep,
        "walletBalance": walletBalance,
        "realTimeChannel": realTimeChannel,
        "freeQueue": freeQueue,
        "subscription": subscription,
        "subscriptionExpiredOn": subscriptionExpiredOn,
        "totalQueue": totalQueue,
        "AddedFreeQueue": addedFreeQueue,
        "LoginPassword": loginPassword,
        "hasApp": hasApp,
        "OTP": otp,
        "online": online,
        "providerId": providerId,
        "id": id,
        "Userid": userid,
        "Username": username,
        "Bio": bio,
        "country_id": countryId,
        "country_name": countryName,
        "country_status": countryStatus,
        "country_code": countryCode,
        "country_curancy": countryCurancy,
        "country_name_ar": countryNameAr,
        "flag": flag,
        "restActive": restActive,
        "length": length,
        "prefix": prefix,
        "shortCode": shortCode,
        "ticketActive": ticketActive,
        "region": region,
        "setting": setting == null
            ? []
            : List<dynamic>.from(setting!.map((x) => x.toJson())),
        "connections": connections?.toJson(),
        "userconnections": userconnections?.toJson(),
        "followlist": followlist?.toJson(),
      };
}

class Connections {
  int? followList;
  int? blockList;
  int? muteList;

  Connections({
    this.followList,
    this.blockList,
    this.muteList,
  });

  factory Connections.fromJson(Map<String, dynamic> json) => Connections(
        followList: json["follow_list"],
        blockList: json["block_list"],
        muteList: json["mute_list"],
      );

  Map<String, dynamic> toJson() => {
        "follow_list": followList,
        "block_list": blockList,
        "mute_list": muteList,
      };
}

class Followlist {
  int? following;
  int? follower;

  Followlist({
    this.following,
    this.follower,
  });

  factory Followlist.fromJson(Map<String, dynamic> json) => Followlist(
        following: json["following"],
        follower: json["follower"],
      );

  Map<String, dynamic> toJson() => {
        "following": following,
        "follower": follower,
      };
}

class Setting {
  int? id;
  String? country;
  String? language;
  int? termOfCondition;
  int? chatMessages;
  int? notificationSound;
  int? profilePrivate;
  int? queueVisible;
  int? myOrder;
  int? seated;
  int? chatPrivicy;
  int? commentFromAnyone;
  int? notification;
  int? userId;

  Setting({
    this.id,
    this.country,
    this.language,
    this.termOfCondition,
    this.chatMessages,
    this.notificationSound,
    this.profilePrivate,
    this.queueVisible,
    this.myOrder,
    this.seated,
    this.chatPrivicy,
    this.commentFromAnyone,
    this.notification,
    this.userId,
  });

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        id: json["id"],
        country: json["Country"],
        language: json["language"],
        termOfCondition: json["Term_Of_Condition"],
        chatMessages: json["Chat_Messages"],
        notificationSound: json["Notification_Sound"],
        profilePrivate: json["Profile_Private"],
        queueVisible: json["Queue_visible"],
        myOrder: json["my_Order"],
        seated: json["Seated"],
        chatPrivicy: json["Chat_Privicy"],
        commentFromAnyone: json["Comment_From_Anyone"],
        notification: json["Notification"],
        userId: json["UserID"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Country": country,
        "language": language,
        "Term_Of_Condition": termOfCondition,
        "Chat_Messages": chatMessages,
        "Notification_Sound": notificationSound,
        "Profile_Private": profilePrivate,
        "Queue_visible": queueVisible,
        "my_Order": myOrder,
        "Seated": seated,
        "Chat_Privicy": chatPrivicy,
        "Comment_From_Anyone": commentFromAnyone,
        "Notification": notification,
        "UserID": userId,
      };
}
