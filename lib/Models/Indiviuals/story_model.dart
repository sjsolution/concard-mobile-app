class StoryModel {
  StoryModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<Data>? data;

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        code: json["code"],
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  Data({
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
    this.stories,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;
  String? userType;
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
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  String? card;
  String? logo;
  String? profileImage;
  List<Story>? stories;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        stories:
            List<Story>.from(json["stories"].map((x) => Story.fromJson(x))),
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
        "stories": List<dynamic>.from(stories!.map((x) => x.toJson())),
      };
}

class Story {
  Story({
    this.id,
    this.userId,
    this.text,
    this.file,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  int? id;
  String? userId;
  String? text;
  dynamic file;
  String? type;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json["id"],
        userId: json["user_id"],
        text: json["text"] == null ? null : json["text"],
        file: json["file"],
        type: json["type"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "text": text == null ? null : text,
        "file": file,
        "type": type,
        "status": status,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
        "image": image,
      };
}
