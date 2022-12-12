class AddCardToGroupModal {
  final int? code;
  final String? message;
  final AddCardsToGroupData? addCradsToGroupData;

  AddCardToGroupModal({
    this.code,
    this.message,
    this.addCradsToGroupData,
  });

  AddCardToGroupModal.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      addCradsToGroupData = (json['data'] as Map<String,dynamic>?) != null ? AddCardsToGroupData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : addCradsToGroupData?.toJson()
  };
}

class AddCardsToGroupData {
  final String? groupId;
  final String? cardId;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  AddCardsToGroupData({
    this.groupId,
    this.cardId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  AddCardsToGroupData.fromJson(Map<String, dynamic> json)
    : groupId = json['group_id'] as String?,
      cardId = json['card_id'] as String?,
      updatedAt = json['updated_at'] as String?,
      createdAt = json['created_at'] as String?,
      id = json['id'] as int?;

  Map<String, dynamic> toJson() => {
    'group_id' : groupId,
    'card_id' : cardId,
    'updated_at' : updatedAt,
    'created_at' : createdAt,
    'id' : id
  };
}