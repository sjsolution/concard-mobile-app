class NotificationModel {
  final int? code;
  final String? message;
  final List<NotificationList>? notificationList;

  NotificationModel({
    this.code,
    this.message,
    this.notificationList,
  });

  NotificationModel.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      notificationList = (json['data'] as List?)?.map((dynamic e) => NotificationList.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : notificationList?.map((e) => e.toJson()).toList()
  };
}

class NotificationList {
  final int? id;
  final String? type;
  final String? notifiableType;
  final String? notifiableId;
  final NotificationPayLoad? notificationPayLoad;
  final dynamic readAt;
  final String? createdAt;
  final String? updatedAt;

  NotificationList({
    this.id,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.notificationPayLoad,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  NotificationList.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      type = json['type'] as String?,
      notifiableType = json['notifiable_type'] as String?,
      notifiableId = json['notifiable_id'] as String?,
      notificationPayLoad = (json['data'] as Map<String,dynamic>?) != null ? NotificationPayLoad.fromJson(json['data'] as Map<String,dynamic>) : null,
      readAt = json['read_at'],
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'type' : type,
    'notifiable_type' : notifiableType,
    'notifiable_id' : notifiableId,
    'data' : notificationPayLoad?.toJson(),
    'read_at' : readAt,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class NotificationPayLoad {
  final int? id;
  final int? parentId;
  final String? parentType;
  final String? username;
  final String? message;
  final String? image;

  NotificationPayLoad({
    this.id,
    this.parentId,
    this.parentType,
    this.username,
    this.message,
    this.image,
  });

  NotificationPayLoad.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      parentId = json['parent_id'] as int?,
      parentType = json['parent_type'] as String?,
      username = json['username'] as String?,
      message = json['message'] as String?,
      image = json['image'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'parent_id' : parentId,
    'parent_type' : parentType,
    'username' : username,
    'message' : message,
    'image' : image
  };
}