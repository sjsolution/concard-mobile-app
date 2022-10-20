class SingleCardDetailModal {
  final int? code;
  final String? message;
  final SingleCardData? singleCardData;

  SingleCardDetailModal({
    this.code,
    this.message,
    this.singleCardData,
  });

  SingleCardDetailModal.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      singleCardData = (json['data'] as Map<String,dynamic>?) != null ? SingleCardData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : singleCardData?.toJson()
  };
}

class SingleCardData {
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
  final dynamic username;
  final dynamic meetingDateTime;
  final String? jobTitle;
  final String? location;
  final String? createdAt;
  final String? updatedAt;
  final List<SocialLinks>? socialLinks;
  final List<ProductSevices>? productSevices;
  final Notes? notes;
  final bool? isFavourite;
  final bool? isSaved;
  final SingleCardUser? singleCardUser;

  SingleCardData({
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
    this.socialLinks,
    this.productSevices,
    this.notes,
    this.isFavourite,
    this.isSaved,
    this.singleCardUser,
  });

  SingleCardData.fromJson(Map<String, dynamic> json)
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
      username = json['username'],
      meetingDateTime = json['meeting_date_time'],
      jobTitle = json['job_title'] as String?,
      location = json['location'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      socialLinks = (json['social_links'] as List?)?.map((dynamic e) => SocialLinks.fromJson(e as Map<String,dynamic>)).toList(),
      productSevices = (json['product_sevices'] as List?)?.map((dynamic e) => ProductSevices.fromJson(e as Map<String,dynamic>)).toList(),
      notes = (json['notes'] as Map<String,dynamic>?) != null ? Notes.fromJson(json['notes'] as Map<String,dynamic>) : null,
      isFavourite = json['is_favourite'] as bool?,
      isSaved = json['is_saved'] as bool?,
      singleCardUser = (json['user'] as Map<String,dynamic>?) != null ? SingleCardUser.fromJson(json['user'] as Map<String,dynamic>) : null;

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
    'updated_at' : updatedAt,
    'social_links' : socialLinks?.map((e) => e.toJson()).toList(),
    'product_sevices' : productSevices?.map((e) => e.toJson()).toList(),
    'notes' : notes?.toJson(),
    'is_favourite' : isFavourite,
    'is_saved' : isSaved,
    'user' : singleCardUser?.toJson()
  };
}

class SocialLinks {
  final int? id;
  final String? userId;
  final String? title;
  final String? url;
  final String? createdAt;
  final String? updatedAt;
  final String? image;

  SocialLinks({
    this.id,
    this.userId,
    this.title,
    this.url,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  SocialLinks.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as String?,
      title = json['title'] as String?,
      url = json['url'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      image = json['image'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'title' : title,
    'url' : url,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'image' : image
  };
}

class ProductSevices {
  final int? id;
  final String? userId;
  final String? name;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  ProductSevices({
    this.id,
    this.userId,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  ProductSevices.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as String?,
      name = json['name'] as String?,
      status = json['status'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'name' : name,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class Notes {
  final int? id;
  final String? parentId;
  final String? parentType;
  final String? userId;
  final String? text;
  final String? createdAt;
  final String? updatedAt;

  Notes({
    this.id,
    this.parentId,
    this.parentType,
    this.userId,
    this.text,
    this.createdAt,
    this.updatedAt,
  });

  Notes.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      parentId = json['parent_id'] as String?,
      parentType = json['parent_type'] as String?,
      userId = json['user_id'] as String?,
      text = json['text'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'parent_id' : parentId,
    'parent_type' : parentType,
    'user_id' : userId,
    'text' : text,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class SingleCardUser {
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

  SingleCardUser({
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

  SingleCardUser.fromJson(Map<String, dynamic> json)
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