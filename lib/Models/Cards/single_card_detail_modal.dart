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
  final int? userId;
  final String? companyName;
  final String? website;
  final dynamic field;
  final dynamic workPhone;
  final dynamic mobileNo;
  final dynamic email;
  final String? city;
  final String? province;
  final String? country;
  final String? postalCode;
  final String? address;
  final String? birthDate;
  final String? username;
  final dynamic meetingDateTime;
  final String? jobTitle;
  final dynamic location;
  final String? createdAt;
  final String? updatedAt;
  final List<CompanyMembers>? companyMembers;
  final List<SocialLinks>? socialLinks;
  final List<ProductSevices>? productSevices;
  final bool? isFavourite;
  final bool? isSaved;
  final Notes? notes;
  final SingleCardUser? singleCardUser;
  final List<Emails>? emails;
  final List<Numbers>? numbers;

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
    this.companyMembers,
    this.socialLinks,
    this.productSevices,
    this.isFavourite,
    this.isSaved,
    this.notes,
    this.singleCardUser,
    this.emails,
    this.numbers,
  });

  SingleCardData.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as int?,
      companyName = json['company_name'] as String?,
      website = json['website'] as String?,
      field = json['field'],
      workPhone = json['work_phone'],
      mobileNo = json['mobile_no'],
      email = json['email'],
      city = json['city'] as String?,
      province = json['province'] as String?,
      country = json['country'] as String?,
      postalCode = json['postal_code'] as String?,
      address = json['address'] as String?,
      birthDate = json['birth_date'] as String?,
      username = json['username'] as String?,
      meetingDateTime = json['meeting_date_time'],
      jobTitle = json['job_title'] as String?,
      location = json['location'],
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      companyMembers = (json['company_members'] as List?)?.map((dynamic e) => CompanyMembers.fromJson(e as Map<String,dynamic>)).toList(),
      socialLinks = (json['social_links'] as List?)?.map((dynamic e) => SocialLinks.fromJson(e as Map<String,dynamic>)).toList(),
      productSevices = (json['product_sevices'] as List?)?.map((dynamic e) => ProductSevices.fromJson(e as Map<String,dynamic>)).toList(),
      isFavourite = json['is_favourite'] as bool?,
      isSaved = json['is_saved'] as bool?,
      notes = (json['notes'] as Map<String,dynamic>?) != null ? Notes.fromJson(json['notes'] as Map<String,dynamic>) : null,
      singleCardUser = (json['user'] as Map<String,dynamic>?) != null ? SingleCardUser.fromJson(json['user'] as Map<String,dynamic>) : null,
      emails = (json['emails'] as List?)?.map((dynamic e) => Emails.fromJson(e as Map<String,dynamic>)).toList(),
      numbers = (json['numbers'] as List?)?.map((dynamic e) => Numbers.fromJson(e as Map<String,dynamic>)).toList();

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
    'company_members' : companyMembers?.map((e) => e.toJson()).toList(),
    'social_links' : socialLinks?.map((e) => e.toJson()).toList(),
    'product_sevices' : productSevices?.map((e) => e.toJson()).toList(),
    'is_favourite' : isFavourite,
    'is_saved' : isSaved,
    'notes' : notes?.toJson(),
    'user' : singleCardUser?.toJson(),
    'emails' : emails?.map((e) => e.toJson()).toList(),
    'numbers' : numbers?.map((e) => e.toJson()).toList()
  };
}

class CompanyMembers {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? mobileNumber;
  final String? email;
  final int? userType;
  final dynamic emailVerifiedAt;
  final String? jobTitle;
  final String? website;
  final dynamic companyName;
  final dynamic companyField;
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
  final String? userRating;
  final ProfileAbout? profileAbout;

  CompanyMembers({
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
    this.profileAbout,
  });

  CompanyMembers.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      firstName = json['first_name'] as String?,
      lastName = json['last_name'] as String?,
      mobileNumber = json['mobile_number'] as String?,
      email = json['email'] as String?,
      userType = json['user_type'] as int?,
      emailVerifiedAt = json['email_verified_at'],
      jobTitle = json['job_title'] as String?,
      website = json['website'] as String?,
      companyName = json['company_name'],
      companyField = json['company_field'],
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
      userRating = json['user_rating'].toString(),
      profileAbout = (json['profile_about'] as Map<String,dynamic>?) != null ? ProfileAbout.fromJson(json['profile_about'] as Map<String,dynamic>) : null;

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
    'user_rating' : userRating,
    'profile_about' : profileAbout?.toJson()
  };
}

class ProfileAbout {
  final int? id;
  final int? userId;
  final String? text;
  final String? createdAt;
  final String? updatedAt;

  ProfileAbout({
    this.id,
    this.userId,
    this.text,
    this.createdAt,
    this.updatedAt,
  });

  ProfileAbout.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as int?,
      text = json['text'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'text' : text,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class SocialLinks {
  final int? id;
  final int? userId;
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
      userId = json['user_id'] as int?,
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
  final int? userId;
  final String? name;
  final int? status;
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
      userId = json['user_id'] as int?,
      name = json['name'] as String?,
      status = json['status'] as int?,
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
  final int? parentId;
  final String? parentType;
  final int? userId;
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
      parentId = json['parent_id'] as int?,
      parentType = json['parent_type'] as String?,
      userId = json['user_id'] as int?,
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
  final int? userType;
  final dynamic emailVerifiedAt;
  final String? jobTitle;
  final String? website;
  final dynamic companyName;
  final dynamic companyField;
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
  final ProfileAbout? profileAbout;

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
    this.profileAbout,
  });

  SingleCardUser.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      firstName = json['first_name'] as String?,
      lastName = json['last_name'] as String?,
      mobileNumber = json['mobile_number'] as String?,
      email = json['email'] as String?,
      userType = json['user_type'] as int?,
      emailVerifiedAt = json['email_verified_at'],
      jobTitle = json['job_title'] as String?,
      website = json['website'] as String?,
      companyName = json['company_name'],
      companyField = json['company_field'],
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
      userRating = json['user_rating'] as double?,
      profileAbout = (json['profile_about'] as Map<String,dynamic>?) != null ? ProfileAbout.fromJson(json['profile_about'] as Map<String,dynamic>) : null;

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
    'user_rating' : userRating,
    'profile_about' : profileAbout?.toJson()
  };
}

class singleCardProfileAbout {
  final int? id;
  final int? userId;
  final String? text;
  final String? createdAt;
  final String? updatedAt;

  singleCardProfileAbout({
    this.id,
    this.userId,
    this.text,
    this.createdAt,
    this.updatedAt,
  });

  singleCardProfileAbout.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as int?,
      text = json['text'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'text' : text,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class Emails {
  final int? id;
  final int? cardId;
  final String? email;
  final String? createdAt;
  final String? updatedAt;

  Emails({
    this.id,
    this.cardId,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  Emails.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      cardId = json['card_id'] as int?,
      email = json['email'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'card_id' : cardId,
    'email' : email,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class Numbers {
  final int? id;
  final int? cardId;
  final String? type;
  final String? phoneNumber;
  final String? createdAt;
  final String? updatedAt;

  Numbers({
    this.id,
    this.cardId,
    this.type,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
  });

  Numbers.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      cardId = json['card_id'] as int?,
      type = json['type'] as String?,
      phoneNumber = json['phone_number'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'card_id' : cardId,
    'type' : type,
    'phone_number' : phoneNumber,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}