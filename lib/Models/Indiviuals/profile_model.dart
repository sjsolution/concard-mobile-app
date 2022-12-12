

// class IndividualProfileModel {
//   int? code;
//   String? message;
//   IndividualUserData? indiviusalUserData;

//   IndividualProfileModel({
//     this.code,
//     this.message,
//     this.indiviusalUserData,
//   });

//   IndividualProfileModel.fromJson(Map<String, dynamic> json)
//       : code = json['code'] as int?,
//         message = json['message'] as String?,
//         indiviusalUserData =
//             (json['data'] as Map<String, dynamic>?) != null ? IndividualUserData.fromJson(json['data'] as Map<String, dynamic>) : null;

//   Map<String, dynamic> toJson() => {'code': code, 'message': message, 'data': indiviusalUserData?.toJson()};
// }

// class IndividualUserData {
//   IndividualUser? indiviudaluser;
//   int? reachedCardsCounts;
//   int? savedCardsCounts;
//   int? favouriteCardsCounts;

//   IndividualUserData({
//     this.indiviudaluser,
//     this.reachedCardsCounts,
//     this.savedCardsCounts,
//     this.favouriteCardsCounts,
//   });

//   IndividualUserData.fromJson(Map<String, dynamic> json)
//       : indiviudaluser = (json['user'] as Map<String, dynamic>?) != null ? IndividualUser.fromJson(json['user'] as Map<String, dynamic>) : null,
//         reachedCardsCounts = json['reached_cards_counts'] as int?,
//         savedCardsCounts = json['saved_cards_counts'] as int?,
//         favouriteCardsCounts = json['favourite_cards_counts'] as int?;

//   Map<String, dynamic> toJson() => {
//         'user': indiviudaluser?.toJson(),
//         'reached_cards_counts': reachedCardsCounts,
//         'saved_cards_counts': savedCardsCounts,
//         'favourite_cards_counts': favouriteCardsCounts
//       };
// }

// class IndividualUser {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? mobileNumber;
//   String? email;
//   int? userType;
//   dynamic emailVerifiedAt;
//   String? jobTitle;
//   String? website;
//   String? companyName;
//   String? companyField;
//   String? about;
//   String? workTel;
//   dynamic mobileTel;
//   String? city;
//   String? state;
//   String? country;
//   String? postalCode;
//   String? address;
//   String? createdAt;
//   String? updatedAt;
//   String? image;
//   String? card;
//   String? logo;
//   String? profileImage;
//   double? userRating;
//   ProfileAbout? profileAbout;
//   List<SavedCards>? savedCards;
//   List<FavouriteCards>? favouriteCards;

//   IndividualUser({
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
//     this.savedCards,
//     this.favouriteCards,
//   });

