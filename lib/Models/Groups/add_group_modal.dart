class AddGroupModal {
  final int? code;
  final String? message;
  final AddCardToGroupData? addCardsToGroupData;

  AddGroupModal({
    this.code,
    this.message,
    this.addCardsToGroupData,
  });

  AddGroupModal.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      addCardsToGroupData = (json['data'] as Map<String,dynamic>?) != null ? AddCardToGroupData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : addCardsToGroupData?.toJson()
  };
}

class AddCardToGroupData {
  final int? userId;
  final String? name;
  final String? updatedAt;
  final String? createdAt;
  final int? id;
  final int? cardCounts;

  AddCardToGroupData({
    this.userId,
    this.name,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.cardCounts,
  });

  AddCardToGroupData.fromJson(Map<String, dynamic> json)
    : userId = json['user_id'] as int?,
      name = json['name'] as String?,
      updatedAt = json['updated_at'] as String?,
      createdAt = json['created_at'] as String?,
      id = json['id'] as int?,
      cardCounts = json['card_counts'] as int?;

  Map<String, dynamic> toJson() => {
    'user_id' : userId,
    'name' : name,
    'updated_at' : updatedAt,
    'created_at' : createdAt,
    'id' : id,
    'card_counts' : cardCounts
  };
}