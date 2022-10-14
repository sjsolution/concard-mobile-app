import 'package:concard/Models/Indiviuals/team_list_model.dart';

class SearchTeamListModel {
  final List<TeamData>? teamDetail;

  SearchTeamListModel({
    this.teamDetail,
  });

  SearchTeamListModel.fromJson(Map<String, dynamic> json)
      : teamDetail = (json['teams'] as List?)
            ?.map((dynamic e) => TeamData.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'teams': teamDetail?.map((e) => e.toJson()).toList()};
}

// class SearchTeamsList {
//   final int? id;
//   final String? userId;
//   final String? teamName;
//   final String? inviteMember;
//   final String? addCard;
//   final String? deleteCard;
//   final String? deleteMember;
//   final String? slug;
//   final String? createdAt;
//   final String? updatedAt;
//   final String? image;

//   SearchTeamsList({
//     this.id,
//     this.userId,
//     this.teamName,
//     this.inviteMember,
//     this.addCard,
//     this.deleteCard,
//     this.deleteMember,
//     this.slug,
//     this.createdAt,
//     this.updatedAt,
//     this.image,
//   });

//   SearchTeamsList.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int?,
//         userId = json['user_id'] as String?,
//         teamName = json['team_name'] as String?,
//         inviteMember = json['invite_member'] as String?,
//         addCard = json['add_card'] as String?,
//         deleteCard = json['delete_card'] as String?,
//         deleteMember = json['delete_member'] as String?,
//         slug = json['slug'] as String?,
//         createdAt = json['created_at'] as String?,
//         updatedAt = json['updated_at'] as String?,
//         image = json['image'] as String?;

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'user_id': userId,
//         'team_name': teamName,
//         'invite_member': inviteMember,
//         'add_card': addCard,
//         'delete_card': deleteCard,
//         'delete_member': deleteMember,
//         'slug': slug,
//         'created_at': createdAt,
//         'updated_at': updatedAt,
//         'image': image
//       };
// }