//   IndividualUser.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int?,
//         firstName = json['first_name'] as String?,
//         lastName = json['last_name'] as String?,
//         mobileNumber = json['mobile_number'] as String?,
//         email = json['email'] as String?,
//         userType = json['user_type'] as int?,
//         emailVerifiedAt = json['email_verified_at'],
//         jobTitle = json['job_title'] as String?,
//         website = json['website'] as String?,
//         companyName = json['company_name'] as String?,
//         companyField = json['company_field'] as String?,
//         about = json['about'] as String?,
//         workTel = json['work_tel'] as String?,
//         mobileTel = json['mobile_tel'],
//         city = json['city'] as String?,
//         state = json['state'] as String?,
//         country = json['country'] as String?,
//         postalCode = json['postal_code'] as String?,
//         address = json['address'] as String?,
//         createdAt = json['created_at'] as String?,
//         updatedAt = json['updated_at'] as String?,
//         image = json['image'] as String?,
//         card = json['card'] as String?,
//         logo = json['logo'] as String?,
//         profileImage = json['profileImage'] as String?,
//         userRating = json['user_rating'] as double?,
//         profileAbout =
//             (json['profile_about'] as Map<String, dynamic>?) != null ? ProfileAbout.fromJson(json['profile_about'] as Map<String, dynamic>) : null,
//         savedCards = (json['saved_cards'] as List?)?.map((dynamic e) => SavedCards.fromJson(e as Map<String, dynamic>)).toList(),
//         favouriteCards = (json['favourite_cards'] as List?)?.map((dynamic e) => FavouriteCards.fromJson(e as Map<String, dynamic>)).toList();

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'first_name': firstName,
//         'last_name': lastName,
//         'mobile_number': mobileNumber,
//         'email': email,
//         'user_type': userType,
//         'email_verified_at': emailVerifiedAt,
//         'job_title': jobTitle,
//         'website': website,
//         'company_name': companyName,
//         'company_field': companyField,
//         'about': about,
//         'work_tel': workTel,
//         'mobile_tel': mobileTel,
//         'city': city,
//         'state': state,
//         'country': country,
//         'postal_code': postalCode,
//         'address': address,
//         'created_at': createdAt,
//         'updated_at': updatedAt,
//         'image': image,
//         'card': card,
//         'logo': logo,
//         'profileImage': profileImage,
//         'user_rating': userRating,
//         'profile_about': profileAbout?.toJson(),
//         'saved_cards': savedCards?.map((e) => e.toJson()).toList(),
//         'favourite_cards': favouriteCards?.map((e) => e.toJson()).toList()
//       };
// }

// class ProfileAbout {
//   int? id;
//   int? userId;
//   String? text;
//   String? createdAt;
//   String? updatedAt;

//   ProfileAbout({
//     this.id,
//     this.userId,
//     this.text,
//     this.createdAt,
//     this.updatedAt,
//   });

//   ProfileAbout.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int?,
//         userId = json['user_id'] as int?,
//         text = json['text'] as String?,
//         createdAt = json['created_at'] as String?,
//         updatedAt = json['updated_at'] as String?;

//   Map<String, dynamic> toJson() => {'id': id, 'user_id': userId, 'text': text, 'created_at': createdAt, 'updated_at': updatedAt};
// }

// class SavedCards {
//   int? id;
//   int? userId;
//   String? companyName;
//   String? website;
//   String? field;
//   String? workPhone;
//   String? mobileNo;
//   String? email;
//   String? city;
//   String? province;
//   String? country;
//   String? postalCode;
//   String? address;
//   String? birthDate;
//   String? username;
//   String? meetingDateTime;
//   dynamic jobTitle;
//   String? location;
//   String? createdAt;
//   String? updatedAt;
//   bool? isFavourite;
//   bool? isSaved;
//   Notes? notes;
//   Pivot? pivot;
//   User? user;
//   List<dynamic>? emails;
//   List<dynamic>? numbers;

//   SavedCards({
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
//     this.pivot,
//     this.user,
//     this.emails,
//     this.numbers,
//   });

//   SavedCards.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int?,
//         userId = json['user_id'] as int?,
//         companyName = json['company_name'] as String?,
//         website = json['website'] as String?,
//         field = json['field'] as String?,
//         workPhone = json['work_phone'] as String?,
//         mobileNo = json['mobile_no'] as String?,
//         email = json['email'] as String?,
//         city = json['city'] as String?,
//         province = json['province'] as String?,
//         country = json['country'] as String?,
//         postalCode = json['postal_code'] as String?,
//         address = json['address'] as String?,
//         birthDate = json['birth_date'] as String?,
//         username = json['username'] as String?,
//         meetingDateTime = json['meeting_date_time'] as String?,
//         jobTitle = json['job_title'],
//         location = json['location'] as String?,
//         createdAt = json['created_at'] as String?,
//         updatedAt = json['updated_at'] as String?,
//         isFavourite = json['is_favourite'] as bool?,
//         isSaved = json['is_saved'] as bool?,
//         notes = (json['notes'] as Map<String, dynamic>?) != null ? Notes.fromJson(json['notes'] as Map<String, dynamic>) : null,
//         pivot = (json['pivot'] as Map<String, dynamic>?) != null ? Pivot.fromJson(json['pivot'] as Map<String, dynamic>) : null,
//         user = (json['user'] as Map<String, dynamic>?) != null ? User.fromJson(json['user'] as Map<String, dynamic>) : null,
//         emails = json['emails'] as List?,
//         numbers = json['numbers'] as List?;

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'user_id': userId,
//         'company_name': companyName,
//         'website': website,
//         'field': field,
//         'work_phone': workPhone,
//         'mobile_no': mobileNo,
//         'email': email,
//         'city': city,
//         'province': province,
//         'country': country,
//         'postal_code': postalCode,
//         'address': address,
//         'birth_date': birthDate,
//         'username': username,
//         'meeting_date_time': meetingDateTime,
//         'job_title': jobTitle,
//         'location': location,
//         'created_at': createdAt,
//         'updated_at': updatedAt,
//         'is_favourite': isFavourite,
//         'is_saved': isSaved,
//         'notes': notes?.toJson(),
//         'pivot': pivot?.toJson(),
//         'user': user?.toJson(),
//         'emails': emails,
//         'numbers': numbers
//       };
// }

