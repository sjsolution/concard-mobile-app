class RatingListModal {
  final int? code;
  final String? message;
  final List<RatingListData>? ratinListData;

  RatingListModal({
    this.code,
    this.message,
    this.ratinListData,
  });

  RatingListModal.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      ratinListData = (json['data'] as List?)?.map((dynamic e) => RatingListData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : ratinListData?.map((e) => e.toJson()).toList()
  };
}

class RatingListData {
  final int? id;
  final String? parentId;
  final String? parentType;
  final String? userId;
  final String? rate;
  final String? text;
  final String? createdAt;
  final String? updatedAt;
  final User? user;

  RatingListData({
    this.id,
    this.parentId,
    this.parentType,
    this.userId,
    this.rate,
    this.text,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  RatingListData.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      parentId = json['parent_id'] as String?,
      parentType = json['parent_type'] as String?,
      userId = json['user_id'] as String?,
      rate = json['rate'] as String?,
      text = json['text'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'parent_id' : parentId,
    'parent_type' : parentType,
    'user_id' : userId,
    'rate' : rate,
    'text' : text,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'user' : user?.toJson()
  };
}

class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? mobileNumber;
  final String? email;
  final String? userType;
  final dynamic emailVerifiedAt;
  final String? jobTitle;
  final String? website;
  final String? companyName;
  final String? companyField;
  final String? about;
  final String? workTel;
  final dynamic mobileTel;
  final String? city;
  final String? state;
  final String? country;
  final String? postalCode;
  final String? address;
  final String? createdAt;
  final String? updatedAt;
  final String? image;
  final String? card;
  final String? logo;
  final String? profileImage;
  final double? userRating;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.email,
    this.userType,
    this.emailVerifiedAt,
    this.jobTitle,
    this.website,
    this.companyName,
    this.companyField,
    this.about,
    this.workTel,
    this.mobileTel,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.card,
    this.logo,
    this.profileImage,
    this.userRating,
  });

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      firstName = json['first_name'] as String?,
      lastName = json['last_name'] as String?,
      mobileNumber = json['mobile_number'] as String?,
      email = json['email'] as String?,
      userType = json['user_type'] as String?,
      emailVerifiedAt = json['email_verified_at'],
      jobTitle = json['job_title'] as String?,
      website = json['website'] as String?,
      companyName = json['company_name'] as String?,
      companyField = json['company_field'] as String?,
      about = json['about'] as String?,
      workTel = json['work_tel'] as String?,
      mobileTel = json['mobile_tel'],
      city = json['city'] as String?,
      state = json['state'] as String?,
      country = json['country'] as String?,
      postalCode = json['postal_code'] as String?,
      address = json['address'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      image = json['image'] as String?,
      card = json['card'] as String?,
      logo = json['logo'] as String?,
      profileImage = json['profileImage'] as String?,
      userRating = json['user_rating'] as double?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'first_name' : firstName,
    'last_name' : lastName,
    'mobile_number' : mobileNumber,
    'email' : email,
    'user_type' : userType,
    'email_verified_at' : emailVerifiedAt,
    'job_title' : jobTitle,
    'website' : website,
    'company_name' : companyName,
    'company_field' : companyField,
    'about' : about,
    'work_tel' : workTel,
    'mobile_tel' : mobileTel,
    'city' : city,
    'state' : state,
    'country' : country,
    'postal_code' : postalCode,
    'address' : address,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'image' : image,
    'card' : card,
    'logo' : logo,
    'profileImage' : profileImage,
    'user_rating' : userRating
  };
}