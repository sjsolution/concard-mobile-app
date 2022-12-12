// import 'dart:convert';

// import 'package:concard/Models/Cards/specific_card_model.dart';

// class TeamDetailModel {
//   final TeamDetailData? teamDetailData;
//   final String? teamInviteLink;

//   TeamDetailModel({
//     this.teamDetailData,
//     this.teamInviteLink,
//   });

//   TeamDetailModel.fromJson(Map<String, dynamic> json)
//     : teamDetailData = (json['team'] as Map<String,dynamic>?) != null ? TeamDetailData.fromJson(json['team'] as Map<String,dynamic>) : null,
//       teamInviteLink = json['invite_link'] as String?;

//   Map<String, dynamic> toJson() => {
//     'team' : teamDetailData?.toJson(),
//     'invite_link' : teamInviteLink
//   };
// }

// class TeamDetailData {
//   final int? id;
//   final int? userId;
//   final String? teamName;
//   final int? inviteMember;
//   final int? addCard;
//   final int? deleteCard;
//   final int? deleteMember;
//   final String? slug;
//   final String? createdAt;
//   final String? updatedAt;
//   final List<TeamMembers>? teamMembers;
//   final String? image;
//   final List<CustomCardsModel>? teamSharedCards;

//   TeamDetailData({
//     this.id,
//     this.userId,
//     this.teamName,
//     this.inviteMember,
//     this.addCard,
//     this.deleteCard,
//     this.deleteMember,
//     this.slug,
//     this.createdAt,
//     this.updatedAt,
//     this.teamMembers,
//     this.image,
//     this.teamSharedCards,
//   });

//   TeamDetailData.fromJson(Map<String, dynamic> json)
//     : id = json['id'] as int?,
//       userId = json['user_id'] as int?,
//       teamName = json['team_name'] as String?,
//       inviteMember = json['invite_member'] as int?,
//       addCard = json['add_card'] as int?,
//       deleteCard = json['delete_card'] as int?,
//       deleteMember = json['delete_member'] as int?,
//       slug = json['slug'] as String?,
//       createdAt = json['created_at'] as String?,
//       updatedAt = json['updated_at'] as String?,
//       teamMembers = (json['members'] as List?)?.map((dynamic e) => TeamMembers.fromJson(e as Map<String,dynamic>)).toList(),
//       image = json['image'] as String?,
//       teamSharedCards = (json['shared_cards'] as List?)?.map((e) => CustomCardsModel.fromJson(e as Map<String,dynamic>)).toList();

//   Map<String, dynamic> toJson() => {
//     'id' : id,
//     'user_id' : userId,
//     'team_name' : teamName,
//     'invite_member' : inviteMember,
//     'add_card' : addCard,
//     'delete_card' : deleteCard,
//     'delete_member' : deleteMember,
//     'slug' : slug,
//     'created_at' : createdAt,
//     'updated_at' : updatedAt,
//     'members' : teamMembers?.map((e) => e.toJson()).toList(),
//     'image' : image,
//     'shared_cards' : teamSharedCards
//   };
// }

// class TeamMembers {
//   final int? id;
//   final String? firstName;
//   final String? lastName;
//   final String? mobileNumber;
//   final String? email;
//   final int? userType;
//   final dynamic emailVerifiedAt;
//   final dynamic jobTitle;
//   final dynamic website;
//   final dynamic companyName;
//   final dynamic companyField;
//   final dynamic about;
//   final dynamic workTel;
//   final dynamic mobileTel;
//   final dynamic city;
//   final dynamic state;
//   final dynamic country;
//   final dynamic postalCode;
//   final dynamic address;
//   final String? createdAt;
//   final String? updatedAt;
//   final String? image;
//   final String? card;
//   final String? logo;
//   final String? profileImage;
//   final String? userRating;
//   final String? profileAbout;
//   final List<dynamic>? ratings;
//   final UserPivot? userPivot;

//   TeamMembers({
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
//     this.ratings,
//     this.userPivot,
//   });

