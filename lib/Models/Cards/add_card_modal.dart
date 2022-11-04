class AddCardModel {
  final List<AddCardsData>? addCardsData;

  AddCardModel({
    this.addCardsData,
  });

  AddCardModel.fromJson(Map<String, dynamic> json)
    : addCardsData = (json['cards'] as List?)?.map((dynamic e) => AddCardsData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'cards' : addCardsData?.map((e) => e.toJson()).toList()
  };
}

class AddCardsData {
  final String? companyName;
  final String? website;
  final String? field;
  final String? country;
  final String? province;
  final String? city;
  final String? postalCode;
  final String? address;
  final int? day;
  final int? month;
  final int? year;
  final String? location;
  final String? username;
  final String? jobTitle;
  final String? meetingDateTime;
  final List<String>? emails;
  final List<PhoneNumbers>? phoneNumbers;

  AddCardsData({
    this.companyName,
    this.website,
    this.field,
    this.country,
    this.province,
    this.city,
    this.postalCode,
    this.address,
    this.day,
    this.month,
    this.year,
    this.location,
    this.username,
    this.jobTitle,
    this.meetingDateTime,
    this.emails,
    this.phoneNumbers,
  });

  AddCardsData.fromJson(Map<String, dynamic> json)
    : companyName = json['company_name'] as String?,
      website = json['website'] as String?,
      field = json['field'] as String?,
      country = json['country'] as String?,
      province = json['province'] as String?,
      city = json['city'] as String?,
      postalCode = json['postal_code'] as String?,
      address = json['address'] as String?,
      day = json['day'] as int?,
      month = json['month'] as int?,
      year = json['year'] as int?,
      location = json['location'] as String?,
      username = json['username'] as String?,
      jobTitle = json['job_title'] as String?,
      meetingDateTime = json['meeting_date_time'] as String?,
      emails = (json['emails'] as List?)?.map((dynamic e) => e as String).toList(),
      phoneNumbers = (json['phone_numbers'] as List?)?.map((dynamic e) => PhoneNumbers.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'company_name' : companyName,
    'website' : website,
    'field' : field,
    'country' : country,
    'province' : province,
    'city' : city,
    'postal_code' : postalCode,
    'address' : address,
    'day' : day,
    'month' : month,
    'year' : year,
    'location' : location,
    'username' : username,
    'job_title' : jobTitle,
    'meeting_date_time' : meetingDateTime,
    'emails' : emails,
    'phone_numbers' : phoneNumbers?.map((e) => e.toJson()).toList()
  };
}

class PhoneNumbers {
  final String? type;
  final String? phoneNumber;

  PhoneNumbers({
    this.type,
    this.phoneNumber,
  });

  PhoneNumbers.fromJson(Map<String, dynamic> json)
    : type = json['type'] as String?,
      phoneNumber = json['phone_number'] as String?;

  Map<String, dynamic> toJson() => {
    'type' : type,
    'phone_number' : phoneNumber
  };
}