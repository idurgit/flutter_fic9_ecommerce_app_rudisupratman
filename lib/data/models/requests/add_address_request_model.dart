import 'dart:convert';

class AddAddressRequestModel {
  final AddAdress data;

  AddAddressRequestModel({
    required this.data,
  });

  factory AddAddressRequestModel.fromJson(String str) =>
      AddAddressRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddAddressRequestModel.fromMap(Map<String, dynamic> json) =>
      AddAddressRequestModel(
        data: AddAdress.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class AddAdress {
  final String name;
  final String address;
  final String phone;
  final String provId;
  final String cityId;
  final String subdistrictId;
  final String postalCode;
  final String userId;
  final bool isDefault;

  AddAdress({
    required this.name,
    required this.address,
    required this.phone,
    required this.provId,
    required this.cityId,
    required this.subdistrictId,
    required this.postalCode,
    required this.userId,
    required this.isDefault,
  });

  factory AddAdress.fromJson(String str) => AddAdress.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddAdress.fromMap(Map<String, dynamic> json) => AddAdress(
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        provId: json["prov_id"],
        cityId: json["city_id"],
        subdistrictId: json["subdistrict_id"],
        postalCode: json["postal_code"],
        userId: json["user_id"],
        isDefault: json["is_default"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "address": address,
        "phone": phone,
        "prov_id": provId,
        "city_id": cityId,
        "subdistrict_id": subdistrictId,
        "postal_code": postalCode,
        "user_id": userId,
        "is_default": isDefault,
      };
}
