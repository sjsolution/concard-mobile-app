class IndividualProfileModel {
  IndividualProfileModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory IndividualProfileModel.fromJson(Map<String, dynamic> json) => IndividualProfileModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.user,
    this.reachedCardsCounts,
    this.savedCardsCounts,
    this.favouriteCardsCounts,
  });

  User? user;
  int? reachedCardsCounts;
  int? savedCardsCounts;
  int? favouriteCardsCounts;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        reachedCardsCounts: json["reached_cards_counts"],
        savedCardsCounts: json["saved_cards_counts"],
        favouriteCardsCounts: json["favourite_cards_counts"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "reached_cards_counts": reachedCardsCounts,
        "saved_cards_counts": savedCardsCounts,
        "favourite_cards_counts": favouriteCardsCounts,
      };
}

class ProfileCard {
  ProfileCard({
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
  });

  int? id;
  String? userId;
  String? companyName;
  String? website;
  String? field;
  String? workPhone;
  String? mobileNo;
  String? email;
  String? city;
  String? province;
  String? country;
  String? postalCode;
  String? address;
  String? birthDate;
  String? username;
  DateTime? meetingDateTime;
  String? jobTitle;
  String? location;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isFavourite;
  bool? isSaved;
  Notes? notes;
  Pivot? pivot;
  User? user;

  factory ProfileCard.fromJson(Map<String, dynamic> json) => ProfileCard(
        id: json["id"],
        userId: json["user_id"],
        companyName: json["company_name"],
        website: json["website"],
        field: json["field"],
        workPhone: json["work_phone"],
        mobileNo: json["mobile_no"],
        email: json["email"],
        city: json["city"],
        province: json["province"],
        country: json["country"],
        postalCode: json["postal_code"],
        address: json["address"],
        birthDate: json["birth_date"],
        username: json["username"],
        meetingDateTime: DateTime.parse(json["meeting_date_time"]),
        jobTitle: json["job_title"],
        location: json["location"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isFavourite: json["is_favourite"],
        isSaved: json["is_saved"],
        notes: Notes.fromJson(json["notes"]),
        pivot: Pivot.fromJson(json["pivot"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "company_name": companyName,
        "website": website,
        "field": field,
        "work_phone": workPhone,
        "mobile_no": mobileNo,
        "email": email,
        "city": city,
        "province": province,
        "country": country,
        "postal_code": postalCode,
        "address": address,
        "birth_date": birthDate,
        "username": username,
        "meeting_date_time": meetingDateTime.toString(),
        "job_title": jobTitle,
        "location": location,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
        "is_favourite": isFavourite,
        "is_saved": isSaved,
        "notes": notes?.toJson(),
        "pivot": pivot?.toJson(),
        "user": user?.toJson(),
      };
}

class User {
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
    this.savedCards,
    this.favouriteCards,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;
  String? userType;
  String? emailVerifiedAt;
  String? jobTitle;
  String? website;
  String? companyName;
  String? companyField;
  String? about;
  String? workTel;
  String? mobileTel;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  String? address;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  String? card;
  String? logo;
  String? profileImage;
  double? userRating;
  List<ProfileCard>? savedCards;
  List<ProfileCard>? favouriteCards;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        mobileNumber: json["mobile_number"],
        email: json["email"],
        userType: json["user_type"],
        emailVerifiedAt: json["email_verified_at"],
        jobTitle: json["job_title"],
        website: json["website"],
        companyName: json["company_name"],
        companyField: json["company_field"],
        about: json["about"],
        workTel: json["work_tel"],
        mobileTel: json["mobile_tel"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postalCode: json["postal_code"],
        address: json["address"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
        card: json["card"],
        logo: json["logo"],
        profileImage: json["profileImage"],
        userRating: json["user_rating"].toDouble(),
        savedCards: json["saved_cards"] == null ? null : List<ProfileCard>.from(json["saved_cards"].map((x) => ProfileCard.fromJson(x))),
        favouriteCards: json["favourite_cards"] == null ? null : List<ProfileCard>.from(json["favourite_cards"].map((x) => ProfileCard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "mobile_number": mobileNumber,
        "email": email,
        "user_type": userType,
        "email_verified_at": emailVerifiedAt,
        "job_title": jobTitle,
        "website": website,
        "company_name": companyName,
        "company_field": companyField,
        "about": about,
        "work_tel": workTel,
        "mobile_tel": mobileTel,
        "city": city,
        "state": state,
        "country": country,
        "postal_code": postalCode,
        "address": address,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
        "image": image,
        "card": card,
        "logo": logo,
        "profileImage": profileImage,
        "user_rating": userRating,
        "saved_cards": savedCards == null ? null : List<dynamic>.from(savedCards!.map((x) => x.toJson())),
        "favourite_cards": favouriteCards == null ? null : List<dynamic>.from(favouriteCards!.map((x) => x.toJson())),
      };
}

class Notes {
  Notes({
    this.id,
    this.parentId,
    this.parentType,
    this.userId,
    this.text,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? parentId;
  String? parentType;
  String? userId;
  String? text;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        id: json["id"],
        parentId: json["parent_id"],
        parentType: json["parent_type"],
        userId: json["user_id"],
        text: json["text"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "parent_type": parentType,
        "user_id": userId,
        "text": text,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
      };
}

class Pivot {
  Pivot({
    this.userId,
    this.cardId,
  });

  String? userId;
  String? cardId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        cardId: json["card_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "card_id": cardId,
      };
}