//   TeamMembers.fromJson(Map<String, dynamic> json)
//     : id = json['id'] as int?,
//       firstName = json['first_name'] as String?,
//       lastName = json['last_name'] as String?,
//       mobileNumber = json['mobile_number'] as String?,
//       email = json['email'] as String?,
//       userType = json['user_type'] as int?,
//       emailVerifiedAt = json['email_verified_at'],
//       jobTitle = json['job_title'],
//       website = json['website'],
//       companyName = json['company_name'],
//       companyField = json['company_field'],
//       about = json['about'],
//       workTel = json['work_tel'],
//       mobileTel = json['mobile_tel'],
//       city = json['city'],
//       state = json['state'],
//       country = json['country'],
//       postalCode = json['postal_code'],
//       address = json['address'],
//       createdAt = json['created_at'] as String?,
//       updatedAt = json['updated_at'] as String?,
//       image = json['image'] as String?,
//       card = json['card'] as String?,
//       logo = json['logo'] as String?,
//       profileImage = json['profileImage'] as String?,
//       userRating = json['user_rating'] as String?,
//       profileAbout = json['profile_about'] as String?,
//       ratings = json['ratings'] as List?,
//       userPivot = (json['pivot'] as Map<String, dynamic>?) != null ? UserPivot.fromJson(json['pivot'] as Map<String, dynamic>) : null;
      

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
//     'profile_about' : profileAbout,
//     'ratings' : ratings,
//     'pivot':userPivot?.toJson()
//   };
// }
// class UserPivot {
//   final String? teamId;
//   final String? userId;

//   UserPivot({
//     this.teamId,
//     this.userId,
//   });

//   UserPivot.fromJson(Map<String, dynamic> json)
//       : teamId = json['team_id'] as String?,
//         userId = json['user_id'] as String?;

//   Map<String, dynamic> toJson() => {'team_id': teamId, 'user_id': userId};
// }
// class CardPivot {
//   final String? teamId;
//   final String? cardId;

//   CardPivot({
//     this.teamId,
//     this.cardId,
//   });

//   CardPivot.fromJson(Map<String, dynamic> json)
//       : teamId = json['team_id'] as String?,
//         cardId = json['card_id'] as String?;

//   Map<String, dynamic> toJson() => {'team_id': teamId, 'card_id': cardId};
// }

import 'package:concard/Models/Cards/specific_card_model.dart';

class TeamDetailModel {
  final TeamDetailData? teamDetailData;
  final String? teamInviteLink;

  TeamDetailModel({
    this.teamDetailData,
    this.teamInviteLink,
  });

  TeamDetailModel.fromJson(Map<String, dynamic> json)
      : teamDetailData = (json['team'] as Map<String, dynamic>?) != null ? TeamDetailData.fromJson(json['team'] as Map<String, dynamic>) : null,
        teamInviteLink = json['invite_link'] as String?;

  Map<String, dynamic> toJson() => {'team': teamDetailData?.toJson(), 'invite_link': teamInviteLink};
}

class TeamDetailData {
  final int? id;
  final String? userId;
  final String? teamName;
  final String? inviteMember;
  final String? addCard;
  final String? deleteCard;
  final String? deleteMember;
  final String? slug;
  final String? createdAt;
  final String? updatedAt;
  final String? image;
  final List<TeamMembers>? teamMembers;
  final List<CustomCardsModel>? teamSharedCards;

  TeamDetailData({
    this.id,
    this.userId,
    this.teamName,
    this.inviteMember,
    this.addCard,
    this.deleteCard,
    this.deleteMember,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.teamMembers,
    this.teamSharedCards,
  });

  TeamDetailData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'].toString(),
        teamName = json['team_name'].toString(),
        inviteMember = json['invite_member'] .toString(),
        addCard = json['add_card'] .toString(),
        deleteCard = json['delete_card'] .toString(),
        deleteMember = json['delete_member'] .toString(),
        slug = json['slug'] .toString(),
        createdAt = json['created_at'] .toString(),
        updatedAt = json['updated_at'] .toString(),
        image = json['image'] .toString(),
        teamMembers = (json['members'] as List?)?.map((dynamic e) => TeamMembers.fromJson(e as Map<String, dynamic>)).toList(),
        teamSharedCards = (json['shared_cards'] as List?)?.map((dynamic e) => CustomCardsModel.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'team_name': teamName,
        'invite_member': inviteMember,
        'add_card': addCard,
        'delete_card': deleteCard,
        'delete_member': deleteMember,
        'slug': slug,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image,
        'members': teamMembers?.map((e) => e.toJson()).toList(),
        'shared_cards': teamSharedCards?.map((e) => e.toJson()).toList()
      };
}