// class Notes {
//   int? id;
//   int? parentId;
//   String? parentType;
//   int? userId;
//   String? text;
//   String? createdAt;
//   String? updatedAt;

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
//       : id = json['id'] as int?,
//         parentId = json['parent_id'] as int?,
//         parentType = json['parent_type'] as String?,
//         userId = json['user_id'] as int?,
//         text = json['text'] as String?,
//         createdAt = json['created_at'] as String?,
//         updatedAt = json['updated_at'] as String?;

//   Map<String, dynamic> toJson() =>
//       {'id': id, 'parent_id': parentId, 'parent_type': parentType, 'user_id': userId, 'text': text, 'created_at': createdAt, 'updated_at': updatedAt};
// }

// class Pivot {
//   int? userId;
//   int? cardId;

//   Pivot({
//     this.userId,
//     this.cardId,
//   });

//   Pivot.fromJson(Map<String, dynamic> json)
//       : userId = json['user_id'] as int?,
//         cardId = json['card_id'] as int?;

//   Map<String, dynamic> toJson() => {'user_id': userId, 'card_id': cardId};
// }

// class IndiviusalUser {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? mobileNumber;
//   String? email;
//   int? userType;
//   dynamic emailVerifiedAt;
//   String? jobTitle;
//   String? website;
//   String? companyName;
//   String? companyField;
//   String? about;
//   String? workTel;
//   dynamic mobileTel;
//   String? city;
//   String? state;
//   String? country;
//   String? postalCode;
//   String? address;
//   String? createdAt;
//   String? updatedAt;
//   String? image;
//   String? card;
//   String? logo;
//   String? profileImage;
//   double? userRating;
//   IndividualProfileAbout? individualUserProfileAbout;

//   IndiviusalUser({
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
//     this.individualUserProfileAbout,
//   });

//   IndiviusalUser.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int?,
//         firstName = json['first_name'] as String?,
//         lastName = json['last_name'] as String?,
//         mobileNumber = json['mobile_number'] as String?,
//         email = json['email'] as String?,
//         userType = json['user_type'] as int?,
//         emailVerifiedAt = json['email_verified_at'],
//         jobTitle = json['job_title'] as String?,
//         website = json['website'] as String?,
//         companyName = json['company_name'] as String?,
//         companyField = json['company_field'] as String?,
//         about = json['about'] as String?,
//         workTel = json['work_tel'] as String?,
//         mobileTel = json['mobile_tel'],
//         city = json['city'] as String?,
//         state = json['state'] as String?,
//         country = json['country'] as String?,
//         postalCode = json['postal_code'] as String?,
//         address = json['address'] as String?,
//         createdAt = json['created_at'] as String?,
//         updatedAt = json['updated_at'] as String?,
//         image = json['image'] as String?,
//         card = json['card'] as String?,
//         logo = json['logo'] as String?,
//         profileImage = json['profileImage'] as String?,
//         userRating = json['user_rating'] as double?,
//         individualUserProfileAbout = (json['profile_about'] as Map<String, dynamic>?) != null
//             ? IndividualProfileAbout.fromJson(json['profile_about'] as Map<String, dynamic>)
//             : null;

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'first_name': firstName,
//         'last_name': lastName,
//         'mobile_number': mobileNumber,
//         'email': email,
//         'user_type': userType,
//         'email_verified_at': emailVerifiedAt,
//         'job_title': jobTitle,
//         'website': website,
//         'company_name': companyName,
//         'company_field': companyField,
//         'about': about,
//         'work_tel': workTel,
//         'mobile_tel': mobileTel,
//         'city': city,
//         'state': state,
//         'country': country,
//         'postal_code': postalCode,
//         'address': address,
//         'created_at': createdAt,
//         'updated_at': updatedAt,
//         'image': image,
//         'card': card,
//         'logo': logo,
//         'profileImage': profileImage,
//         'user_rating': userRating,
//         'profile_about': individualUserProfileAbout?.toJson()
//       };
// }

