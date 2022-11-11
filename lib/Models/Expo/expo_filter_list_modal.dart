
class ExpoFilterListModal {
  final int? code;
  final String? message;
  final ExpoListType? expoListType;

  ExpoFilterListModal({
    this.code,
    this.message,
    this.expoListType,
  });

  ExpoFilterListModal.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      expoListType = (json['data'] as Map<String,dynamic>?) != null ? ExpoListType.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : expoListType?.toJson()
  };
}

class ExpoListType {
  final List<ListData>? listData;

  ExpoListType({
    this.listData,
  });

  ExpoListType.fromJson(Map<String, dynamic> json)
    : listData = (json['list'] as List?)?.map((dynamic e) => ListData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'list' : listData?.map((e) => e.toJson()).toList()
  };
}

class ListData {
  final int? id;
  final int? userId;
  final String? badgeName;
  final String? badgeType;
  final String? description;
  final String? location;
  final String? lat;
  final String? lng;
  final String? startDateTime;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final String? country;
  final String? city;
  final String? endDateTime;
  final String? image;
  final User? user;
  final List<Categories>? categories;
  final List<Participants>? participants;

  ListData({
    this.id,
    this.userId,
    this.badgeName,
    this.badgeType,
    this.description,
    this.location,
    this.lat,
    this.lng,
    this.startDateTime,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.country,
    this.city,
    this.endDateTime,
    this.image,
    this.user,
    this.categories,
    this.participants,
  });

  ListData.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as int?,
      badgeName = json['badge_name'] as String?,
      badgeType = json['badge_type'] as String?,
      description = json['description'] as String?,
      location = json['location'] as String?,
      lat = json['lat'] as String?,
      lng = json['lng'] as String?,
      startDateTime = json['start_date_time'] as String?,
      status = json['status'] as int?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      country = json['country'] as String?,
      city = json['city'] as String?,
      endDateTime = json['end_date_time'] as String?,
      image = json['image'] as String?,
      user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null,
      categories = (json['categories'] as List?)?.map((dynamic e) => Categories.fromJson(e as Map<String,dynamic>)).toList(),
      participants = (json['participants'] as List?)?.map((dynamic e) => Participants.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'badge_name' : badgeName,
    'badge_type' : badgeType,
    'description' : description,
    'location' : location,
    'lat' : lat,
    'lng' : lng,
    'start_date_time' : startDateTime,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'country' : country,
    'city' : city,
    'end_date_time' : endDateTime,
    'image' : image,
    'user' : user?.toJson(),
    'categories' : categories?.map((e) => e.toJson()).toList(),
    'participants' : participants?.map((e) => e.toJson()).toList()
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
  final dynamic jobTitle;
  final dynamic website;
  final dynamic companyName;
  final dynamic companyField;
  final dynamic about;
  final dynamic workTel;
  final dynamic mobileTel;
  final dynamic city;
  final dynamic state;
  final dynamic country;
  final dynamic postalCode;
  final dynamic address;
  final String? createdAt;
  final String? updatedAt;
  final String? image;
  final String? card;
  final String? logo;
  final String? profileImage;
  final double? userRating;
  final String? profileAbout;

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
      jobTitle = json['job_title'],
      website = json['website'],
      companyName = json['company_name'],
      companyField = json['company_field'],
      about = json['about'],
      workTel = json['work_tel'],
      mobileTel = json['mobile_tel'],
      city = json['city'],
      state = json['state'],
      country = json['country'],
      postalCode = json['postal_code'],
      address = json['address'],
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      image = json['image'] as String?,
      card = json['card'] as String?,
      logo = json['logo'] as String?,
      profileImage = json['profileImage'] as String?,
      userRating = json['user_rating'] as double?,
      profileAbout = json['profile_about'] as String?;

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
    'profile_about' : profileAbout
  };
}

class Categories {
  final int? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? status;
  final int? createdBy;
  final int? updatedBy;
  final String? createdAt;
  final String? updatedAt;
  final String? image;
  final Pivot? pivot;

  Categories({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.pivot,
  });

  Categories.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      title = json['title'] as String?,
      slug = json['slug'] as String?,
      description = json['description'] as String?,
      status = json['status'] as int?,
      createdBy = json['created_by'] as int?,
      updatedBy = json['updated_by'] as int?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      image = json['image'] as String?,
      pivot = (json['pivot'] as Map<String,dynamic>?) != null ? Pivot.fromJson(json['pivot'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'slug' : slug,
    'description' : description,
    'status' : status,
    'created_by' : createdBy,
    'updated_by' : updatedBy,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'image' : image,
    'pivot' : pivot?.toJson()
  };
}

class Pivot {
  final int? expobadgeId;
  final int? categoryId;

  Pivot({
    this.expobadgeId,
    this.categoryId,
  });

  Pivot.fromJson(Map<String, dynamic> json)
    : expobadgeId = json['expobadge_id'] as int?,
      categoryId = json['category_id'] as int?;

  Map<String, dynamic> toJson() => {
    'expobadge_id' : expobadgeId,
    'category_id' : categoryId
  };
}

class Participants {
  final int? id;
  final String? ownerId;
  final String? title;
  final String? webUrl;
  final String? position;
  final int? businessType;
  final int? industryId;
  final int? empNoId;
  final int? branchId;
  final int? headquaterId;
  final dynamic workTel;
  final dynamic mobileTel;
  final dynamic city;
  final dynamic state;
  final dynamic country;
  final dynamic postalCode;
  final dynamic address;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? image;
  final Pivot? pivot;

  Participants({
    this.id,
    this.ownerId,
    this.title,
    this.webUrl,
    this.position,
    this.businessType,
    this.industryId,
    this.empNoId,
    this.branchId,
    this.headquaterId,
    this.workTel,
    this.mobileTel,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.address,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.pivot,
  });

  Participants.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      ownerId = json['owner_id'] as String?,
      title = json['title'] as String?,
      webUrl = json['web_url'] as String?,
      position = json['position'] as String?,
      businessType = json['business_type'] as int?,
      industryId = json['industry_id'] as int?,
      empNoId = json['emp_no_id'] as int?,
      branchId = json['branch_id'] as int?,
      headquaterId = json['headquater_id'] as int?,
      workTel = json['work_tel'],
      mobileTel = json['mobile_tel'],
      city = json['city'],
      state = json['state'],
      country = json['country'],
      postalCode = json['postal_code'],
      address = json['address'],
      status = json['status'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      image = json['image'] as String?,
      pivot = (json['pivot'] as Map<String,dynamic>?) != null ? Pivot.fromJson(json['pivot'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'owner_id' : ownerId,
    'title' : title,
    'web_url' : webUrl,
    'position' : position,
    'business_type' : businessType,
    'industry_id' : industryId,
    'emp_no_id' : empNoId,
    'branch_id' : branchId,
    'headquater_id' : headquaterId,
    'work_tel' : workTel,
    'mobile_tel' : mobileTel,
    'city' : city,
    'state' : state,
    'country' : country,
    'postal_code' : postalCode,
    'address' : address,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'image' : image,
    'pivot' : pivot?.toJson()
  };
}

class ListPivot {
  final int? expobadgeId;
  final int? participantId;

  ListPivot({
    this.expobadgeId,
    this.participantId,
  });

  ListPivot.fromJson(Map<String, dynamic> json)
    : expobadgeId = json['expobadge_id'] as int?,
      participantId = json['participant_id'] as int?;

  Map<String, dynamic> toJson() => {
    'expobadge_id' : expobadgeId,
    'participant_id' : participantId
  };
}