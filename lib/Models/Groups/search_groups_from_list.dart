class SearchGroupsFromList {
  final int? code;
  final String? message;
  final List<SearchGroupsFromListData>? searchGroupsFromListData;

  SearchGroupsFromList({
    this.code,
    this.message,
    this.searchGroupsFromListData,
  });

  SearchGroupsFromList.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      searchGroupsFromListData = (json['data'] as List?)?.map((dynamic e) => SearchGroupsFromListData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : searchGroupsFromListData?.map((e) => e.toJson()).toList()
  };
}

class SearchGroupsFromListData {
  final int? id;
  final int? userId;
  final String? name;
  final String? createdAt;
  final String? updatedAt;
  final int? cardCounts;

  SearchGroupsFromListData({
    this.id,
    this.userId,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.cardCounts,
  });

  SearchGroupsFromListData.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as int?,
      name = json['name'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      cardCounts = json['card_counts'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'name' : name,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'card_counts' : cardCounts
  };
}