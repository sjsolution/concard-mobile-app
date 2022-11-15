import 'dart:convert';

import 'package:concard/Models/Cards/specific_card_model.dart';

class TeamDetailModel {
  final TeamDetailData? teamDetailData;
  final String? teamInviteLink;

  TeamDetailModel({
    this.teamDetailData,
    this.teamInviteLink,
  });

  TeamDetailModel.fromJson(Map<String, dynamic> json)
    : teamDetailData = (json['team'] as Map<String,dynamic>?) != null ? TeamDetailData.fromJson(json['team'] as Map<String,dynamic>) : null,
      teamInviteLink = json['invite_link'] as String?;

  Map<String, dynamic> toJson() => {
    'team' : teamDetailData?.toJson(),
    'invite_link' : teamInviteLink
  };
}

class TeamDetailData {
  final int? id;
  final int? userId;
  final String? teamName;
  final int? inviteMember;
  final int? addCard;
  final int? deleteCard;
  final int? deleteMember;
  final String? slug;
  final String? createdAt;
  final String? updatedAt;
  final List<TeamMembers>? teamMembers;
  final String? image;
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
    this.teamMembers,
    this.image,
    this.teamSharedCards,
  });

  TeamDetailData.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as int?,
      teamName = json['team_name'] as String?,
      inviteMember = json['invite_member'] as int?,
      addCard = json['add_card'] as int?,
      deleteCard = json['delete_card'] as int?,
      deleteMember = json['delete_member'] as int?,
      slug = json['slug'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      teamMembers = (json['members'] as List?)?.map((dynamic e) => TeamMembers.fromJson(e as Map<String,dynamic>)).toList(),
      image = json['image'] as String?,
      teamSharedCards = (json['shared_cards'] as List?)?.map((e) => CustomCardsModel.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'team_name' : teamName,
    'invite_member' : inviteMember,
    'add_card' : addCard,
    'delete_card' : deleteCard,
    'delete_member' : deleteMember,
    'slug' : slug,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'members' : teamMembers?.map((e) => e.toJson()).toList(),
    'image' : image,
    'shared_cards' : teamSharedCards
  };
}

class TeamMembers {
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
  final String? userRating;
  final String? profileAbout;
  final List<dynamic>? ratings;
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
    this.userRating,
    this.profileAbout,
    this.ratings,
    this.userPivot,
  });

  TeamMembers.fromJson(Map<String, dynamic> json)
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
      userRating = json['user_rating'] as String?,
      profileAbout = json['profile_about'] as String?,
      ratings = json['ratings'] as List?,
      userPivot = (json['pivot'] as Map<String, dynamic>?) != null ? UserPivot.fromJson(json['pivot'] as Map<String, dynamic>) : null;
      

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
    'profile_about' : profileAbout,
    'ratings' : ratings,
    'pivot':userPivot?.toJson()
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
      : teamId = json['team_id'] as String?,
        userId = json['user_id'] as String?;

  Map<String, dynamic> toJson() => {'team_id': teamId, 'user_id': userId};
}
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