// class IndividualProfileAbout {
//   int? id;
//   int? userId;
//   String? text;
//   String? createdAt;
//   String? updatedAt;

//   IndividualProfileAbout({
//     this.id,
//     this.userId,
//     this.text,
//     this.createdAt,
//     this.updatedAt,
//   });

//   IndividualProfileAbout.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int?,
//         userId = json['user_id'] as int?,
//         text = json['text'] as String?,
//         createdAt = json['created_at'] as String?,
//         updatedAt = json['updated_at'] as String?;

//   Map<String, dynamic> toJson() => {'id': id, 'user_id': userId, 'text': text, 'created_at': createdAt, 'updated_at': updatedAt};
// }

// class FavouriteCards {
//   int? id;
//   int? userId;
//   String? companyName;
//   String? website;
//   String? field;
//   String? workPhone;
//   String? mobileNo;
//   String? email;
//   String? city;
//   String? province;
//   String? country;
//   String? postalCode;
//   String? address;
//   String? birthDate;
//   String? username;
//   String? meetingDateTime;
//   dynamic jobTitle;
//   String? location;
//   String? createdAt;
//   String? updatedAt;
//   bool? isFavourite;
//   bool? isSaved;
//   Notes? notes;
//   Pivot? pivot;
//   User? user;
//   List<dynamic>? emails;
//   List<dynamic>? numbers;

//   FavouriteCards({
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
//     this.pivot,
//     this.user,
//     this.emails,
//     this.numbers,
//   });

//   FavouriteCards.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int?,
//         userId = json['user_id'] as int?,
//         companyName = json['company_name'] as String?,
//         website = json['website'] as String?,
//         field = json['field'] as String?,
//         workPhone = json['work_phone'] as String?,
//         mobileNo = json['mobile_no'] as String?,
//         email = json['email'] as String?,
//         city = json['city'] as String?,
//         province = json['province'] as String?,
//         country = json['country'] as String?,
//         postalCode = json['postal_code'] as String?,
//         address = json['address'] as String?,
//         birthDate = json['birth_date'] as String?,
//         username = json['username'] as String?,
//         meetingDateTime = json['meeting_date_time'] as String?,
//         jobTitle = json['job_title'],
//         location = json['location'] as String?,
//         createdAt = json['created_at'] as String?,
//         updatedAt = json['updated_at'] as String?,
//         isFavourite = json['is_favourite'] as bool?,
//         isSaved = json['is_saved'] as bool?,
//         notes = (json['notes'] as Map<String, dynamic>?) != null ? Notes.fromJson(json['notes'] as Map<String, dynamic>) : null,
//         pivot = (json['pivot'] as Map<String, dynamic>?) != null ? Pivot.fromJson(json['pivot'] as Map<String, dynamic>) : null,
//         user = (json['user'] as Map<String, dynamic>?) != null ? User.fromJson(json['user'] as Map<String, dynamic>) : null,
//         emails = json['emails'] as List?,
//         numbers = json['numbers'] as List?;

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'user_id': userId,
//         'company_name': companyName,
//         'website': website,
//         'field': field,
//         'work_phone': workPhone,
//         'mobile_no': mobileNo,
//         'email': email,
//         'city': city,
//         'province': province,
//         'country': country,
//         'postal_code': postalCode,
//         'address': address,
//         'birth_date': birthDate,
//         'username': username,
//         'meeting_date_time': meetingDateTime,
//         'job_title': jobTitle,
//         'location': location,
//         'created_at': createdAt,
//         'updated_at': updatedAt,
//         'is_favourite': isFavourite,
//         'is_saved': isSaved,
//         'notes': notes?.toJson(),
//         'pivot': pivot?.toJson(),
//         'user': user?.toJson(),
//         'emails': emails,
//         'numbers': numbers
//       };
// }

