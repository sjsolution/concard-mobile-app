class IndustriesListModal {
  final int? code;
  final String? message;
  final List<Industries>? industries;

  IndustriesListModal({
    this.code,
    this.message,
    this.industries,
  });

  IndustriesListModal.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      industries = (json['data'] as List?)?.map((dynamic e) => Industries.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : industries?.map((e) => e.toJson()).toList()
  };
}

class Industries {
  final int? id;
  final String? title;
  final String? description;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  Industries({
    this.id,
    this.title,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Industries.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      title = json['title'] as String?,
      description = json['description'] as String?,
      status = json['status'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'description' : description,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}