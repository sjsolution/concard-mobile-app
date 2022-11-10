// class IndividualProfileModel {
//   IndividualProfileModel({
//     this.code,
//     this.message,
//     this.data,
//   });
//   int? code;
//   String? message;
//   List<Data>? data;
//
//   IndividualProfileModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     message = json['message'];
//     data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['code'] = code;
//     _data['message'] = message;
//     _data['data'] = data!.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Data {
//   Data({
//     this.id,
//     this.userId,
//     this.text,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.image,
//     this.likeCounts,
//     this.commentCounts,
//     this.userLike,
//     this.isFollowed,
//     this.user,
//     this.comments,
//   });
//   int? id;
//   int? userId;
//   String? text;
//   int? status;
//   String? createdAt;
//   String? updatedAt;
//   String? image;
//   int? likeCounts;
//   int? commentCounts;
//   int? userLike;
//   int? isFollowed;
//   User? user;
//   List<Comments> comments;
//
//   factory Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     text = null;
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     image = json['image'];
//     likeCounts = json['like_counts'];
//     commentCounts = json['comment_counts'];
//     userLike = json['user_like'];
//     isFollowed = json['is_followed'];
//     user = User.fromJson(json['user']);
//     comments = List.from(json['comments']).map((e) => Comments.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['user_id'] = userId;
//     _data['text'] = text;
//     _data['status'] = status;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['image'] = image;
//     _data['like_counts'] = likeCounts;
//     _data['comment_counts'] = commentCounts;
//     _data['user_like'] = userLike;
//     _data['is_followed'] = isFollowed;
//     _data['user'] = user.toJson();
//     _data['comments'] = comments.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }
//
// class User {
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
//   int id;
//   String firstName;
//   String lastName;
//   String mobileNumber;
//   String email;
//   int userType;
//   Null emailVerifiedAt;
//   String? jobTitle;
//   String? website;
//   String? companyName;
//   String? companyField;
//   String? about;
//   String? workTel;
//   Null mobileTel;
//   String? city;
//   String? state;
//   String? country;
//   String? postalCode;
//   String? address;
//   String createdAt;
//   String updatedAt;
//   String image;
//   String card;
//   String logo;
//   String profileImage;
//   double? userRating;
//   ProfileAbout? profileAbout;
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     mobileNumber = json['mobile_number'];
//     email = json['email'];
//     userType = json['user_type'];
//     emailVerifiedAt = null;
//     jobTitle = null;
//     website = null;
//     companyName = null;
//     companyField = null;
//     about = null;
//     workTel = null;
//     mobileTel = null;
//     city = null;
//     state = null;
//     country = null;
//     postalCode = null;
//     address = null;
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     image = json['image'];
//     card = json['card'];
//     logo = json['logo'];
//     profileImage = json['profileImage'];
//     userRating = json['user_rating'];
//     profileAbout = json['profile_about'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['first_name'] = firstName;
//     _data['last_name'] = lastName;
//     _data['mobile_number'] = mobileNumber;
//     _data['email'] = email;
//     _data['user_type'] = userType;
//     _data['email_verified_at'] = emailVerifiedAt;
//     _data['job_title'] = jobTitle;
//     _data['website'] = website;
//     _data['company_name'] = companyName;
//     _data['company_field'] = companyField;
//     _data['about'] = about;
//     _data['work_tel'] = workTel;
//     _data['mobile_tel'] = mobileTel;
//     _data['city'] = city;
//     _data['state'] = state;
//     _data['country'] = country;
//     _data['postal_code'] = postalCode;
//     _data['address'] = address;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['image'] = image;
//     _data['card'] = card;
//     _data['logo'] = logo;
//     _data['profileImage'] = profileImage;
//     _data['user_rating'] = userRating;
//     _data['profile_about'] = profileAbout;
//     return _data;
//   }
// }
//
// class ProfileAbout {
//   ProfileAbout({
//     this.id,
//     this.userId,
//     this.text,
//     this.createdAt,
//     this.updatedAt,
//   });
//   int id;
//   int userId;
//   String text;
//   String createdAt;
//   String updatedAt;
//
//   ProfileAbout.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     text = json['text'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['user_id'] = userId;
//     _data['text'] = text;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }
//
// class Comments {
//   Comments({
//     this.id,
//     this.parentId,
//     this.parentType,
//     this.userId,
//     this.text,
//     this.createdAt,
//     this.updatedAt,
//     this.likeCounts,
//     this.userLike,
//     this.user,
//     this.replies,
//   });
//   int id;
//   int parentId;
//   String parentType;
//   int userId;
//   String text;
//   String createdAt;
//   String updatedAt;
//   int likeCounts;
//   int userLike;
//   User user;
//   List<Replies> replies;
//
//   Comments.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     parentId = json['parent_id'];
//     parentType = json['parent_type'];
//     userId = json['user_id'];
//     text = json['text'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     likeCounts = json['like_counts'];
//     userLike = json['user_like'];
//     user = User.fromJson(json['user']);
//     replies = List.from(json['replies']).map((e) => Replies.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['parent_id'] = parentId;
//     _data['parent_type'] = parentType;
//     _data['user_id'] = userId;
//     _data['text'] = text;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['like_counts'] = likeCounts;
//     _data['user_like'] = userLike;
//     _data['user'] = user.toJson();
//     _data['replies'] = replies.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Replies {
//   Replies({
//     this.id,
//     this.parentId,
//     this.parentType,
//     this.userId,
//     this.text,
//     this.createdAt,
//     this.updatedAt,
//     this.likeCounts,
//     this.userLike,
//     this.user,
//     this.replies,
//   });
//   int id;
//   int parentId;
//   String parentType;
//   int userId;
//   String text;
//   String createdAt;
//   String updatedAt;
//   int likeCounts;
//   int userLike;
//   User user;
//   List<dynamic> replies;
//
//   Replies.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     parentId = json['parent_id'];
//     parentType = json['parent_type'];
//     userId = json['user_id'];
//     text = json['text'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     likeCounts = json['like_counts'];
//     userLike = json['user_like'];
//     user = User.fromJson(json['user']);
//     replies = List.castFrom<dynamic, dynamic>(json['replies']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['parent_id'] = parentId;
//     _data['parent_type'] = parentType;
//     _data['user_id'] = userId;
//     _data['text'] = text;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['like_counts'] = likeCounts;
//     _data['user_like'] = userLike;
//     _data['user'] = user.toJson();
//     _data['replies'] = replies;
//     return _data;
//   }
// }