class TeamMembers {
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
  final UserPivot? userPivot;

  TeamMembers({
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
    this.userPivot,
  });

  TeamMembers.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        firstName = json['first_name'] .toString(),
        lastName = json['last_name'] .toString(),
        mobileNumber = json['mobile_number'] .toString(),
        email = json['email'] .toString(),
        userType = json['user_type'] .toString(),
        emailVerifiedAt = json['email_verified_at'],
        jobTitle = json['job_title'] .toString(),
        website = json['website'] .toString(),
        companyName = json['company_name'] .toString(),
        companyField = json['company_field'] .toString(),
        about = json['about'] .toString(),
        workTel = json['work_tel'] .toString(),
        mobileTel = json['mobile_tel'],
        city = json['city'] .toString(),
        state = json['state'] .toString(),
        country = json['country'] .toString(),
        postalCode = json['postal_code'] .toString(),
        address = json['address'] .toString(),
        createdAt = json['created_at'] .toString(),
        updatedAt = json['updated_at'] .toString(),
        image = json['image'] .toString(),
        card = json['card'] .toString(),
        logo = json['logo'] .toString(),
        profileImage = json['profileImage'] .toString(),
        userPivot = (json['pivot'] as Map<String, dynamic>?) != null ? UserPivot.fromJson(json['pivot'] as Map<String, dynamic>) : null;

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
        'pivot': userPivot?.toJson()
      };
}

class UserPivot {
  final String? teamId;
  final String? userId;

  UserPivot({
    this.teamId,
    this.userId,
  });

  UserPivot.fromJson(Map<String, dynamic> json)
      : teamId = json['team_id'] .toString(),
        userId = json['user_id'] .toString();

  Map<String, dynamic> toJson() => {'team_id': teamId, 'user_id': userId};
}

// class TeamSharedCards {
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
//   final String? birthDate;
//   final String? username;
//   final String? meetingDateTime;
//   final dynamic jobTitle;
//   final String? location;
//   final String? createdAt;
//   final String? updatedAt;
//   final CardPivot? cardPivot;
//   final SharedCardUser? sharedCardUser;

//   TeamSharedCards({
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
//     this.cardPivot,
//     this.sharedCardUser,
//   });

//   TeamSharedCards.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int?,
//         userId = json['user_id'] as String?,
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
//         cardPivot = (json['pivot'] as Map<String, dynamic>?) != null
//             ? CardPivot.fromJson(json['pivot'] as Map<String, dynamic>)
//             : null,
//         sharedCardUser = (json['user'] as Map<String, dynamic>?) != null
//             ? SharedCardUser.fromJson(json['user'] as Map<String, dynamic>)
//             : null;

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
//         'pivot': cardPivot?.toJson(),
//         'user': sharedCardUser?.toJson()
//       };
// }

class CardPivot {
  final String? teamId;
  final String? cardId;

  CardPivot({
    this.teamId,
    this.cardId,
  });

  CardPivot.fromJson(Map<String, dynamic> json)
      : teamId = json['team_id'] as String?,
        cardId = json['card_id'] as String?;

  Map<String, dynamic> toJson() => {'team_id': teamId, 'card_id': cardId};
}

// class SharedCardUser {
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

//   SharedCardUser({
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
//   });

//   SharedCardUser.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int?,
//         firstName = json['first_name'] as String?,
//         lastName = json['last_name'] as String?,
//         mobileNumber = json['mobile_number'] as String?,
//         email = json['email'] as String?,
//         userType = json['user_type'] as String?,
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
//         profileImage = json['profileImage'] as String?;

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
//         'profileImage': profileImage
//       };
// }
