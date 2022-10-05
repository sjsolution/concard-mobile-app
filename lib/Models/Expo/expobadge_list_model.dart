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
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'code': code, 'message': message, 'data': data?.toJson()};
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
      : top = (json['top'] as List?)
            ?.map((dynamic e) => Top.fromJson(e as Map<String, dynamic>))
            .toList(),
        nearBy = (json['near_by'] as List?)
            ?.map((dynamic e) => NearBy.fromJson(e as Map<String, dynamic>))
            .toList(),
        ongoing = (json['ongoing'] as List?)
            ?.map((dynamic e) => Ongoing.fromJson(e as Map<String, dynamic>))
            .toList(),
        upcoming = (json['upcoming'] as List?)
            ?.map((dynamic e) => Upcoming.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'top': top?.map((e) => e.toJson()).toList(),
        'near_by': nearBy?.map((e) => e.toJson()).toList(),
        'ongoing': ongoing?.map((e) => e.toJson()).toList(),
        'upcoming': upcoming?.map((e) => e.toJson()).toList()
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
  final ExpoListUser? user;
  final List<ExpoListCategories>? categories;
  final List<ExpoListParticipants>? participants;

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
        user = (json['user'] as Map<String, dynamic>?) != null
            ? ExpoListUser.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        categories = (json['categories'] as List?)
            ?.map((dynamic e) =>
                ExpoListCategories.fromJson(e as Map<String, dynamic>))
            .toList(),
        participants = (json['participants'] as List?)
            ?.map((dynamic e) =>
                ExpoListParticipants.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'badge_name': badgeName,
        'badge_type': badgeType,
        'description': description,
        'location': location,
        'lat': lat,
        'lng': lng,
        'date_time': dateTime,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image,
        'user': user?.toJson(),
        'categories': categories,
        'participants': participants
      };
}

class ExpoListUser {
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

