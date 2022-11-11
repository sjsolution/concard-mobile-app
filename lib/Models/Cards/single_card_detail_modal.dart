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
        singleCardData = (json['data'] as Map<String, dynamic>?) != null ? SingleCardData.fromJson(json['data'] as Map<String, dynamic>) : null;

  Map<String, dynamic> toJson() => {'code': code, 'message': message, 'data': singleCardData?.toJson()};
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
        userId = json['user_id'].toString(),
        companyName = json['company_name'].toString(),
        website = json['website'].toString(),
        field = json['field'].toString(),
        workPhone = json['work_phone'].toString(),
        mobileNo = json['mobile_no'].toString(),
        email = json['email'].toString(),
        city = json['city'].toString(),
        province = json['province'].toString(),
        country = json['country'].toString(),
        postalCode = json['postal_code'].toString(),
        address = json['address'] as String?,
        birthDate = json['birth_date'].toString(),
        username = json['username'],
        meetingDateTime = json['meeting_date_time'],
        jobTitle = json['job_title'] as String?,
        location = json['location'] as String?,
        createdAt = json['created_at'].toString(),
        updatedAt = json['updated_at'].toString(),
        socialLinks = (json['social_links'] as List?)?.map((dynamic e) => SocialLinks.fromJson(e as Map<String, dynamic>)).toList(),
        productSevices = (json['product_sevices'] as List?)?.map((dynamic e) => ProductSevices.fromJson(e as Map<String, dynamic>)).toList(),
        notes = (json['notes'] as Map<String, dynamic>?) != null ? Notes.fromJson(json['notes'] as Map<String, dynamic>) : null,
        isFavourite = json['is_favourite'] as bool?,
        isSaved = json['is_saved'] as bool?,
        singleCardUser = (json['user'] as Map<String, dynamic>?) != null ? SingleCardUser.fromJson(json['user'] as Map<String, dynamic>) : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'company_name': companyName,
        'website': website,
        'field': field,
        'work_phone': workPhone,
        'mobile_no': mobileNo,
        'email': email,
        'city': city,
        'province': province,
        'country': country,
        'postal_code': postalCode,
        'address': address,
        'birth_date': birthDate,
        'username': username,
        'meeting_date_time': meetingDateTime,
        'job_title': jobTitle,
        'location': location,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'social_links': socialLinks?.map((e) => e.toJson()).toList(),
        'product_sevices': productSevices?.map((e) => e.toJson()).toList(),
        'notes': notes?.toJson(),
        'is_favourite': isFavourite,
        'is_saved': isSaved,
        'user': singleCardUser?.toJson()
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
        userId = json['user_id'].toString(),
        title = json['title'].toString(),
        url = json['url'].toString(),
        createdAt = json['created_at'].toString(),
        updatedAt = json['updated_at'].toString(),
        image = json['image'].toString();

  Map<String, dynamic> toJson() =>
      {'id': id, 'user_id': userId, 'title': title, 'url': url, 'created_at': createdAt, 'updated_at': updatedAt, 'image': image};
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
        userId = json['user_id'].toString(),
        name = json['name'].toString(),
        status = json['status'].toString(),
        createdAt = json['created_at'].toString(),
        updatedAt = json['updated_at'].toString();

  Map<String, dynamic> toJson() => {'id': id, 'user_id': userId, 'name': name, 'status': status, 'created_at': createdAt, 'updated_at': updatedAt};
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
        parentId = json['parent_id'].toString(),
        parentType = json['parent_type'].toString(),
        userId = json['user_id'].toString(),
        text = json['text'].toString(),
        createdAt = json['created_at'].toString(),
        updatedAt = json['updated_at'].toString();

  Map<String, dynamic> toJson() =>
      {'id': id, 'parent_id': parentId, 'parent_type': parentType, 'user_id': userId, 'text': text, 'created_at': createdAt, 'updated_at': updatedAt};
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
        firstName = json['first_name'].toString(),
        lastName = json['last_name'].toString(),
        mobileNumber = json['mobile_number'].toString(),
        email = json['email'].toString(),
        userType = json['user_type'].toString(),
        emailVerifiedAt = json['email_verified_at'],
        jobTitle = json['job_title'].toString(),
        website = json['website'].toString(),
        companyName = json['company_name'].toString(),
        companyField = json['company_field'].toString(),
        about = json['about'].toString(),
        workTel = json['work_tel'].toString(),
        mobileTel = json['mobile_tel'].toString(),
        city = json['city'].toString(),
        state = json['state'].toString(),
        country = json['country'].toString(),
        postalCode = json['postal_code'].toString(),
        address = json['address'].toString(),
        createdAt = json['created_at'].toString(),
        updatedAt = json['updated_at'].toString(),
        image = json['image'].toString(),
        card = json['card'].toString(),
        logo = json['logo'].toString(),
        profileImage = json['profileImage'].toString(),
        userRating = json['user_rating'] as double?;

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
        'profileImage': profileImage,
        'user_rating': userRating
      };
}
