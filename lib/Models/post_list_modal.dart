class PostsListModal {
  final int? code;
  final String? message;
  final List<Posts>? posts;

  PostsListModal({
    this.code,
    this.message,
    this.posts,
  });

  PostsListModal.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      posts = (json['data'] as List?)?.map((dynamic e) => Posts.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : posts?.map((e) => e.toJson()).toList()
  };
}

class Posts {
  final int? id;
  final String? userId;
  final String? text;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? image;
  final int? likeCounts;
  final int? userLike;
  final User? user;
  final List<Comments>? comments;

  Posts({
    this.id,
    this.userId,
    this.text,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.likeCounts,
    this.userLike,
    this.user,
    this.comments,
  });

  Posts.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as String?,
      text = json['text'] as String?,
      status = json['status'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      image = json['image'] as String?,
      likeCounts = json['like_counts'] as int?,
      userLike = json['user_like'] as int?,
      user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null,
      comments = (json['comments'] as List?)?.map((dynamic e) => Comments.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'text' : text,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'image' : image,
    'like_counts' : likeCounts,
    'user_like' : userLike,
    'user' : user?.toJson(),
    'comments' : comments?.map((e) => e.toJson()).toList()
  };
}

class Comments {
  final int? id;
  final String? parentId;
  final String? parentType;
  final String? userId;
  final String? text;
  final String? createdAt;
  final String? updatedAt;
  final int? likeCounts;
  final int? userLike;
  final User? user;
  final List<Replies>? replies;

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

  Comments.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      parentId = json['parent_id'] as String?,
      parentType = json['parent_type'] as String?,
      userId = json['user_id'] as String?,
      text = json['text'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      likeCounts = json['like_counts'] as int?,
      userLike = json['user_like'] as int?,
      user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null,
      replies = (json['replies'] as List?)?.map((dynamic e) => Replies.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'parent_id' : parentId,
    'parent_type' : parentType,
    'user_id' : userId,
    'text' : text,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'like_counts' : likeCounts,
    'user_like' : userLike,
    'user' : user?.toJson(),
    'replies' : replies?.map((e) => e.toJson()).toList()
  };
}

class Replies {
  final int? id;
  final String? parentId;
  final String? parentType;
  final String? userId;
  final String? text;
  final String? createdAt;
  final String? updatedAt;
  final int? likeCounts;
  final int? userLike;
  final User? user;
  final List<Replies>? replies;

  Replies({
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

  Replies.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      parentId = json['parent_id'] as String?,
      parentType = json['parent_type'] as String?,
      userId = json['user_id'] as String?,
      text = json['text'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      likeCounts = json['like_counts'] as int?,
      userLike = json['user_like'] as int?,
      user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null,
      replies = (json['replies'] as List?)?.map((dynamic e) => Replies.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'parent_id' : parentId,
    'parent_type' : parentType,
    'user_id' : userId,
    'text' : text,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'like_counts' : likeCounts,
    'user_like' : userLike,
    'user' : user?.toJson(),
    'replies' : replies?.map((e) => e.toJson()).toList()
  };
}

class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? mobileNumber;
  final String? email;
  final String? userType;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? image;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.email,
    this.userType,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      firstName = json['first_name'] as String?,
      lastName = json['last_name'] as String?,
      mobileNumber = json['mobile_number'] as String?,
      email = json['email'] as String?,
      userType = json['user_type'] as String?,
      emailVerifiedAt = json['email_verified_at'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      image = json['image'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'first_name' : firstName,
    'last_name' : lastName,
    'mobile_number' : mobileNumber,
    'email' : email,
    'user_type' : userType,
    'email_verified_at' : emailVerifiedAt,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'image' : image
  };
}