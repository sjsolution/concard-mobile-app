class EmployeeCountListModal {
  final int? code;
  final String? message;
  final List<NoOfEmployees>? noOfEmployees;

  EmployeeCountListModal({
    this.code,
    this.message,
    this.noOfEmployees,
  });

  EmployeeCountListModal.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        message = json['message'] as String?,
        noOfEmployees = (json['data'] as List?)
            ?.map((dynamic e) =>
                NoOfEmployees.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': noOfEmployees?.map((e) => e.toJson()).toList()
      };
}

class NoOfEmployees {
  final int? id;
  final String? number;

  NoOfEmployees({
    this.id,
    this.number,
  });

  NoOfEmployees.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        number = json['number'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'number': number};
}
