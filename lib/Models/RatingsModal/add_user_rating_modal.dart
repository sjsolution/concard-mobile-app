class AddUserRatingModal {
  final int? code;
  final String? message;
  final RatingData? ratingData;

  AddUserRatingModal({
    this.code,
    this.message,
    this.ratingData,
  });

  AddUserRatingModal.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      ratingData = (json['data'] as Map<String,dynamic>?) != null ? RatingData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : ratingData?.toJson()
  };
}

class RatingData {
  final int? userId;
  final String? text;
  final String? rate;
  final String? parentType;
  final String? parentId;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  RatingData({
    this.userId,
    this.text,
    this.rate,
    this.parentType,
    this.parentId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  RatingData.fromJson(Map<String, dynamic> json)
    : userId = json['user_id'] as int?,
      text = json['text'] as String?,
      rate = json['rate'] as String?,
      parentType = json['parent_type'] as String?,
      parentId = json['parent_id'] as String?,
      updatedAt = json['updated_at'] as String?,
      createdAt = json['created_at'] as String?,
      id = json['id'] as int?;

  Map<String, dynamic> toJson() => {
    'user_id' : userId,
    'text' : text,
    'rate' : rate,
    'parent_type' : parentType,
    'parent_id' : parentId,
    'updated_at' : updatedAt,
    'created_at' : createdAt,
    'id' : id
  };
}