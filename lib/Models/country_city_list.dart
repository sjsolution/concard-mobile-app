class CountryCityListModal {
  final int? code;
  final String? message;
  final List<Countries>? countries;

  CountryCityListModal({
    this.code,
    this.message,
    this.countries,
  });

  CountryCityListModal.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      message = json['message'] as String?,
      countries = (json['data'] as List?)?.map((dynamic e) => Countries.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'data' : countries?.map((e) => e.toJson()).toList()
  };
}

class Countries {
  final int? id;
  final String? title;
  final List<Cities>? cities;

  Countries({
    this.id,
    this.title,
    this.cities,
  });

  Countries.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      title = json['title'] as String?,
      cities = (json['cities'] as List?)?.map((dynamic e) => Cities.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'cities' : cities?.map((e) => e.toJson()).toList()
  };
}

class Cities {
  final int? id;
  final String? countryId;
  final String? title;

  Cities({
    this.id,
    this.countryId,
    this.title,
  });

  Cities.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      countryId = json['country_id'] as String?,
      title = json['title'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'country_id' : countryId,
    'title' : title
  };
}