class TeamDetailModel {
  final SingleTeam? team;
  final String? inviteLink;

  TeamDetailModel({
    this.team,
    this.inviteLink,
  });

  TeamDetailModel.fromJson(Map<String, dynamic> json)
      : team = (json['team'] as Map<String, dynamic>?) != null
            ? SingleTeam.fromJson(json['team'] as Map<String, dynamic>)
            : null,
        inviteLink = json['invite_link'] as String?;

  Map<String, dynamic> toJson() =>
      {'team': team?.toJson(), 'invite_link': inviteLink};
}

class SingleTeam {
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

  SingleTeam({
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
  });

  SingleTeam.fromJson(Map<String, dynamic> json)
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
        image = json['image'] as String?;

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
        'image': image
      };
}