// class IndividualUserNotes {
//   int? id;
//   int? parentId;
//   String? parentType;
//   int? userId;
//   String? text;
//   String? createdAt;
//   String? updatedAt;

//   IndividualUserNotes({
//     this.id,
//     this.parentId,
//     this.parentType,
//     this.userId,
//     this.text,
//     this.createdAt,
//     this.updatedAt,
//   });

//   IndividualUserNotes.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int?,
//         parentId = json['parent_id'] as int?,
//         parentType = json['parent_type'] as String?,
//         userId = json['user_id'] as int?,
//         text = json['text'] as String?,
//         createdAt = json['created_at'] as String?,
//         updatedAt = json['updated_at'] as String?;

//   Map<String, dynamic> toJson() =>
//       {'id': id, 'parent_id': parentId, 'parent_type': parentType, 'user_id': userId, 'text': text, 'created_at': createdAt, 'updated_at': updatedAt};
// }

// class IndividualUserPivot {
//   int? userId;
//   int? cardId;

//   IndividualUserPivot({
//     this.userId,
//     this.cardId,
//   });

//   IndividualUserPivot.fromJson(Map<String, dynamic> json)
//       : userId = json['user_id'] as int?,
//         cardId = json['card_id'] as int?;

//   Map<String, dynamic> toJson() => {'user_id': userId, 'card_id': cardId};
// }

// class User {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? mobileNumber;
//   String? email;
//   int? userType;
//   dynamic emailVerifiedAt;
//   String? jobTitle;
//   String? website;
//   String? companyName;
//   String? companyField;
//   String? about;
//   String? workTel;
//   dynamic mobileTel;
//   String? city;
//   String? state;
//   String? country;
//   String? postalCode;
//   String? address;
//   String? createdAt;
//   String? updatedAt;
//   String? image;
//   String? card;
//   String? logo;
//   String? profileImage;
//   double? userRating;
//   ProfileAbout? profileAbout;

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
//       : id = json['id'] as int?,
//         firstName = json['first_name'] as String?,
//         lastName = json['last_name'] as String?,
//         mobileNumber = json['mobile_number'] as String?,
//         email = json['email'] as String?,
//         userType = json['user_type'] as int?,
//         emailVerifiedAt = json['email_verified_at'],
//         jobTitle = json['job_title'] as String?,
//         website = json['website'] as String?,
//         companyName = json['company_name'] as String?,
//         companyField = json['company_field'] as String?,
//         about = json['about'] as String?,
//         workTel = json['work_tel'] as String?,
//         mobileTel = json['mobile_tel'],
//         city = json['city'] as String?,
//         state = json['state'] as String?,
//         country = json['country'] as String?,
//         postalCode = json['postal_code'] as String?,
//         address = json['address'] as String?,
//         createdAt = json['created_at'] as String?,
//         updatedAt = json['updated_at'] as String?,
//         image = json['image'] as String?,
//         card = json['card'] as String?,
//         logo = json['logo'] as String?,
//         profileImage = json['profileImage'] as String?,
//         userRating = json['user_rating'] as double?,
//         profileAbout =
//             (json['profile_about'] as Map<String, dynamic>?) != null ? ProfileAbout.fromJson(json['profile_about'] as Map<String, dynamic>) : null;

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'first_name': firstName,
//         'last_name': lastName,
//         'mobile_number': mobileNumber,
//         'email': email,
//         'user_type': userType,
//         'email_verified_at': emailVerifiedAt,
//         'job_title': jobTitle,
//         'website': website,
//         'company_name': companyName,
//         'company_field': companyField,
//         'about': about,
//         'work_tel': workTel,
//         'mobile_tel': mobileTel,
//         'city': city,
//         'state': state,
//         'country': country,
//         'postal_code': postalCode,
//         'address': address,
//         'created_at': createdAt,
//         'updated_at': updatedAt,
//         'image': image,
//         'card': card,
//         'logo': logo,
//         'profileImage': profileImage,
//         'user_rating': userRating,
//         'profile_about': profileAbout?.toJson()
//       };
// }

