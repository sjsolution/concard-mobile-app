class SocialLinksModel {
  final int? code;
  final String? message;
  final List<LinksDataList>? linksDataList;

  SocialLinksModel({
    this.code,
    this.message,
    this.linksDataList,
  });

  SocialLinksModel.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      linksDataList = (json['data'] as List?)?.map((dynamic e) => LinksDataList.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : linksDataList?.map((e) => e.toJson()).toList()
  };
}

class LinksDataList {
  final int? id;
  final String? userId;
  final String? title;
  final String? url;
  final String? createdAt;
  final String? updatedAt;
  final String? image;

  LinksDataList({
    this.id,
    this.userId,
    this.title,
    this.url,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  LinksDataList.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as String?,
      title = json['title'] as String?,
      url = json['url'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      image = json['image'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'title' : title,
    'url' : url,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'image' : image
  };
}