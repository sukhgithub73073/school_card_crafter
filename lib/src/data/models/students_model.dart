// To parse this JSON data, do
//
//     final studentsModel = studentsModelFromJson(jsonString);

import 'dart:convert';

StudentsModel studentsModelFromJson(String str) => StudentsModel.fromJson(json.decode(str));

String studentsModelToJson(StudentsModel data) => json.encode(data.toJson());

class StudentsModel {

  List<Datum> data;

  StudentsModel({
    required this.data,
  });

  StudentsModel copyWith({
    List<Datum>? data,
  }) =>
      StudentsModel(

        data: data ?? this.data,
      );

  factory StudentsModel.fromJson(Map<String, dynamic> json) => StudentsModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  int reffId;
  int projectId;
  String sid;
  String datumClass;
  String mobileNo;
  String name;
  String father;
  String mother;
  String pinCode;
  String district;
  String tehsil;
  String? srno;
  String villageOrMohalla;
  String dob;
  String? imageUrl;
  dynamic image;
  dynamic printedAt;
  bool isPrinted;
  dynamic createdAt;
  int entryBy;
  dynamic qrImage;
  String? modifyAt;
  dynamic modifyByName;
  bool isReissueCard;

  Datum({
    required this.id,
    required this.reffId,
    required this.projectId,
    required this.sid,
    required this.datumClass,
    required this.mobileNo,
    required this.name,
    required this.father,
    required this.mother,
    required this.pinCode,
    required this.district,
    required this.tehsil,
    required this.srno,
    required this.villageOrMohalla,
    required this.dob,
    required this.imageUrl,
    required this.image,
    required this.printedAt,
    required this.isPrinted,
    required this.createdAt,
    required this.entryBy,
    required this.qrImage,
    required this.modifyAt,
    required this.modifyByName,
    required this.isReissueCard,
  });

  Datum copyWith({
    int? id,
    int? reffId,
    int? projectId,
    String? sid,
    String? datumClass,
    String? mobileNo,
    String? name,
    String? father,
    String? mother,
    String? pinCode,
    String? district,
    String? tehsil,
    String? srno,
    String? villageOrMohalla,
    String? dob,
    String? imageUrl,
    dynamic image,
    dynamic printedAt,
    bool? isPrinted,
    dynamic createdAt,
    int? entryBy,
    dynamic qrImage,
    String? modifyAt,
    dynamic modifyByName,
    bool? isReissueCard,
  }) =>
      Datum(
        id: id ?? this.id,
        reffId: reffId ?? this.reffId,
        projectId: projectId ?? this.projectId,
        sid: sid ?? this.sid,
        datumClass: datumClass ?? this.datumClass,
        mobileNo: mobileNo ?? this.mobileNo,
        name: name ?? this.name,
        father: father ?? this.father,
        mother: mother ?? this.mother,
        pinCode: pinCode ?? this.pinCode,
        district: district ?? this.district,
        tehsil: tehsil ?? this.tehsil,
        srno: srno ?? this.srno,
        villageOrMohalla: villageOrMohalla ?? this.villageOrMohalla,
        dob: dob ?? this.dob,
        imageUrl: imageUrl ?? this.imageUrl,
        image: image ?? this.image,
        printedAt: printedAt ?? this.printedAt,
        isPrinted: isPrinted ?? this.isPrinted,
        createdAt: createdAt ?? this.createdAt,
        entryBy: entryBy ?? this.entryBy,
        qrImage: qrImage ?? this.qrImage,
        modifyAt: modifyAt ?? this.modifyAt,
        modifyByName: modifyByName ?? this.modifyByName,
        isReissueCard: isReissueCard ?? this.isReissueCard,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"]??0,
    reffId: json["reffId"]??0,
    projectId: json["projectId"]??0,
    sid: json["sid"]??"",
    datumClass: json["class"]??"",
    mobileNo: json["mobileNo"]??"",
    name: json["name"]??"",
    father: json["father"]??"",
    mother: json["mother"]??"",
    pinCode: json["pinCode"]??"",
    district: json["district"]??"",
    tehsil: json["tehsil"]??"",
    srno: json["srno"]??"",
    villageOrMohalla: json["villageOrMohalla"]??"",
    dob: json["dob"]??"",
    imageUrl: json["imageUrl"]??"",
    image: json["image"]??"",
    printedAt: json["printedAt"]??"",
    isPrinted: json["isPrinted"]??"",
    createdAt: json["createdAt"]??"",
    entryBy: json["entryBy"]??0,
    qrImage: json["qrImage"]??"",
    modifyAt: json["modifyAt"]??"",
    modifyByName: json["modifyByName"]??"",
    isReissueCard: json["isReissueCard"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reffId": reffId,
    "projectId": projectId,
    "sid": sid,
    "class": datumClass,
    "mobileNo": mobileNo,
    "name": name,
    "father": father,
    "mother": mother,
    "pinCode": pinCode,
    "district": district,
    "tehsil": tehsil,
    "srno": srno,
    "villageOrMohalla": villageOrMohalla,
    "dob": dob,
    "imageUrl": imageUrl,
    "image": image,
    "printedAt": printedAt,
    "isPrinted": isPrinted,
    "createdAt": createdAt,
    "entryBy": entryBy,
    "qrImage": qrImage,
    "modifyAt": modifyAt,
    "modifyByName": modifyByName,
    "isReissueCard": isReissueCard,
  };
}
