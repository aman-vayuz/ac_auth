import 'dart:convert';

List<LoginModel> loginModelFromJson(String str) =>
    List<LoginModel>.from(json.decode(str)["data"].map((x) => LoginModel.fromJson(x)));

String loginModelToJson(List<LoginModel> data) =>
    json.encode({"data": List<dynamic>.from(data.map((x) => x.toJson()))});

class LoginModel {
  String id;
  List<String> keyIds;
  String masterFormId;
  String name;
  String uniqueKey;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<KeyDetail> masterKeyDetails;
  List<DomainSpecificFormConfig> domainSpecificFormConfig;

  LoginModel({
    required this.id,
    required this.keyIds,
    required this.masterFormId,
    required this.name,
    required this.uniqueKey,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.masterKeyDetails,
    required this.domainSpecificFormConfig,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    id: json["_id"],
    keyIds: List<String>.from(json["keyIds"]),
    masterFormId: json["masterFormId"],
    name: json["name"],
    uniqueKey: json["uniqueKey"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    masterKeyDetails: List<KeyDetail>.from(
        json["masterKeyDetails"].map((x) => KeyDetail.fromJson(x))),
    domainSpecificFormConfig: List<DomainSpecificFormConfig>.from(
        json["domainSpecificFormConfig"]
            .map((x) => DomainSpecificFormConfig.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "keyIds": List<dynamic>.from(keyIds),
    "masterFormId": masterFormId,
    "name": name,
    "uniqueKey": uniqueKey,
    "isActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "masterKeyDetails":
    List<dynamic>.from(masterKeyDetails.map((x) => x.toJson())),
    "domainSpecificFormConfig": List<dynamic>.from(
        domainSpecificFormConfig.map((x) => x.toJson())),
  };
}

class KeyDetail {
  String id;
  String masterConfigId;
  String key;
  String value;
  String? regexId;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<RegexDetail> regexDetails;

  KeyDetail({
    required this.id,
    required this.masterConfigId,
    required this.key,
    required this.value,
    this.regexId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.regexDetails,
  });

  factory KeyDetail.fromJson(Map<String, dynamic> json) => KeyDetail(
    id: json["_id"],
    masterConfigId: json["masterConfigId"],
    key: json["key"],
    value: json["value"],
    regexId: json["regexId"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    regexDetails: json["regexDetails"] == null
        ? []
        : List<RegexDetail>.from(
        json["regexDetails"].map((x) => RegexDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "masterConfigId": masterConfigId,
    "key": key,
    "value": value,
    "regexId": regexId,
    "isActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "regexDetails":
    List<dynamic>.from(regexDetails.map((x) => x.toJson())),
  };
}

class RegexDetail {
  String id;
  String regexId;
  String name;
  Map<String, dynamic> regex;
  int maxLength;
  bool isRequired;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  RegexDetail({
    required this.id,
    required this.regexId,
    required this.name,
    required this.regex,
    required this.maxLength,
    required this.isRequired,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory RegexDetail.fromJson(Map<String, dynamic> json) => RegexDetail(
    id: json["_id"],
    regexId: json["regexId"],
    name: json["name"],
    regex: json["regex"],
    maxLength: json["maxLength"],
    isRequired: json["isRequired"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "regexId": regexId,
    "name": name,
    "regex": regex,
    "maxLength": maxLength,
    "isRequired": isRequired,
    "isActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class DomainSpecificFormConfig {
  String id;
  List<String> keyIds;
  String domainSpecificConfigId;
  String domainId;
  String masterFormId;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<KeyDetail> keyDetails;

  DomainSpecificFormConfig({
    required this.id,
    required this.keyIds,
    required this.domainSpecificConfigId,
    required this.domainId,
    required this.masterFormId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.keyDetails,
  });

  factory DomainSpecificFormConfig.fromJson(Map<String, dynamic> json) =>
      DomainSpecificFormConfig(
        id: json["_id"],
        keyIds: List<String>.from(json["keyIds"]),
        domainSpecificConfigId: json["domainSpecificConfigId"],
        domainId: json["domainId"],
        masterFormId: json["masterFormId"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        keyDetails: List<KeyDetail>.from(
            json["keyDetails"].map((x) => KeyDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "keyIds": List<dynamic>.from(keyIds),
    "domainSpecificConfigId": domainSpecificConfigId,
    "domainId": domainId,
    "masterFormId": masterFormId,
    "isActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "keyDetails": List<dynamic>.from(keyDetails.map((x) => x.toJson())),
  };
}
