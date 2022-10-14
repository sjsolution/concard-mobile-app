class TeamDetailModel {
  final TeamDetailData? teamDetailData;
  final String? teamInviteLink;

  TeamDetailModel({
    this.teamDetailData,
    this.teamInviteLink,
  });

  TeamDetailModel.fromJson(Map<String, dynamic> json)
      : teamDetailData = (json['team'] as Map<String, dynamic>?) != null
            ? TeamDetailData.fromJson(json['team'] as Map<String, dynamic>)
            : null,
        teamInviteLink = json['invite_link'] as String?;

  Map<String, dynamic> toJson() =>
      {'team': teamDetailData?.toJson(), 'invite_link': teamInviteLink};
}

class TeamDetailData {
  final int? id;
  final String? userId;
  final String? teamName;
  final String? inviteMember;
  final String? addCard;
  final String? deleteCard;
  final String? deleteMember;
  final String? slug;
  final String? createdAt;
  final String? updatedAt;
  final String? image;
  final List<TeamMembers>? teamMembers;

  TeamDetailData({
    this.id,
    this.userId,
    this.teamName,
    this.inviteMember,
    this.addCard,
    this.deleteCard,
    this.deleteMember,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.teamMembers,
  });

  TeamDetailData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'] as String?,
        teamName = json['team_name'] as String?,
        inviteMember = json['invite_member'] as String?,
        addCard = json['add_card'] as String?,
        deleteCard = json['delete_card'] as String?,
        deleteMember = json['delete_member'] as String?,
        slug = json['slug'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        image = json['image'] as String?,
        teamMembers = (json['members'] as List?)
            ?.map(
                (dynamic e) => TeamMembers.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'team_name': teamName,
        'invite_member': inviteMember,
        'add_card': addCard,
        'delete_card': deleteCard,
        'delete_member': deleteMember,
        'slug': slug,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image,
        'members': teamMembers?.map((e) => e.toJson()).toList()
      };
}

class TeamMembers {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? mobileNumber;
  final String? email;
  final String? userType;
  final dynamic emailVerifiedAt;
  final String? jobTitle;
  final String? website;
  final String? companyName;
  final String? companyField;
  final String? about;
  final String? workTel;
  final dynamic mobileTel;
  final String? city;
  final String? state;
  final String? country;
  final String? postalCode;
  final String? address;
  final String? createdAt;
  final String? updatedAt;
  final String? image;
  final String? card;
  final String? logo;
  final String? profileImage;
  final Pivot? pivot;

  TeamMembers({
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
    this.pivot,
  });

  TeamMembers.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        firstName = json['first_name'] as String?,
        lastName = json['last_name'] as String?,
        mobileNumber = json['mobile_number'] as String?,
        email = json['email'] as String?,
        userType = json['user_type'] as String?,
        emailVerifiedAt = json['email_verified_at'],
        jobTitle = json['job_title'] as String?,
        website = json['website'] as String?,
        companyName = json['company_name'] as String?,
        companyField = json['company_field'] as String?,
        about = json['about'] as String?,
        workTel = json['work_tel'] as String?,
        mobileTel = json['mobile_tel'],
        city = json['city'] as String?,
        state = json['state'] as String?,
        country = json['country'] as String?,
        postalCode = json['postal_code'] as String?,
        address = json['address'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        image = json['image'] as String?,
        card = json['card'] as String?,
        logo = json['logo'] as String?,
        profileImage = json['profileImage'] as String?,
        pivot = (json['pivot'] as Map<String, dynamic>?) != null
            ? Pivot.fromJson(json['pivot'] as Map<String, dynamic>)
            : null;

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
        'profileImage': profileImage,
        'pivot': pivot?.toJson()
      };
}

class Pivot {
  final String? teamId;
  final String? userId;

  Pivot({
    this.teamId,
    this.userId,
  });

  Pivot.fromJson(Map<String, dynamic> json)
      : teamId = json['team_id'] as String?,
        userId = json['user_id'] as String?;

  Map<String, dynamic> toJson() => {'team_id': teamId, 'user_id': userId};
}
