class GroupCardsList {
  final int? code;
  final String? message;
  final List<GroupCardsListData>? groupCardsListData;

  GroupCardsList({
    this.code,
    this.message,
    this.groupCardsListData,
  });

  GroupCardsList.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      groupCardsListData = (json['data'] as List?)?.map((dynamic e) => GroupCardsListData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : groupCardsListData?.map((e) => e.toJson()).toList()
  };
}

class GroupCardsListData {
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
  final String? meetingDateTime;
  final String? jobTitle;
  final String? location;
  final String? createdAt;
  final String? updatedAt;
  final bool? isFavourite;
  final bool? isSaved;
  final Notes? notes;
  final User? user;
  final List<Emails>? emails;
  final List<Numbers>? numbers;

  GroupCardsListData({
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
    this.isFavourite,
    this.isSaved,
    this.notes,
    this.user,
    this.emails,
    this.numbers,
  });

  GroupCardsListData.fromJson(Map<String, dynamic> json)
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
      meetingDateTime = json['meeting_date_time'] as String?,
      jobTitle = json['job_title'] as String?,
      location = json['location'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      isFavourite = json['is_favourite'] as bool?,
      isSaved = json['is_saved'] as bool?,
      notes = (json['notes'] as Map<String,dynamic>?) != null ? Notes.fromJson(json['notes'] as Map<String,dynamic>) : null,
      user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null,
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
    'is_favourite' : isFavourite,
    'is_saved' : isSaved,
    'notes' : notes?.toJson(),
    'user' : user?.toJson(),
    'emails' : emails?.map((e) => e.toJson()).toList(),
    'numbers' : numbers?.map((e) => e.toJson()).toList()
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

class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? mobileNumber;
  final String? email;
  final int? userType;
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
  final ProfileAbout? profileAbout;

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
    this.profileAbout,
  });

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      firstName = json['first_name'] as String?,
      lastName = json['last_name'] as String?,
      mobileNumber = json['mobile_number'] as String?,
      email = json['email'] as String?,
      userType = json['user_type'] as int?,
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