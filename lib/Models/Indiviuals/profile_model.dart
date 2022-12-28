
import 'package:concard/Models/Cards/single_card_detail_modal.dart';

class IndividualProfileModel {
  int? code;
  String? message;
  IndividualProfileDetailData? individualProfileDetailData;

  IndividualProfileModel({this.code, this.message, this.individualProfileDetailData});

  IndividualProfileModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    individualProfileDetailData = json['data'] != null ? new IndividualProfileDetailData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.individualProfileDetailData != null) {
      data['data'] = this.individualProfileDetailData!.toJson();
    }
    return data;
  }
}

class IndividualProfileDetailData {
  SingleProfileUser? singleProfileUser;
  List<CompanyMembers>? companyMembers;
  int? reachedCardsCounts;
  int? savedCardsCounts;
  int? favouriteCardsCounts;

  IndividualProfileDetailData(
      {this.singleProfileUser,
      this.companyMembers,
      this.reachedCardsCounts,
      this.savedCardsCounts,
      this.favouriteCardsCounts});

  IndividualProfileDetailData.fromJson(Map<String, dynamic> json) {
    singleProfileUser = json['user'] != null ? new SingleProfileUser.fromJson(json['user']) : null;
    if (json['company_members'] != null) {
      companyMembers = <CompanyMembers>[];
      json['company_members'].forEach((v) {
        companyMembers!.add(new CompanyMembers.fromJson(v));
      });
    }
    reachedCardsCounts = json['reached_cards_counts'];
    savedCardsCounts = json['saved_cards_counts'];
    favouriteCardsCounts = json['favourite_cards_counts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.singleProfileUser != null) {
      data['user'] = this.singleProfileUser!.toJson();
    }
    if (this.companyMembers != null) {
      data['company_members'] =
          this.companyMembers!.map((v) => v.toJson()).toList();
    }
    data['reached_cards_counts'] = this.reachedCardsCounts;
    data['saved_cards_counts'] = this.savedCardsCounts;
    data['favourite_cards_counts'] = this.favouriteCardsCounts;
    return data;
  }
}

class SingleProfileUser {
  int? id;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;
  int? userType;
  dynamic emailVerifiedAt;
  String? jobTitle;
  String? website;
  dynamic companyName;
  dynamic companyField;
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
  String? userRating;
  ProfileAbout? profileAbout;
  List<SavedCards>? savedCards;
  List? favouriteCards;
  List? ratings;

