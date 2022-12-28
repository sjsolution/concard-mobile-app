class ChatListModel {
  final List<Messages>? messages;

  ChatListModel({
    this.messages,
  });

  ChatListModel.fromJson(Map<String, dynamic> json)
    : messages = (json['messages'] as List?)?.map((dynamic e) => Messages.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'messages' : messages?.map((e) => e.toJson()).toList()
  };
}

class Messages {
  final int? id;
  final String? userId;
  final String? conversationId;
  final String? text;
  final String? createdAt;
  final String? updatedAt;

  Messages({
    this.id,
    this.userId,
    this.conversationId,
    this.text,
    this.createdAt,
    this.updatedAt,
  });

  Messages.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'].toString(),
      conversationId = json['conversation_id'].toString(),
      text = json['text'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'conversation_id' : conversationId,
    'text' : text,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}