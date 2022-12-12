class AddCardModel {
  final int? code;
  final String? message;
  final Data? data;

  AddCardModel({
    this.code,
    this.message,
    this.data,
  });

  AddCardModel.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : data?.toJson()
  };
}

class Data {
  final int? userId;
  final String? companyName;
  final String? website;
  final String? field;
  final String? city;
  final String? province;
  final String? country;
  final String? postalCode;
  final String? address;
  final String? birthDate;
  final String? location;
  final String? username;
  final String? jobTitle;
  final String? meetingDateTime;
  final String? updatedAt;
  final String? createdAt;
  final int? id;
  final bool? isFavourite;
  final bool? isSaved;
  final Notes? notes;

  Data({
    this.userId,
    this.companyName,
    this.website,
    this.field,
    this.city,
    this.province,
    this.country,
    this.postalCode,
    this.address,
    this.birthDate,
    this.location,
    this.username,
    this.jobTitle,
    this.meetingDateTime,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.isFavourite,
    this.isSaved,
    this.notes,
  });

  Data.fromJson(Map<String, dynamic> json)
    : userId = json['user_id'] as int?,
      companyName = json['company_name'] as String?,
      website = json['website'] as String?,
      field = json['field'] as String?,
      city = json['city'] as String?,
      province = json['province'] as String?,
      country = json['country'] as String?,
      postalCode = json['postal_code'] as String?,
      address = json['address'] as String?,
      birthDate = json['birth_date'] as String?,
      location = json['location'] as String?,
      username = json['username'] as String?,
      jobTitle = json['job_title'] as String?,
      meetingDateTime = json['meeting_date_time'] as String?,
      updatedAt = json['updated_at'] as String?,
      createdAt = json['created_at'] as String?,
      id = json['id'] as int?,
      isFavourite = json['is_favourite'] as bool?,
      isSaved = json['is_saved'] as bool?,
      notes = (json['notes'] as Map<String,dynamic>?) != null ? Notes.fromJson(json['notes'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'user_id' : userId,
    'company_name' : companyName,
    'website' : website,
    'field' : field,
    'city' : city,
    'province' : province,
    'country' : country,
    'postal_code' : postalCode,
    'address' : address,
    'birth_date' : birthDate,
    'location' : location,
    'username' : username,
    'job_title' : jobTitle,
    'meeting_date_time' : meetingDateTime,
    'updated_at' : updatedAt,
    'created_at' : createdAt,
    'id' : id,
    'is_favourite' : isFavourite,
    'is_saved' : isSaved,
    'notes' : notes?.toJson()
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