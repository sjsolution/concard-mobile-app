class CardListModal {
  final int? code;
  final String? message;
  final CardListData? cardListData;

  CardListModal({
    this.code,
    this.message,
    this.cardListData,
  });

  CardListModal.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        message = json['message'] as String?,
        cardListData = (json['data'] as Map<String, dynamic>?) != null ? CardListData.fromJson(json['data'] as Map<String, dynamic>) : null;

  Map<String, dynamic> toJson() => {'code': code, 'message': message, 'data': cardListData?.toJson()};
}

class CardListData {
  final int? allCardsCounts;
  final int? reachedCardsCounts;
  final int? savedCardsCounts;
  final int? favouriteCardsCounts;
  final List<Cards>? cards;

  CardListData({
    this.allCardsCounts,
    this.reachedCardsCounts,
    this.savedCardsCounts,
    this.favouriteCardsCounts,
    this.cards,
  });

  CardListData.fromJson(Map<String, dynamic> json)
      : allCardsCounts = json['all_cards_counts'] as int?,
        reachedCardsCounts = json['reached_cards_counts'] as int?,
        savedCardsCounts = json['saved_cards_counts'] as int?,
        favouriteCardsCounts = json['favourite_cards_counts'] as int?,
        cards = (json['cards'] as List?)?.map((dynamic e) => Cards.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'all_cards_counts': allCardsCounts,
        'reached_cards_counts': reachedCardsCounts,
        'saved_cards_counts': savedCardsCounts,
        'favourite_cards_counts': favouriteCardsCounts,
        'cards': cards?.map((e) => e.toJson()).toList()
      };
}

class Cards {
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
  final dynamic birthDate;
  final dynamic username;
  final dynamic meetingDateTime;
  final String? jobTitle;
  final dynamic location;
  final String? createdAt;
  final String? updatedAt;
  final Pivot? pivot;
  final User? user;
  bool? isFavourite;

  Cards({
    this.isFavourite = false,
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
    this.pivot,
    this.user,
  });

  Cards.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'].toString(),
        isFavourite = json['is_favourite'] as bool?,
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
        address = json['address'].toString(),
        birthDate = json['birth_date'].toString(),
        username = json['username'].toString(),
        meetingDateTime = json['meeting_date_time'].toString(),
        jobTitle = json['job_title'].toString(),
        location = json['location'],
        createdAt = json['created_at'].toString(),
        updatedAt = json['updated_at'].toString(),
        pivot = (json['pivot'] as Map<String, dynamic>?) != null ? Pivot.fromJson(json['pivot'] as Map<String, dynamic>) : null,
        user = (json['user'] as Map<String, dynamic>?) != null ? User.fromJson(json['user'] as Map<String, dynamic>) : null;


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
        'pivot': pivot?.toJson(),
        'user': user?.toJson()
      };
}

class Pivot {
  final String? userId;
  final String? cardId;

  Pivot({
    this.userId,
    this.cardId,
  });


  Pivot.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'].toString(),
        cardId = json['card_id'].toString();

