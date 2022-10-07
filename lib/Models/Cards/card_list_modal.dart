class CardListModal {
  final int? code;
  final String? message;
  final List<CardListData>? cardListData;

  CardListModal({
    this.code,
    this.message,
    this.cardListData,
  });

  CardListModal.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      cardListData = (json['data'] as List?)?.map((dynamic e) => CardListData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : cardListData?.map((e) => e.toJson()).toList()
  };
}

class CardListData {
  final int? id;
  final String? userId;
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
  final String? birthDate;
  final String? username;
  final String? meetingDateTime;
  final dynamic jobTitle;
  final String? location;
  final String? createdAt;
  final String? updatedAt;

  CardListData({
    this.id,
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
    this.birthDate,
    this.username,
    this.meetingDateTime,
    this.jobTitle,
    this.location,
    this.createdAt,
    this.updatedAt,
  });

  CardListData.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as String?,
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
      birthDate = json['birth_date'] as String?,
      username = json['username'] as String?,
      meetingDateTime = json['meeting_date_time'] as String?,
      jobTitle = json['job_title'],
      location = json['location'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
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
    'birth_date' : birthDate,
    'username' : username,
    'meeting_date_time' : meetingDateTime,
    'job_title' : jobTitle,
    'location' : location,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}