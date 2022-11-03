class PostsListModal {
  PostsListModal({
    this.code,
    this.message,
    this.data,
  });

  String? code;
  String? message;
  List<Posts>? data;

  factory PostsListModal.fromJson(Map<String, dynamic> json) => PostsListModal(
        code: json["code"].toString(),
        message: json["message"],
        data: List<Posts>.from(json["data"].map((x) => Posts.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code.toString(),
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Posts {
  Posts({
    this.id,
    this.userId,
    this.text,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.likeCounts,
    this.commentCounts,
    this.userLike,
    this.isFollowed,
    this.user,
    this.comments,
  });

  String? id;
  String? userId;
  String? text;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  String? likeCounts;
  String? commentCounts;
  String? userLike;
  String? isFollowed;
  User? user;
  List<Comments>? comments;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        id: json["id"].toString(),
        userId: json["user_id"].toString(),
        text: json["text"] == null ? null : json["text"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
        likeCounts: json["like_counts"].toString(),
        commentCounts: json["comment_counts"].toString(),
        userLike: json["user_like"].toString(),
        isFollowed: json["is_followed"].toString(),
        user: User.fromJson(json["user"]),
        comments: List<Comments>.from(json["comments"].map((x) => Comments.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id.toString(),
        "user_id": userId.toString(),
        "text": text == null ? null : text,
        "status": status,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
        "image": image,
        "like_counts": likeCounts,
        "comment_counts": commentCounts,
        "user_like": userLike,
        "is_followed": isFollowed,
        "user": user?.toJson(),
        "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
      };
}

class Comments {
  Comments({
    this.id,
    this.parentId,
    this.parentType,
    this.userId,
    this.text,
    this.createdAt,
    this.updatedAt,
    this.likeCounts,
    this.userLike,
    this.user,
    this.replies,
  });

  String? id;
  String? parentId;
  String? parentType;
  String? userId;
  String? text;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? likeCounts;
  String? userLike;
  User? user;
  List<Comments>? replies;

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        id: json["id"].toString(),
        parentId: json["parent_id"],
        parentType: json["parent_type"],
        userId: json["user_id"],
        text: json["text"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        likeCounts: json["like_counts"].toString(),
        userLike: json["user_like"].toString(),
        user: User.fromJson(json["user"]),
        replies: List<Comments>.from(json["replies"].map((x) => Comments.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "parent_type": parentType,
        "user_id": userId,
        "text": text,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
        "like_counts": likeCounts,
        "user_like": userLike,
        "user": user?.toJson(),
        "replies": List<dynamic>.from(replies!.map((x) => x.toJson())),
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
    this.ratings,
  });

  String? id;
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
  String? userRating;
  List<dynamic>? ratings;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"].toString(),
        firstName: json["first_name"],
        lastName: json["last_name"],
        mobileNumber: json["mobile_number"],
        email: json["email"],
        userType: json["user_type"].toString(),
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
        userRating: json["user_rating"].toString(),
        ratings: json["ratings"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "mobile_number": mobileNumber,
        "email": email,
        "user_type": userType.toString(),
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
        "ratings": ratings,
      };
}
