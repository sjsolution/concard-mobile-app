class NotificationsListModel {
  final int? code;
  final String? message;
  final NotificationsData? notificationsData;

  NotificationsListModel({
    this.code,
    this.message,
    this.notificationsData,
  });

  NotificationsListModel.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      notificationsData = (json['data'] as Map<String,dynamic>?) != null ? NotificationsData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : notificationsData?.toJson()
  };
}

class NotificationsData {
  final List<NewNotifications>? newNotifications;
  final List<TodayNotifications>? todayNotifications;
  final List<RecentNotifications>? recentNotifications;

  NotificationsData({
    this.newNotifications,
    this.todayNotifications,
    this.recentNotifications,
  });

  NotificationsData.fromJson(Map<String, dynamic> json)
    : newNotifications = (json['new_notifications'] as List?)?.map((dynamic e) => NewNotifications.fromJson(e as Map<String,dynamic>)).toList(),
      todayNotifications = (json['today_notifications'] as List?)?.map((dynamic e) => TodayNotifications.fromJson(e as Map<String,dynamic>)).toList(),
      recentNotifications = (json['recent_notifications'] as List?)?.map((dynamic e) => RecentNotifications.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'new_notifications' : newNotifications?.map((e) => e.toJson()).toList(),
    'today_notifications' : todayNotifications?.map((e) => e.toJson()).toList(),
    'recent_notifications' : recentNotifications?.map((e) => e.toJson()).toList()
  };
}

class NewNotifications {
  final int? id;
  final String? type;
  final String? notifiableType;
  final int? notifiableId;
  final Data? data;
  final dynamic readAt;
  final String? createdAt;
  final String? updatedAt;

  NewNotifications({
    this.id,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  NewNotifications.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      type = json['type'] as String?,
      notifiableType = json['notifiable_type'] as String?,
      notifiableId = json['notifiable_id'] as int?,
      data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null,
      readAt = json['read_at'],
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'type' : type,
    'notifiable_type' : notifiableType,
    'notifiable_id' : notifiableId,
    'data' : data?.toJson(),
    'read_at' : readAt,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

// class Data {
//   final int? senderId;
//   final int? btn;
//   final int? parentId;
//   final String? parentType;
//   final String? username;
//   final String? message;
//   final String? image;

//   Data({
//     this.senderId,
//     this.btn,
//     this.parentId,
//     this.parentType,
//     this.username,
//     this.message,
//     this.image,
//   });

//   Data.fromJson(Map<String, dynamic> json)
//     : senderId = json['sender_id'] as int?,
//       btn = json['btn'] as int?,
//       parentId = json['parent_id'] as int?,
//       parentType = json['parent_type'] as String?,
//       username = json['username'] as String?,
//       message = json['message'] as String?,
//       image = json['image'] as String?;

//   Map<String, dynamic> toJson() => {
//     'sender_id' : senderId,
//     'btn' : btn,
//     'parent_id' : parentId,
//     'parent_type' : parentType,
//     'username' : username,
//     'message' : message,
//     'image' : image
//   };
// }

class TodayNotifications {
  final int? id;
  final String? type;
  final String? notifiableType;
  final int? notifiableId;
  final Data? data;
  final dynamic readAt;
  final String? createdAt;
  final String? updatedAt;

  TodayNotifications({
    this.id,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  TodayNotifications.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      type = json['type'] as String?,
      notifiableType = json['notifiable_type'] as String?,
      notifiableId = json['notifiable_id'] as int?,
      data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null,
      readAt = json['read_at'],
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'type' : type,
    'notifiable_type' : notifiableType,
    'notifiable_id' : notifiableId,
    'data' : data?.toJson(),
    'read_at' : readAt,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}
class RecentNotifications {
  final int? id;
  final String? type;
  final String? notifiableType;
  final int? notifiableId;
  final Data? data;
  final dynamic readAt;
  final String? createdAt;
  final String? updatedAt;

  RecentNotifications({
    this.id,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  RecentNotifications.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      type = json['type'] as String?,
      notifiableType = json['notifiable_type'] as String?,
      notifiableId = json['notifiable_id'] as int?,
      data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null,
      readAt = json['read_at'],
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'type' : type,
    'notifiable_type' : notifiableType,
    'notifiable_id' : notifiableId,
    'data' : data?.toJson(),
    'read_at' : readAt,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class Data {
  final int? senderId;
  final int? btn;
  final int? parentId;
  final String? parentType;
  final String? username;
  final String? message;
  final String? image;

  Data({
    this.senderId,
    this.btn,
    this.parentId,
    this.parentType,
    this.username,
    this.message,
    this.image,
  });

  Data.fromJson(Map<String, dynamic> json)
    : senderId = json['sender_id'] as int?,
      btn = json['btn'] as int?,
      parentId = json['parent_id'] as int?,
      parentType = json['parent_type'] as String?,
      username = json['username'] as String?,
      message = json['message'] as String?,
      image = json['image'] as String?;

  Map<String, dynamic> toJson() => {
    'sender_id' : senderId,
    'btn' : btn,
    'parent_id' : parentId,
    'parent_type' : parentType,
    'username' : username,
    'message' : message,
    'image' : image
  };
}