  SingleProfileUser(
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
      this.profileImage,
      this.userRating,
      this.profileAbout,
      this.savedCards,
      this.favouriteCards,
      this.ratings});

  SingleProfileUser.fromJson(Map<String, dynamic> json) {
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
    userRating = json['user_rating'].toString();
    profileAbout = json['profile_about'] != null
        ? new ProfileAbout.fromJson(json['profile_about'])
        : null;
    if (json['saved_cards'] != null) {
      savedCards = <SavedCards>[];
      json['saved_cards'].forEach((v) {
        savedCards!.add(new SavedCards.fromJson(v));
      });
    }
    if (json['favourite_cards'] != null) {
      favouriteCards = [];
      json['favourite_cards'].forEach((v) {
        favouriteCards!.add((v));
      });
    }
    if (json['ratings'] != null) {
      ratings = [];
      json['ratings'].forEach((v) {
        ratings!.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    data['user_type'] = this.userType;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['job_title'] = this.jobTitle;
    data['website'] = this.website;
    data['company_name'] = this.companyName;
    data['company_field'] = this.companyField;
    data['about'] = this.about;
    data['work_tel'] = this.workTel;
    data['mobile_tel'] = this.mobileTel;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['postal_code'] = this.postalCode;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    data['card'] = this.card;
    data['logo'] = this.logo;
    data['profileImage'] = this.profileImage;
    data['user_rating'] = this.userRating;
    if (this.profileAbout != null) {
      data['profile_about'] = this.profileAbout!.toJson();
    }
    if (this.savedCards != null) {
      data['saved_cards'] = this.savedCards!.map((v) => v.toJson()).toList();
    }
    if (this.favouriteCards != null) {
      data['favourite_cards'] =
          this.favouriteCards!.map((v) => v.toJson()).toList();
    }
    if (this.ratings != null) {
      data['ratings'] = this.ratings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfileAbout {
  int? id;
  int? userId;
  String? text;
  String? createdAt;
  String? updatedAt;

  ProfileAbout(
      {this.id, this.userId, this.text, this.createdAt, this.updatedAt});

  ProfileAbout.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    text = json['text'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['text'] = this.text;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SavedCards {
  int? id;
  int? userId;
  String? companyName;
  String? website;
  dynamic field;
  dynamic workPhone;
  dynamic mobileNo;
  dynamic email;
  String? city;
  String? province;
  String? country;
  String? postalCode;
  String? address;
  String? birthDate;
  String? username;
  String? meetingDateTime;
  String? jobTitle;
  String? location;
  String? createdAt;
  String? updatedAt;
  bool? isFavourite;
  bool? isSaved;
  dynamic notes;
  Pivot? pivot;
  SingleProfileUser? user;
  List<Emails>? emails;
  List<Numbers>? numbers;

  SavedCards(
      {this.id,
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
      this.pivot,
      this.user,
      this.emails,
      this.numbers});

  SavedCards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    companyName = json['company_name'];
    website = json['website'];
    field = json['field'];
    workPhone = json['work_phone'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    city = json['city'];
    province = json['province'];
    country = json['country'];
    postalCode = json['postal_code'];
    address = json['address'];
    birthDate = json['birth_date'];
    username = json['username'];
    meetingDateTime = json['meeting_date_time'];
    jobTitle = json['job_title'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isFavourite = json['is_favourite'];
    isSaved = json['is_saved'];
    notes = json['notes'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    user = json['user'] != null ? new SingleProfileUser.fromJson(json['user']) : null;
    if (json['emails'] != null) {
      emails = <Emails>[];
      json['emails'].forEach((v) {
        emails!.add(new Emails.fromJson(v));
      });
    }
    if (json['numbers'] != null) {
      numbers = <Numbers>[];
      json['numbers'].forEach((v) {
        numbers!.add(new Numbers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['company_name'] = this.companyName;
    data['website'] = this.website;
    data['field'] = this.field;
    data['work_phone'] = this.workPhone;
    data['mobile_no'] = this.mobileNo;
    data['email'] = this.email;
    data['city'] = this.city;
    data['province'] = this.province;
    data['country'] = this.country;
    data['postal_code'] = this.postalCode;
    data['address'] = this.address;
    data['birth_date'] = this.birthDate;
    data['username'] = this.username;
    data['meeting_date_time'] = this.meetingDateTime;
    data['job_title'] = this.jobTitle;
    data['location'] = this.location;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_favourite'] = this.isFavourite;
    data['is_saved'] = this.isSaved;
    data['notes'] = this.notes;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.emails != null) {
      data['emails'] = this.emails!.map((v) => v.toJson()).toList();
    }
    if (this.numbers != null) {
      data['numbers'] = this.numbers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? cardId;

  Pivot({this.userId, this.cardId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    cardId = json['card_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['card_id'] = this.cardId;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;
  int? userType;
  dynamic emailVerifiedAt;
  String? jobTitle;
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
  double? userRating;
  ProfileAbout? profileAbout;

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
      this.profileImage,
      this.userRating,
      this.profileAbout});

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
    userRating = json['user_rating'];
    profileAbout = json['profile_about'] != null
        ? new ProfileAbout.fromJson(json['profile_about'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    data['user_type'] = this.userType;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['job_title'] = this.jobTitle;
    data['website'] = this.website;
    data['company_name'] = this.companyName;
    data['company_field'] = this.companyField;
    data['about'] = this.about;
    data['work_tel'] = this.workTel;
    data['mobile_tel'] = this.mobileTel;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['postal_code'] = this.postalCode;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    data['card'] = this.card;
    data['logo'] = this.logo;
    data['profileImage'] = this.profileImage;
    data['user_rating'] = this.userRating;
    if (this.profileAbout != null) {
      data['profile_about'] = this.profileAbout!.toJson();
    }
    return data;
  }
}

class Emails {
  int? id;
  int? cardId;
  String? email;
  String? createdAt;
  String? updatedAt;

  Emails({this.id, this.cardId, this.email, this.createdAt, this.updatedAt});

  Emails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cardId = json['card_id'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['card_id'] = this.cardId;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Numbers {
  int? id;
  int? cardId;
  String? type;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;

  Numbers(
      {this.id,
      this.cardId,
      this.type,
      this.phoneNumber,
      this.createdAt,
      this.updatedAt});

  Numbers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cardId = json['card_id'];
    type = json['type'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['card_id'] = this.cardId;
    data['type'] = this.type;
    data['phone_number'] = this.phoneNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}



 