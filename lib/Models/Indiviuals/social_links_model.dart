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
        linksDataList = (json['data'] as List?)?.map((dynamic e) => LinksDataList.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {'code': code, 'message': message, 'data': linksDataList?.map((e) => e.toJson()).toList()};
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
        userId = json['user_id'].toString(),
        title = json['title'].toString(),
        url = json['url'].toString(),
        createdAt = json['created_at'].toString(),
        updatedAt = json['updated_at'].toString(),
        image = json['image'].toString();

  Map<String, dynamic> toJson() =>
      {'id': id, 'user_id': userId, 'title': title, 'url': url, 'created_at': createdAt, 'updated_at': updatedAt, 'image': image};
}
