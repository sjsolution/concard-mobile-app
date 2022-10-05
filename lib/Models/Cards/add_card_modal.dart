class AddCardModal {
  final int? code;
  final String? message;
  final Data? data;

  AddCardModal({
    this.code,
    this.message,
    this.data,
  });

  AddCardModal.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : data?.toJson()
  };
}

class Data {
  final int? userId;
  final String? companyName;
  final String? website;
  final String? field;
  final String? workPhone;
  final String? mobileNo;
  final String? email;
  final String? city;
  final String? province;
  final String? country;
  final String? postalCode;
  final String? address;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  Data({
    this.userId,
    this.companyName,
    this.website,
    this.field,
    this.workPhone,
    this.mobileNo,
    this.email,
    this.city,
    this.province,
    this.country,
    this.postalCode,
    this.address,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Data.fromJson(Map<String, dynamic> json)
    : userId = json['user_id'] as int?,
      companyName = json['company_name'] as String?,
      website = json['website'] as String?,
      field = json['field'] as String?,
      workPhone = json['work_phone'] as String?,
      mobileNo = json['mobile_no'] as String?,
      email = json['email'] as String?,
      city = json['city'] as String?,
      province = json['province'] as String?,
      country = json['country'] as String?,
      postalCode = json['postal_code'] as String?,
      address = json['address'] as String?,
      updatedAt = json['updated_at'] as String?,
      createdAt = json['created_at'] as String?,
      id = json['id'] as int?;

  Map<String, dynamic> toJson() => {
    'user_id' : userId,
    'company_name' : companyName,
    'website' : website,
    'field' : field,
    'work_phone' : workPhone,
    'mobile_no' : mobileNo,
    'email' : email,
    'city' : city,
    'province' : province,
    'country' : country,
    'postal_code' : postalCode,
    'address' : address,
    'updated_at' : updatedAt,
    'created_at' : createdAt,
    'id' : id
  };
}