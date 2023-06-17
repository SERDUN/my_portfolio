import 'package:json_annotation/json_annotation.dart';

part 'contacts_dto.g.dart';

@JsonSerializable()
class ContactsDTO {
  @JsonKey(name: 'mail')
  final String mail;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'location')
  final String location;

  @JsonKey(name: 'github_username')
  final String githubUsername;

  @JsonKey(name: 'github_link')
  final String githubLink;

  @JsonKey(name: 'linkedin_username')
  final String linkedinUsername;

  @JsonKey(name: 'linkedin_link')
  final String linkedinLink;

  @JsonKey(name: 'instagram_username')
  final String instagramUsername;

  @JsonKey(name: 'instagram_link')
  final String instagramLink;

  @JsonKey(name: 'facebook_username')
  final String facebookUsername;

  @JsonKey(name: 'facebook_link')
  final String facebookLink;

  ContactsDTO(
      this.mail,
      this.phone,
      this.location,
      this.githubUsername,
      this.githubLink,
      this.linkedinUsername,
      this.linkedinLink,
      this.instagramUsername,
      this.instagramLink,
      this.facebookUsername,
      this.facebookLink);

  factory ContactsDTO.fromJson(Map<String, dynamic> json) =>
      _$ContactsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsDTOToJson(this);
}
