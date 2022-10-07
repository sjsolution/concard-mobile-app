class SearchConversationModel {
  final int? count;
  final List<SearchConversations>? searchConversations;

  SearchConversationModel({
    this.count,
    this.searchConversations,
  });

  SearchConversationModel.fromJson(Map<String, dynamic> json)
      : count = json['count'] as int?,
        searchConversations = (json['conversations'] as List?)
            ?.map((dynamic e) =>
                SearchConversations.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'count': count,
        'conversations': searchConversations?.map((e) => e.toJson()).toList()
      };
}

class SearchConversations {
  final int? id;
  final String? moderatorId;
  final String? participantId;
  final String? createdAt;
  final String? updatedAt;
  final Recipient? recipient;
  final SearchMessage? searchMessage;
  final List<SearchMessages>? searchMessages;

  SearchConversations({
    this.id,
    this.moderatorId,
    this.participantId,
    this.createdAt,
    this.updatedAt,
    this.recipient,
    this.searchMessage,
    this.searchMessages,
  });

  SearchConversations.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        moderatorId = json['moderator_id'] as String?,
        participantId = json['participant_id'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        recipient = (json['recipient'] as Map<String, dynamic>?) != null
            ? Recipient.fromJson(json['recipient'] as Map<String, dynamic>)
            : null,
        searchMessage = (json['message'] as Map<String, dynamic>?) != null
            ? SearchMessage.fromJson(json['message'] as Map<String, dynamic>)
            : null,
        searchMessages = (json['messages'] as List?)
            ?.map((dynamic e) =>
                SearchMessages.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'moderator_id': moderatorId,
        'participant_id': participantId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'recipient': recipient?.toJson(),
        'message': searchMessage?.toJson(),
        'messages': searchMessages?.map((e) => e.toJson()).toList()
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
  final dynamic jobTitle;
  final dynamic website;
  final dynamic companyName;
  final dynamic companyField;
  final dynamic about;
  final dynamic workTel;
  final dynamic mobileTel;
  final dynamic city;
  final dynamic state;
  final dynamic country;
  final dynamic postalCode;
  final dynamic address;
  final String? createdAt;
  final String? updatedAt;
  final String? image;
  final String? card;
  final String? logo;
  final String? profileImage;

  Recipient({
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
  });

  Recipient.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        firstName = json['first_name'] as String?,
        lastName = json['last_name'] as String?,
        mobileNumber = json['mobile_number'] as String?,
        email = json['email'] as String?,
        userType = json['user_type'] as String?,
        emailVerifiedAt = json['email_verified_at'],
        jobTitle = json['job_title'],
        website = json['website'],
        companyName = json['company_name'],
        companyField = json['company_field'],
        about = json['about'],
        workTel = json['work_tel'],
        mobileTel = json['mobile_tel'],
        city = json['city'],
        state = json['state'],
        country = json['country'],
        postalCode = json['postal_code'],
        address = json['address'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        image = json['image'] as String?,
        card = json['card'] as String?,
        logo = json['logo'] as String?,
        profileImage = json['profileImage'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'mobile_number': mobileNumber,
        'email': email,
        'user_type': userType,
        'email_verified_at': emailVerifiedAt,
        'job_title': jobTitle,
        'website': website,
        'company_name': companyName,
        'company_field': companyField,
        'about': about,
        'work_tel': workTel,
        'mobile_tel': mobileTel,
        'city': city,
        'state': state,
        'country': country,
        'postal_code': postalCode,
        'address': address,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image,
        'card': card,
        'logo': logo,
        'profileImage': profileImage
      };
}

class SearchMessage {
  final String? text;

  SearchMessage({
    this.text,
  });

  SearchMessage.fromJson(Map<String, dynamic> json)
      : text = json['text'] as String?;

  Map<String, dynamic> toJson() => {'text': text};
}

class SearchMessages {
  final int? id;
  final String? userId;
  final String? conversationId;
  final String? text;
  final String? createdAt;
  final String? updatedAt;

  SearchMessages({
    this.id,
    this.userId,
    this.conversationId,
    this.text,
    this.createdAt,
    this.updatedAt,
  });

  SearchMessages.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'] as String?,
        conversationId = json['conversation_id'] as String?,
        text = json['text'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'conversation_id': conversationId,
        'text': text,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}