  Map<String, dynamic> toJson() => {'user_id': userId, 'card_id': cardId};
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
        firstName = json['first_name'].toString(),
        lastName = json['last_name'].toString(),
        mobileNumber = json['mobile_number'].toString(),
        email = json['email'] as String?,
        userType = json['user_type'].toString(),
        emailVerifiedAt = json['email_verified_at'],
        jobTitle = json['job_title'] as String?,
        website = json['website'] as String?,
        companyName = json['company_name'] as String?,
        companyField = json['company_field'] as String?,
        about = json['about'] as String?,
        workTel = json['work_tel'].toString(),
        mobileTel = json['mobile_tel'].toString(),
        city = json['city'] as String?,
        state = json['state'] as String?,
        country = json['country'] as String?,
        postalCode = json['postal_code'].toString(),
        address = json['address'] as String?,
        createdAt = json['created_at'].toString(),
        updatedAt = json['updated_at'].toString(),
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

// ////
// /
// class CardListModal {
//   final int? code;
//   final String? message;
//   final CardListData? cardListData;

//   CardListModal({
//     this.code,
//     this.message,
//     this.cardListData,
//   });

//   CardListModal.fromJson(Map<String, dynamic> json)
//     : code = json['code'] as int?,
//       message = json['message'] as String?,
//       cardListData = (json['data'] as Map<String,dynamic>?) != null ? CardListData.fromJson(json['data'] as Map<String,dynamic>) : null;

//   Map<String, dynamic> toJson() => {
//     'code' : code,
//     'message' : message,
//     'data' : cardListData?.toJson()
//   };
// }

// class CardListData {
//   final int? allCardsCounts;
//   final int? reachedCardsCounts;
//   final int? savedCardsCounts;
//   final int? favouriteCardsCounts;
//   final List<Cards>? cards;

//   CardListData({
//     this.allCardsCounts,
//     this.reachedCardsCounts,
//     this.savedCardsCounts,
//     this.favouriteCardsCounts,
//     this.cards,
//   });

//   CardListData.fromJson(Map<String, dynamic> json)
//     : allCardsCounts = json['all_cards_counts'] as int?,
//       reachedCardsCounts = json['reached_cards_counts'] as int?,
//       savedCardsCounts = json['saved_cards_counts'] as int?,
//       favouriteCardsCounts = json['favourite_cards_counts'] as int?,
//       cards = (json['cards'] as List?)?.map((dynamic e) => Cards.fromJson(e as Map<String,dynamic>)).toList();

//   Map<String, dynamic> toJson() => {
//     'all_cards_counts' : allCardsCounts,
//     'reached_cards_counts' : reachedCardsCounts,
//     'saved_cards_counts' : savedCardsCounts,
//     'favourite_cards_counts' : favouriteCardsCounts,
//     'cards' : cards?.map((e) => e.toJson()).toList()
//   };
// }

// class Cards {
//   final int? id;
//   final String? userId;
//   final String? companyName;
//   final String? website;
//   final String? field;
//   final String? workPhone;
//   final String? mobileNo;
//   final String? email;
//   final String? city;
//   final String? province;
//   final String? country;
//   final String? postalCode;
//   final String? address;
//   final dynamic birthDate;
//   final dynamic username;
//   final dynamic meetingDateTime;
//   final String? jobTitle;
//   final dynamic location;
//   final String? createdAt;
//   final String? updatedAt;
//   final bool? isFavourite;
//   final bool? isSaved;
//   final Notes? notes;
//   final User? user;

//   Cards({
//     this.id,
//     this.userId,
//     this.companyName,
//     this.website,
//     this.field,
//     this.workPhone,
//     this.mobileNo,
//     this.email,
//     this.city,
//     this.province,
//     this.country,
//     this.postalCode,
//     this.address,
//     this.birthDate,
//     this.username,
//     this.meetingDateTime,
//     this.jobTitle,
//     this.location,
//     this.createdAt,
//     this.updatedAt,
//     this.isFavourite,
//     this.isSaved,
//     this.notes,
//     this.user,
//   });

//   Cards.fromJson(Map<String, dynamic> json)
//     : id = json['id'] as int?,
//       userId = json['user_id'] as String?,
//       companyName = json['company_name'] as String?,
//       website = json['website'] as String?,
//       field = json['field'] as String?,
//       workPhone = json['work_phone'] as String?,
//       mobileNo = json['mobile_no'] as String?,
//       email = json['email'] as String?,
//       city = json['city'] as String?,
//       province = json['province'] as String?,
//       country = json['country'] as String?,
//       postalCode = json['postal_code'] as String?,
//       address = json['address'] as String?,
//       birthDate = json['birth_date'],
//       username = json['username'],
//       meetingDateTime = json['meeting_date_time'],
//       jobTitle = json['job_title'] as String?,
//       location = json['location'],
//       createdAt = json['created_at'] as String?,
//       updatedAt = json['updated_at'] as String?,
//       isFavourite = json['is_favourite'] as bool?,
//       isSaved = json['is_saved'] as bool?,
//       notes = (json['notes'] as Map<String,dynamic>?) != null ? Notes.fromJson(json['notes'] as Map<String,dynamic>) : null,
//       user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;

//   Map<String, dynamic> toJson() => {
//     'id' : id,
//     'user_id' : userId,
//     'company_name' : companyName,
//     'website' : website,
//     'field' : field,
//     'work_phone' : workPhone,
//     'mobile_no' : mobileNo,
//     'email' : email,
//     'city' : city,
//     'province' : province,
//     'country' : country,
//     'postal_code' : postalCode,
//     'address' : address,
//     'birth_date' : birthDate,
//     'username' : username,
//     'meeting_date_time' : meetingDateTime,
//     'job_title' : jobTitle,
//     'location' : location,
//     'created_at' : createdAt,
//     'updated_at' : updatedAt,
//     'is_favourite' : isFavourite,
//     'is_saved' : isSaved,
//     'notes' : notes?.toJson(),
//     'user' : user?.toJson()
//   };
// }

// class Notes {
//   final int? id;
//   final String? parentId;
//   final String? parentType;
//   final String? userId;
//   final String? text;
//   final String? createdAt;
//   final String? updatedAt;

//   Notes({
//     this.id,
//     this.parentId,
//     this.parentType,
//     this.userId,
//     this.text,
//     this.createdAt,
//     this.updatedAt,
//   });

//   Notes.fromJson(Map<String, dynamic> json)
//     : id = json['id'] as int?,
//       parentId = json['parent_id'] as String?,
//       parentType = json['parent_type'] as String?,
//       userId = json['user_id'] as String?,
//       text = json['text'] as String?,
//       createdAt = json['created_at'] as String?,
//       updatedAt = json['updated_at'] as String?;

//   Map<String, dynamic> toJson() => {
//     'id' : id,
//     'parent_id' : parentId,
//     'parent_type' : parentType,
//     'user_id' : userId,
//     'text' : text,
//     'created_at' : createdAt,
//     'updated_at' : updatedAt
//   };
// }

// class User {
//   final int? id;
//   final String? firstName;
//   final String? lastName;
//   final String? mobileNumber;
//   final String? email;
//   final String? userType;
//   final dynamic emailVerifiedAt;
//   final String? jobTitle;
//   final String? website;
//   final String? companyName;
//   final String? companyField;
//   final String? about;
//   final String? workTel;
//   final dynamic mobileTel;
//   final String? city;
//   final String? state;
//   final String? country;
//   final String? postalCode;
//   final String? address;
//   final String? createdAt;
//   final String? updatedAt;
//   final String? image;
//   final String? card;
//   final String? logo;
//   final String? profileImage;
//   final double? userRating;

//   User({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.mobileNumber,
//     this.email,
//     this.userType,
//     this.emailVerifiedAt,
//     this.jobTitle,
//     this.website,
//     this.companyName,
//     this.companyField,
//     this.about,
//     this.workTel,
//     this.mobileTel,
//     this.city,
//     this.state,
//     this.country,
//     this.postalCode,
//     this.address,
//     this.createdAt,
//     this.updatedAt,
//     this.image,
//     this.card,
//     this.logo,
//     this.profileImage,
//     this.userRating,
//   });

//   User.fromJson(Map<String, dynamic> json)
//     : id = json['id'] as int?,
//       firstName = json['first_name'] as String?,
//       lastName = json['last_name'] as String?,
//       mobileNumber = json['mobile_number'] as String?,
//       email = json['email'] as String?,
//       userType = json['user_type'] as String?,
//       emailVerifiedAt = json['email_verified_at'],
//       jobTitle = json['job_title'] as String?,
//       website = json['website'] as String?,
//       companyName = json['company_name'] as String?,
//       companyField = json['company_field'] as String?,
//       about = json['about'] as String?,
//       workTel = json['work_tel'] as String?,
//       mobileTel = json['mobile_tel'],
//       city = json['city'] as String?,
//       state = json['state'] as String?,
//       country = json['country'] as String?,
//       postalCode = json['postal_code'] as String?,
//       address = json['address'] as String?,
//       createdAt = json['created_at'] as String?,
//       updatedAt = json['updated_at'] as String?,
//       image = json['image'] as String?,
//       card = json['card'] as String?,
//       logo = json['logo'] as String?,
//       profileImage = json['profileImage'] as String?,
//       userRating = json['user_rating'] as double?;

//   Map<String, dynamic> toJson() => {
//     'id' : id,
//     'first_name' : firstName,
//     'last_name' : lastName,
//     'mobile_number' : mobileNumber,
//     'email' : email,
//     'user_type' : userType,
//     'email_verified_at' : emailVerifiedAt,
//     'job_title' : jobTitle,
//     'website' : website,
//     'company_name' : companyName,
//     'company_field' : companyField,
//     'about' : about,
//     'work_tel' : workTel,
//     'mobile_tel' : mobileTel,
//     'city' : city,
//     'state' : state,
//     'country' : country,
//     'postal_code' : postalCode,
//     'address' : address,
//     'created_at' : createdAt,
//     'updated_at' : updatedAt,
//     'image' : image,
//     'card' : card,
//     'logo' : logo,
//     'profileImage' : profileImage,
//     'user_rating' : userRating
//   };
// }



// class CardListModal {
//   final int? code;
//   final String? message;
//   final CardListType? cardListType;

//   CardListModal({
//     this.code,
//     this.message,
//     this.cardListType,
//   });

//   CardListModal.fromJson(Map<String, dynamic> json)
//     : code = json['code'] as int?,
//       message = json['message'] as String?,
//       cardListType = (json['data'] as Map<String,dynamic>?) != null ? CardListType.fromJson(json['data'] as Map<String,dynamic>) : null;

//   Map<String, dynamic> toJson() => {
//     'code' : code,
//     'message' : message,
//     'data' : cardListType?.toJson()
//   };
// }

// class CardListType {
//   final int? allCardsCounts;
//   final int? reachedCardsCounts;
//   final int? savedCardsCounts;
//   final int? favouriteCardsCounts;
//   final List<Cards>? cards;

//   CardListType({
//     this.allCardsCounts,
//     this.reachedCardsCounts,
//     this.savedCardsCounts,
//     this.favouriteCardsCounts,
//     this.cards,
//   });

//   CardListType.fromJson(Map<String, dynamic> json)
//     : allCardsCounts = json['all_cards_counts'] as int?,
//       reachedCardsCounts = json['reached_cards_counts'] as int?,
//       savedCardsCounts = json['saved_cards_counts'] as int?,
//       favouriteCardsCounts = json['favourite_cards_counts'] as int?,
//       cards = (json['cards'] as List?)?.map((dynamic e) => Cards.fromJson(e as Map<String,dynamic>)).toList();

//   Map<String, dynamic> toJson() => {
//     'all_cards_counts' : allCardsCounts,
//     'reached_cards_counts' : reachedCardsCounts,
//     'saved_cards_counts' : savedCardsCounts,
//     'favourite_cards_counts' : favouriteCardsCounts,
//     'cards' : cards?.map((e) => e.toJson()).toList()
//   };
// }

// class Cards {
//   final int? id;
//   final String? userId;
//   final String? companyName;
//   final String? website;
//   final String? field;
//   final String? workPhone;
//   final String? mobileNo;
//   final String? email;
//   final String? city;
//   final String? province;
//   final String? country;
//   final String? postalCode;
//   final String? address;
//   final dynamic birthDate;
//   final dynamic username;
//   final dynamic meetingDateTime;
//   final String? jobTitle;
//   final dynamic location;
//   final String? createdAt;
//   final String? updatedAt;
//   final bool? isFavourite;
//   final bool? isSaved;
//   final Notes? notes;
//   final User? user;
//   final List<dynamic>? emails;
//   final List<dynamic>? numbers;

//   Cards({
//     this.id,
//     this.userId,
//     this.companyName,
//     this.website,
//     this.field,
//     this.workPhone,
//     this.mobileNo,
//     this.email,
//     this.city,
//     this.province,
//     this.country,
//     this.postalCode,
//     this.address,
//     this.birthDate,
//     this.username,
//     this.meetingDateTime,
//     this.jobTitle,
//     this.location,
//     this.createdAt,
//     this.updatedAt,
//     this.isFavourite,
//     this.isSaved,
//     this.notes,
//     this.user,
//     this.emails,
//     this.numbers,
//   });

//   Cards.fromJson(Map<String, dynamic> json)
//     : id = json['id'] as int?,
//       userId = json['user_id'].toString(),
//       companyName = json['company_name'] as String?,
//       website = json['website'] as String?,
//       field = json['field'] as String?,
//       workPhone = json['work_phone'] as String?,
//       mobileNo = json['mobile_no'] as String?,
//       email = json['email'] as String?,
//       city = json['city'] as String?,
//       province = json['province'] as String?,
//       country = json['country'] as String?,
//       postalCode = json['postal_code'] as String?,
//       address = json['address'] as String?,
//       birthDate = json['birth_date'],
//       username = json['username'],
//       meetingDateTime = json['meeting_date_time'],
//       jobTitle = json['job_title'] as String?,
//       location = json['location'],
//       createdAt = json['created_at'] as String?,
//       updatedAt = json['updated_at'] as String?,
//       isFavourite = json['is_favourite'] as bool?,
//       isSaved = json['is_saved'] as bool?,
//       notes = (json['notes'] as Map<String,dynamic>?) != null ? Notes.fromJson(json['notes'] as Map<String,dynamic>) : null,
//       user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null,
//       emails = json['emails'] as List?,
//       numbers = json['numbers'] as List?;

//   Map<String, dynamic> toJson() => {
//     'id' : id,
//     'user_id' : userId,
//     'company_name' : companyName,
//     'website' : website,
//     'field' : field,
//     'work_phone' : workPhone,
//     'mobile_no' : mobileNo,
//     'email' : email,
//     'city' : city,
//     'province' : province,
//     'country' : country,
//     'postal_code' : postalCode,
//     'address' : address,
//     'birth_date' : birthDate,
//     'username' : username,
//     'meeting_date_time' : meetingDateTime,
//     'job_title' : jobTitle,
//     'location' : location,
//     'created_at' : createdAt,
//     'updated_at' : updatedAt,
//     'is_favourite' : isFavourite,
//     'is_saved' : isSaved,
//     'notes' : notes?.toJson(),
//     'user' : user?.toJson(),
//     'emails' : emails,
//     'numbers' : numbers
//   };
// }

// class Notes {
//   final int? id;
//   final int? parentId;
//   final String? parentType;
//   final int? userId;
//   final String? text;
//   final String? createdAt;
//   final String? updatedAt;

//   Notes({
//     this.id,
//     this.parentId,
//     this.parentType,
//     this.userId,
//     this.text,
//     this.createdAt,
//     this.updatedAt,
//   });

//   Notes.fromJson(Map<String, dynamic> json)
//     : id = json['id'] as int?,
//       parentId = json['parent_id'] as int?,
//       parentType = json['parent_type'] as String?,
//       userId = json['user_id'] as int?,
//       text = json['text'] as String?,
//       createdAt = json['created_at'] as String?,
//       updatedAt = json['updated_at'] as String?;

//   Map<String, dynamic> toJson() => {
//     'id' : id,
//     'parent_id' : parentId,
//     'parent_type' : parentType,
//     'user_id' : userId,
//     'text' : text,
//     'created_at' : createdAt,
//     'updated_at' : updatedAt
//   };
// }

// class User {
//   final int? id;
//   final String? firstName;
//   final String? lastName;
//   final String? mobileNumber;
//   final String? email;
//   final int? userType;
//   final dynamic emailVerifiedAt;
//   final String? jobTitle;
//   final String? website;
//   final dynamic companyName;
//   final dynamic companyField;
//   final String? about;
//   final String? workTel;
//   final dynamic mobileTel;
//   final String? city;
//   final String? state;
//   final String? country;
//   final String? postalCode;
//   final String? address;
//   final String? createdAt;
//   final String? updatedAt;
//   final String? image;
//   final String? card;
//   final String? logo;
//   final String? profileImage;
//   final double? userRating;
//   final ProfileAbout? profileAbout;

//   User({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.mobileNumber,
//     this.email,
//     this.userType,
//     this.emailVerifiedAt,
//     this.jobTitle,
//     this.website,
//     this.companyName,
//     this.companyField,
//     this.about,
//     this.workTel,
//     this.mobileTel,
//     this.city,
//     this.state,
//     this.country,
//     this.postalCode,
//     this.address,
//     this.createdAt,
//     this.updatedAt,
//     this.image,
//     this.card,
//     this.logo,
//     this.profileImage,
//     this.userRating,
//     this.profileAbout,
//   });

//   User.fromJson(Map<String, dynamic> json)
//     : id = json['id'] as int?,
//       firstName = json['first_name'] as String?,
//       lastName = json['last_name'] as String?,
//       mobileNumber = json['mobile_number'] as String?,
//       email = json['email'] as String?,
//       userType = json['user_type'] as int?,
//       emailVerifiedAt = json['email_verified_at'],
//       jobTitle = json['job_title'] as String?,
//       website = json['website'] as String?,
//       companyName = json['company_name'],
//       companyField = json['company_field'],
//       about = json['about'] as String?,
//       workTel = json['work_tel'] as String?,
//       mobileTel = json['mobile_tel'],
//       city = json['city'] as String?,
//       state = json['state'] as String?,
//       country = json['country'] as String?,
//       postalCode = json['postal_code'] as String?,
//       address = json['address'] as String?,
//       createdAt = json['created_at'] as String?,
//       updatedAt = json['updated_at'] as String?,
//       image = json['image'] as String?,
//       card = json['card'] as String?,
//       logo = json['logo'] as String?,
//       profileImage = json['profileImage'] as String?,
//       userRating = json['user_rating'] as double?,
//       profileAbout = (json['profile_about'] as Map<String,dynamic>?) != null ? ProfileAbout.fromJson(json['profile_about'] as Map<String,dynamic>) : null;

//   Map<String, dynamic> toJson() => {
//     'id' : id,
//     'first_name' : firstName,
//     'last_name' : lastName,
//     'mobile_number' : mobileNumber,
//     'email' : email,
//     'user_type' : userType,
//     'email_verified_at' : emailVerifiedAt,
//     'job_title' : jobTitle,
//     'website' : website,
//     'company_name' : companyName,
//     'company_field' : companyField,
//     'about' : about,
//     'work_tel' : workTel,
//     'mobile_tel' : mobileTel,
//     'city' : city,
//     'state' : state,
//     'country' : country,
//     'postal_code' : postalCode,
//     'address' : address,
//     'created_at' : createdAt,
//     'updated_at' : updatedAt,
//     'image' : image,
//     'card' : card,
//     'logo' : logo,
//     'profileImage' : profileImage,
//     'user_rating' : userRating,
//     'profile_about' : profileAbout?.toJson()
//   };
// }

// class ProfileAbout {
//   final int? id;
//   final String? userId;
//   final String? text;
//   final String? createdAt;
//   final String? updatedAt;

//   ProfileAbout({
//     this.id,
//     this.userId,
//     this.text,
//     this.createdAt,
//     this.updatedAt,
//   });

//   ProfileAbout.fromJson(Map<String, dynamic> json)
//     : id = json['id'] as int?,
//       userId = json['user_id'].toString(),
//       text = json['text'] as String?,
//       createdAt = json['created_at'] as String?,
//       updatedAt = json['updated_at'] as String?;

//   Map<String, dynamic> toJson() => {
//     'id' : id,
//     'user_id' : userId,
//     'text' : text,
//     'created_at' : createdAt,
//     'updated_at' : updatedAt
//   };
// }