  ExpoListUser({
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

  ExpoListUser.fromJson(Map<String, dynamic> json)
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
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'mobile_number': mobileNumber,
        'email': email,
        'user_type': userType,
        'email_verified_at': emailVerifiedAt,
        'job_title': jobTitle,
        'website': website,
        'company_name': companyName,
        'company_field': companyField,
        'about': about,
        'work_tel': workTel,
        'mobile_tel': mobileTel,
        'city': city,
        'state': state,
        'country': country,
        'postal_code': postalCode,
        'address': address,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image,
        'card': card,
        'logo': logo,
        'profileImage': profileImage
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
  final ExpoListUser? user;
  final List<ExpoListCategories>? categories;
  final List<ExpoListParticipants>? participants;

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
        user = (json['user'] as Map<String, dynamic>?) != null
            ? ExpoListUser.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        categories = (json['categories'] as List?)
            ?.map((dynamic e) =>
                ExpoListCategories.fromJson(e as Map<String, dynamic>))
            .toList(),
        participants = (json['participants'] as List?)
            ?.map((dynamic e) =>
                ExpoListParticipants.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'badge_name': badgeName,
        'badge_type': badgeType,
        'description': description,
        'location': location,
        'lat': lat,
        'lng': lng,
        'date_time': dateTime,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image,
        'user': user?.toJson(),
        'categories': categories,
        'participants': participants
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
  final ExpoListUser? user;
  final List<ExpoListCategories>? categories;
  final List<ExpoListParticipants>? participants;

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
        user = (json['user'] as Map<String, dynamic>?) != null
            ? ExpoListUser.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        categories = (json['categories'] as List?)
            ?.map((dynamic e) =>
                ExpoListCategories.fromJson(e as Map<String, dynamic>))
            .toList(),
        participants = (json['participants'] as List?)
            ?.map((dynamic e) =>
                ExpoListParticipants.fromJson(e as Map<String, dynamic>))
            .toList();
  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'badge_name': badgeName,
        'badge_type': badgeType,
        'description': description,
        'location': location,
        'lat': lat,
        'lng': lng,
        'date_time': dateTime,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image,
        'user': user?.toJson(),
        'categories': categories,
        'participants': participants
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
  final ExpoListUser? user;
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
        user = (json['user'] as Map<String, dynamic>?) != null
            ? ExpoListUser.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        categories = json['categories'] as List?,
        participants = json['participants'] as List?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'badge_name': badgeName,
        'badge_type': badgeType,
        'description': description,
        'location': location,
        'lat': lat,
        'lng': lng,
        'date_time': dateTime,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image,
        'user': user?.toJson(),
        'categories': categories,
        'participants': participants
      };
}

class ExpoListCategories {
  final int? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? status;
  final String? createdBy;
  final String? updatedBy;
  final String? createdAt;
  final String? updatedAt;
  final String? image;
  final ExpoListPivotCate? pivot;

  ExpoListCategories({
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

  ExpoListCategories.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        slug = json['slug'] as String?,
        description = json['description'] as String?,
        status = json['status'] as String?,
        createdBy = json['created_by'] as String?,
        updatedBy = json['updated_by'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        image = json['image'] as String?,
        pivot = (json['pivot'] as Map<String, dynamic>?) != null
            ? ExpoListPivotCate.fromJson(json['pivot'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'slug': slug,
        'description': description,
        'status': status,
        'created_by': createdBy,
        'updated_by': updatedBy,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image,
        'pivot': pivot?.toJson()
      };
}

class ExpoListPivotCate {
  final String? expobadgeId;
  final String? categoryId;

  ExpoListPivotCate({
    this.expobadgeId,
    this.categoryId,
  });

  ExpoListPivotCate.fromJson(Map<String, dynamic> json)
      : expobadgeId = json['expobadge_id'] as String?,
        categoryId = json['category_id'] as String?;

  Map<String, dynamic> toJson() =>
      {'expobadge_id': expobadgeId, 'category_id': categoryId};
}

class ExpoListParticipants {
  final int? id;
  final String? ownerId;
  final String? title;
  final String? webUrl;
  final String? position;
  final String? businessType;
  final String? industryId;
  final String? empNoId;
  final String? branchId;
  final String? headquaterId;
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
  final ExpoListPivotPartici? pivot;

  ExpoListParticipants({
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

  ExpoListParticipants.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        ownerId = json['owner_id'] as String?,
        title = json['title'] as String?,
        webUrl = json['web_url'] as String?,
        position = json['position'] as String?,
        businessType = json['business_type'] as String?,
        industryId = json['industry_id'] as String?,
        empNoId = json['emp_no_id'] as String?,
        branchId = json['branch_id'] as String?,
        headquaterId = json['headquater_id'] as String?,
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
        pivot = (json['pivot'] as Map<String, dynamic>?) != null
            ? ExpoListPivotPartici.fromJson(
                json['pivot'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'owner_id': ownerId,
        'title': title,
        'web_url': webUrl,
        'position': position,
        'business_type': businessType,
        'industry_id': industryId,
        'emp_no_id': empNoId,
        'branch_id': branchId,
        'headquater_id': headquaterId,
        'work_tel': workTel,
        'mobile_tel': mobileTel,
        'city': city,
        'state': state,
        'country': country,
        'postal_code': postalCode,
        'address': address,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image,
        'pivot': pivot?.toJson()
      };
}

class ExpoListPivotPartici {
  final String? expobadgeId;
  final String? participantId;

  ExpoListPivotPartici({
    this.expobadgeId,
    this.participantId,
  });

  ExpoListPivotPartici.fromJson(Map<String, dynamic> json)
      : expobadgeId = json['expobadge_id'] as String?,
        participantId = json['participant_id'] as String?;

  Map<String, dynamic> toJson() =>
      {'expobadge_id': expobadgeId, 'participant_id': participantId};
}
