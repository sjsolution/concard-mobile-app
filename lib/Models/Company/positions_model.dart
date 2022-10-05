class PositionModel {
  final int? code;
  final String? message;
  final List<Positions>? positions;

  PositionModel({
    this.code,
    this.message,
    this.positions,
  });

  PositionModel.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        message = json['message'] as String?,
        positions = (json['data'] as List?)
            ?.map((dynamic e) => Positions.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': positions?.map((e) => e.toJson()).toList()
      };
}

class Positions {
  final int? id;
  final String? title;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  Positions({
    this.id,
    this.title,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Positions.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        status = json['status'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}