class IndividualProfileModel {
  final int? code;
  final String? message;
  final IndividualUserData? individualUserData;

  IndividualProfileModel({
    this.code,
    this.message,
    this.individualUserData,
  });

  IndividualProfileModel.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      individualUserData = (json['data'] as Map<String,dynamic>?) != null ? IndividualUserData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : individualUserData?.toJson()
  };
}

class IndividualUserData {
  final IndividualUser? individualUser;
  final List<CompanyMembers>? companyMembers;
  final int? reachedCardsCounts;
  final int? savedCardsCounts;
  final int? favouriteCardsCounts;

  IndividualUserData({
    this.individualUser,
    this.companyMembers,
    this.reachedCardsCounts,
    this.savedCardsCounts,
    this.favouriteCardsCounts,
  });

  IndividualUserData.fromJson(Map<String, dynamic> json)
    : individualUser = (json['user'] as Map<String,dynamic>?) != null ? IndividualUser.fromJson(json['user'] as Map<String,dynamic>) : null,
      companyMembers = (json['company_members'] as List?)?.map((dynamic e) => CompanyMembers.fromJson(e as Map<String,dynamic>)).toList(),
      reachedCardsCounts = json['reached_cards_counts'] as int?,
      savedCardsCounts = json['saved_cards_counts'] as int?,
      favouriteCardsCounts = json['favourite_cards_counts'] as int?;

  Map<String, dynamic> toJson() => {
    'user' : individualUser?.toJson(),
    'company_members' : companyMembers?.map((e) => e.toJson()).toList(),
    'reached_cards_counts' : reachedCardsCounts,
    'saved_cards_counts' : savedCardsCounts,
    'favourite_cards_counts' : favouriteCardsCounts
  };
}

class IndividualUser {
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
  final IndividualUserProfileAbout? individualProfileAbout;
  final List<SavedCards>? savedCards;
  final List<FavouriteCards>? favouriteCards;

  IndividualUser({
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
    this.individualProfileAbout,
    this.savedCards,
    this.favouriteCards,
  });

  IndividualUser.fromJson(Map<String, dynamic> json)
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
      individualProfileAbout = (json['profile_about'] as Map<String,dynamic>?) != null ? IndividualUserProfileAbout.fromJson(json['profile_about'] as Map<String,dynamic>) : null,
      savedCards = (json['saved_cards'] as List?)?.map((dynamic e) => SavedCards.fromJson(e as Map<String,dynamic>)).toList(),
      favouriteCards = (json['favourite_cards'] as List?)?.map((dynamic e) => FavouriteCards.fromJson(e as Map<String,dynamic>)).toList();

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
    'profile_about' : individualProfileAbout?.toJson(),
    'saved_cards' : savedCards?.map((e) => e.toJson()).toList(),
    'favourite_cards' : favouriteCards?.map((e) => e.toJson()).toList()
  };
}

class ProfileAbout {
  final int? id;
  final int? userId;
   String? text;
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

class SavedCards {
  final int? id;
  final int? userId;
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
  final String? username;
  final String? meetingDateTime;
  final dynamic jobTitle;
  final String? location;
  final String? createdAt;
  final String? updatedAt;
  final bool? isFavourite;
  final bool? isSaved;
  final Notes? notes;
  final Pivot? pivot;
  final User? user;
  final List<dynamic>? emails;
  final List<dynamic>? numbers;

