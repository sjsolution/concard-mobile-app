class AddCardToGroupModal {
  final int? code;
  final String? message;
  final AddCardToGropuData? addCardToGroupData;

  AddCardToGroupModal({
    this.code,
    this.message,
    this.addCardToGroupData,
  });

  AddCardToGroupModal.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      addCardToGroupData = (json['data'] as Map<String,dynamic>?) != null ? AddCardToGropuData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : addCardToGroupData?.toJson()
  };
}

class AddCardToGropuData {
  final int? id;
  final int? groupId;
  final int? cardId;
  final String? createdAt;
  final String? updatedAt;

  AddCardToGropuData({
    this.id,
    this.groupId,
    this.cardId,
    this.createdAt,
    this.updatedAt,
  });

  AddCardToGropuData.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      groupId = json['group_id'] as int?,
      cardId = json['card_id'] as int?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'group_id' : groupId,
    'card_id' : cardId,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}