import 'package:concard/Models/Cards/card_list_modal.dart';
import 'package:concard/Models/Cards/specific_user_model.dart';

class CustomCardsModel {
   int? id;
  final int? userId;
  final String? companyName;
  final dynamic website;
  final dynamic field;
  final dynamic workPhone;
  final dynamic mobileNo;
  final dynamic email;
  final String? city;
  final String? province;
  final String? country;
  final String? postalCode;
  final String? address;
  final String? birthDate;
  final String? username;
  final String? meetingDateTime;
  final String? jobTitle;
  final String? location;
  final String? createdAt;
  final String? updatedAt;
  final bool? isFavourite;
  final bool? isSaved;
  final Notes? notes;
  final User? user;
  final List<Emails>? emails;
  final List<Numbers>? numbers;

  CustomCardsModel({
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
    this.user,
    this.emails,
    this.numbers,
  });

  CustomCardsModel.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as int?,
      companyName = json['company_name'] as String?,
      website = json['website'],
      field = json['field'],
      workPhone = json['work_phone'],
      mobileNo = json['mobile_no'],
      email = json['email'],
      city = json['city'] as String?,
      province = json['province'] as String?,
      country = json['country'] as String?,
      postalCode = json['postal_code'] as String?,
      address = json['address'] as String?,
      birthDate = json['birth_date'] as String?,
      username = json['username'] as String?,
      meetingDateTime = json['meeting_date_time'] as String?,
      jobTitle = json['job_title'] as String?,
      location = json['location'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      isFavourite = json['is_favourite'] as bool?,
      isSaved = json['is_saved'] as bool?,
      notes = (json['notes'] as Map<String,dynamic>?) != null ? Notes.fromJson(json['notes'] as Map<String,dynamic>) : null,
      user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null,
      emails = (json['emails'] as List?)?.map((dynamic e) => Emails.fromJson(e as Map<String,dynamic>)).toList(),
      numbers = (json['numbers'] as List?)?.map((dynamic e) => Numbers.fromJson(e as Map<String,dynamic>)).toList();

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
    'user' : user?.toJson(),
    'emails' : emails?.map((e) => e.toJson()).toList(),
    'numbers' : numbers?.map((e) => e.toJson()).toList()
  };
}

