class ExpoBadgeListModal {
  final int? code;
  final String? message;
  final Data? data;

  ExpoBadgeListModal({
    this.code,
    this.message,
    this.data,
  });

  ExpoBadgeListModal.fromJson(Map<String, dynamic> json)
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
  final List<Top>? top;
  final List<NearBy>? nearBy;
  final List<Ongoing>? ongoing;
  final List<Upcoming>? upcoming;

  Data({
    this.top,
    this.nearBy,
    this.ongoing,
    this.upcoming,
  });

  Data.fromJson(Map<String, dynamic> json)
    : top = (json['top'] as List?)?.map((dynamic e) => Top.fromJson(e as Map<String,dynamic>)).toList(),
      nearBy = (json['near_by'] as List?)?.map((dynamic e) => NearBy.fromJson(e as Map<String,dynamic>)).toList(),
      ongoing = (json['ongoing'] as List?)?.map((dynamic e) => Ongoing.fromJson(e as Map<String,dynamic>)).toList(),
      upcoming = (json['upcoming'] as List?)?.map((dynamic e) => Upcoming.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'top' : top?.map((e) => e.toJson()).toList(),
    'near_by' : nearBy?.map((e) => e.toJson()).toList(),
    'ongoing' : ongoing?.map((e) => e.toJson()).toList(),
    'upcoming' : upcoming?.map((e) => e.toJson()).toList()
  };
}

class Top {
  final int? id;
  final String? userId;
  final String? badgeName;
  final String? badgeType;
  final String? description;
  final String? location;
  final String? lat;
  final String? lng;
  final String? dateTime;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? image;
  final User? user;
  final List<dynamic>? categories;
  final List<dynamic>? participants;

  Top({
    this.id,
    this.userId,
    this.badgeName,
    this.badgeType,
    this.description,
    this.location,
    this.lat,
    this.lng,
    this.dateTime,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.user,
    this.categories,
    this.participants,
  });

  Top.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as String?,
      badgeName = json['badge_name'] as String?,
      badgeType = json['badge_type'] as String?,
      description = json['description'] as String?,
      location = json['location'] as String?,
      lat = json['lat'] as String?,
      lng = json['lng'] as String?,
      dateTime = json['date_time'] as String?,
      status = json['status'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      image = json['image'] as String?,
      user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null,
      categories = json['categories'] as List?,
      participants = json['participants'] as List?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'badge_name' : badgeName,
    'badge_type' : badgeType,
    'description' : description,
    'location' : location,
    'lat' : lat,
    'lng' : lng,
    'date_time' : dateTime,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'image' : image,
    'user' : user?.toJson(),
    'categories' : categories,
    'participants' : participants
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
      profileImage = json['profileImage'] as String?;

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
    'profileImage' : profileImage
  };
}

class NearBy {
  final int? id;
  final String? userId;
  final String? badgeName;
  final String? badgeType;
  final String? description;
  final String? location;
  final String? lat;
  final String? lng;
  final String? dateTime;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? image;
  final User? user;
  final List<dynamic>? categories;
  final List<dynamic>? participants;

  NearBy({
    this.id,
    this.userId,
    this.badgeName,
    this.badgeType,
    this.description,
    this.location,
    this.lat,
    this.lng,
    this.dateTime,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.user,
    this.categories,
    this.participants,
  });

  NearBy.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as String?,
      badgeName = json['badge_name'] as String?,
      badgeType = json['badge_type'] as String?,
      description = json['description'] as String?,
      location = json['location'] as String?,
      lat = json['lat'] as String?,
      lng = json['lng'] as String?,
      dateTime = json['date_time'] as String?,
      status = json['status'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      image = json['image'] as String?,
      user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null,
      categories = json['categories'] as List?,
      participants = json['participants'] as List?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'badge_name' : badgeName,
    'badge_type' : badgeType,
    'description' : description,
    'location' : location,
    'lat' : lat,
    'lng' : lng,
    'date_time' : dateTime,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'image' : image,
    'user' : user?.toJson(),
    'categories' : categories,
    'participants' : participants
  };
}

class NearByUser {
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

  NearByUser({
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
  });

  NearByUser.fromJson(Map<String, dynamic> json)
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
      profileImage = json['profileImage'] as String?;

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
    'profileImage' : profileImage
  };
}

class Ongoing {
  final int? id;
  final String? userId;
  final String? badgeName;
  final String? badgeType;
  final String? description;
  final String? location;
  final String? lat;
  final String? lng;
  final String? dateTime;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? image;
  final User? user;
  final List<dynamic>? categories;
  final List<dynamic>? participants;

  Ongoing({
    this.id,
    this.userId,
    this.badgeName,
    this.badgeType,
    this.description,
    this.location,
    this.lat,
    this.lng,
    this.dateTime,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.user,
    this.categories,
    this.participants,
  });

  Ongoing.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as String?,
      badgeName = json['badge_name'] as String?,
      badgeType = json['badge_type'] as String?,
      description = json['description'] as String?,
      location = json['location'] as String?,
      lat = json['lat'] as String?,
      lng = json['lng'] as String?,
      dateTime = json['date_time'] as String?,
      status = json['status'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      image = json['image'] as String?,
      user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null,
      categories = json['categories'] as List?,
      participants = json['participants'] as List?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'badge_name' : badgeName,
    'badge_type' : badgeType,
    'description' : description,
    'location' : location,
    'lat' : lat,
    'lng' : lng,
    'date_time' : dateTime,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'image' : image,
    'user' : user?.toJson(),
    'categories' : categories,
    'participants' : participants
  };
}

class OngoingUser {
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

  OngoingUser({
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
  });

  OngoingUser.fromJson(Map<String, dynamic> json)
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
      profileImage = json['profileImage'] as String?;

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
    'profileImage' : profileImage
  };
}

class Upcoming {
  final int? id;
  final String? userId;
  final String? badgeName;
  final String? badgeType;
  final String? description;
  final String? location;
  final String? lat;
  final String? lng;
  final String? dateTime;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? image;
  final User? user;
  final List<dynamic>? categories;
  final List<dynamic>? participants;

  Upcoming({
    this.id,
    this.userId,
    this.badgeName,
    this.badgeType,
    this.description,
    this.location,
    this.lat,
    this.lng,
    this.dateTime,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.user,
    this.categories,
    this.participants,
  });

  Upcoming.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as String?,
      badgeName = json['badge_name'] as String?,
      badgeType = json['badge_type'] as String?,
      description = json['description'] as String?,
      location = json['location'] as String?,
      lat = json['lat'] as String?,
      lng = json['lng'] as String?,
      dateTime = json['date_time'] as String?,
      status = json['status'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      image = json['image'] as String?,
      user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null,
      categories = json['categories'] as List?,
      participants = json['participants'] as List?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'badge_name' : badgeName,
    'badge_type' : badgeType,
    'description' : description,
    'location' : location,
    'lat' : lat,
    'lng' : lng,
    'date_time' : dateTime,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'image' : image,
    'user' : user?.toJson(),
    'categories' : categories,
    'participants' : participants
  };
}

class UpcomingUser {
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

  UpcomingUser({
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
  });

  UpcomingUser.fromJson(Map<String, dynamic> json)
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
      profileImage = json['profileImage'] as String?;

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
    'profileImage' : profileImage
  };
}