  SavedCards({
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
    this.pivot,
    this.user,
    this.emails,
    this.numbers,
  });

  SavedCards.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as int?,
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
      username = json['username'] as String?,
      meetingDateTime = json['meeting_date_time'] as String?,
      jobTitle = json['job_title'],
      location = json['location'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      isFavourite = json['is_favourite'] as bool?,
      isSaved = json['is_saved'] as bool?,
      notes = (json['notes'] as Map<String,dynamic>?) != null ? Notes.fromJson(json['notes'] as Map<String,dynamic>) : null,
      pivot = (json['pivot'] as Map<String,dynamic>?) != null ? Pivot.fromJson(json['pivot'] as Map<String,dynamic>) : null,
      user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null,
      emails = json['emails'] as List?,
      numbers = json['numbers'] as List?;

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
    'pivot' : pivot?.toJson(),
    'user' : user?.toJson(),
    'emails' : emails,
    'numbers' : numbers
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

class Pivot {
  final int? userId;
  final int? cardId;

  Pivot({
    this.userId,
    this.cardId,
  });

  Pivot.fromJson(Map<String, dynamic> json)
    : userId = json['user_id'] as int?,
      cardId = json['card_id'] as int?;

  Map<String, dynamic> toJson() => {
    'user_id' : userId,
    'card_id' : cardId
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
  final IndividualUserProfileAbout? profileAbout;

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
      profileAbout = (json['profile_about'] as Map<String,dynamic>?) != null ? IndividualUserProfileAbout.fromJson(json['profile_about'] as Map<String,dynamic>) : null;

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

class FavouriteCards {
  final int? id;
  final int? userId;
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
  final bool? isFavourite;
  final bool? isSaved;
  final Notes? notes;
  final Pivot? pivot;
  final User? user;
  final List<dynamic>? emails;
  final List<dynamic>? numbers;

  FavouriteCards({
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
    this.pivot,
    this.user,
    this.emails,
    this.numbers,
  });

  FavouriteCards.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as int?,
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
      isFavourite = json['is_favourite'] as bool?,
      isSaved = json['is_saved'] as bool?,
      notes = (json['notes'] as Map<String,dynamic>?) != null ? Notes.fromJson(json['notes'] as Map<String,dynamic>) : null,
      pivot = (json['pivot'] as Map<String,dynamic>?) != null ? Pivot.fromJson(json['pivot'] as Map<String,dynamic>) : null,
      user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null,
      emails = json['emails'] as List?,
      numbers = json['numbers'] as List?;

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
    'pivot' : pivot?.toJson(),
    'user' : user?.toJson(),
    'emails' : emails,
    'numbers' : numbers
  };
}

class IndividualUserNotes {
  final int? id;
  final int? parentId;
  final String? parentType;
  final int? userId;
  final String? text;
  final String? createdAt;
  final String? updatedAt;

  IndividualUserNotes({
    this.id,
    this.parentId,
    this.parentType,
    this.userId,
    this.text,
    this.createdAt,
    this.updatedAt,
  });

  IndividualUserNotes.fromJson(Map<String, dynamic> json)
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

class IndividualUserProfileAbout {
  final int? id;
  final int? userId;
   String? text;
  final String? createdAt;
  final String? updatedAt;

  IndividualUserProfileAbout({
    this.id,
    this.userId,
    this.text,
    this.createdAt,
    this.updatedAt,
  });

  IndividualUserProfileAbout.fromJson(Map<String, dynamic> json)
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
  final double? userRating;
  final IndividualUserProfileAbout? profileAbout;

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
      userRating = json['user_rating'] as double?,
      profileAbout = (json['profile_about'] as Map<String,dynamic>?) != null ? IndividualUserProfileAbout.fromJson(json['profile_about'] as Map<String,dynamic>) : null;

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


  