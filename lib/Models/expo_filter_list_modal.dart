class ExpoFilterListModal {
  int? code;
  String? message;
  Data? data;

  ExpoFilterListModal({this.code, this.message, this.data});

  ExpoFilterListModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<ListData>? list;

  Data({this.list});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ListData>[];
      json['list'].forEach((v) {
        list!.add( ListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListData {
  int? id;
  String? userId;
  String? badgeName;
  String? badgeType;
  String? description;
  dynamic location;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? image;
  User? user;

  ListData(
      {this.id,
      this.userId,
      this.badgeName,
      this.badgeType,
      this.description,
      this.location,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.user});

  ListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    badgeName = json['badge_name'];
    badgeType = json['badge_type'];
    description = json['description'];
    location = json['location'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['badge_name'] = badgeName;
    data['badge_type'] = badgeType;
    data['description'] = description;
    data['location'] = location;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image'] = image;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;
  String? userType;
  dynamic emailVerifiedAt;
  dynamic jobTitle;
  String? website;
  String? companyName;
  String? companyField;
  String? about;
  String? workTel;
  dynamic mobileTel;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  String? address;
  String? createdAt;
  String? updatedAt;
  String? image;
  String? card;
  String? logo;
  String? profileImage;

  User(
      {this.id,
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
      this.profileImage});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    userType = json['user_type'];
    emailVerifiedAt = json['email_verified_at'];
    jobTitle = json['job_title'];
    website = json['website'];
    companyName = json['company_name'];
    companyField = json['company_field'];
    about = json['about'];
    workTel = json['work_tel'];
    mobileTel = json['mobile_tel'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postalCode = json['postal_code'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    card = json['card'];
    logo = json['logo'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile_number'] = mobileNumber;
    data['email'] = email;
    data['user_type'] = userType;
    data['email_verified_at'] = emailVerifiedAt;
    data['job_title'] = jobTitle;
    data['website'] = website;
    data['company_name'] = companyName;
    data['company_field'] = companyField;
    data['about'] = about;
    data['work_tel'] = workTel;
    data['mobile_tel'] = mobileTel;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['postal_code'] = postalCode;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image'] = image;
    data['card'] = card;
    data['logo'] = logo;
    data['profileImage'] = profileImage;
    return data;
  }
}
