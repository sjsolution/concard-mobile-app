class ConversationsListModel {
  final int? count;
  final int? totalUnread;
  final List<Conversations>? conversations;

  ConversationsListModel({
    this.count,
    this.totalUnread,
    this.conversations,
  });

  ConversationsListModel.fromJson(Map<String, dynamic> json)
    : count = json['count'] as int?,
      totalUnread = json['totalUnread'] as int?,
      conversations = (json['conversations'] as List?)?.map((dynamic e) => Conversations.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'count' : count,
    'totalUnread' : totalUnread,
    'conversations' : conversations?.map((e) => e.toJson()).toList()
  };
}

class Conversations {
  final int? id;
  final String? moderatorId;
  final String? participantId;
  final String? createdAt;
  final String? updatedAt;
  final Recipient? recipient;
  final Message? message;
  final int? unreadCounts;
  final List<Messages>? messages;

  Conversations({
    this.id,
    this.moderatorId,
    this.participantId,
    this.createdAt,
    this.updatedAt,
    this.recipient,
    this.message,
    this.unreadCounts,
    this.messages,
  });

  Conversations.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      moderatorId = json['moderator_id'] .toString(),
      participantId = json['participant_id'] .toString(),
      createdAt = json['created_at'] .toString(),
      updatedAt = json['updated_at'] .toString(),
      recipient = (json['recipient'] as Map<String,dynamic>?) != null ? Recipient.fromJson(json['recipient'] as Map<String,dynamic>) : null,
      message = (json['message'] as Map<String,dynamic>?) != null ? Message.fromJson(json['message'] as Map<String,dynamic>) : null,
      unreadCounts = json['unread_counts'] as int?,
      messages = (json['messages'] as List?)?.map((dynamic e) => Messages.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'moderator_id' : moderatorId,
    'participant_id' : participantId,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'recipient' : recipient?.toJson(),
    'message' : message?.toJson(),
    'unread_counts' : unreadCounts,
    'messages' : messages?.map((e) => e.toJson()).toList()
  };
}

class Recipient {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? mobileNumber;
  final String? email;
  final String? userType;
  final dynamic emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? image;

  Recipient({
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

  Recipient.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      firstName = json['first_name'].toString(),
      lastName = json['last_name'].toString(),
      mobileNumber = json['mobile_number'].toString(),
      email = json['email'].toString(),
      userType = json['user_type'].toString(),
      emailVerifiedAt = json['email_verified_at'],
      createdAt = json['created_at'].toString(),
      updatedAt = json['updated_at'].toString(),
      image = json['image'].toString();

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

class Message {
  final String? text;

  Message({
    this.text,
  });

  Message.fromJson(Map<String, dynamic> json)
    : text = json['text'] as String?;

  Map<String, dynamic> toJson() => {
    'text' : text
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
      text = json['text'].toString(),
      createdAt = json['created_at'].toString(),
      updatedAt = json['updated_at'].toString();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'conversation_id' : conversationId,
    'text' : text,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}