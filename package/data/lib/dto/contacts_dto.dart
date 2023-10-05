import 'package:json_annotation/json_annotation.dart';

part 'contacts_dto.g.dart';

@JsonSerializable()
class ContactsDTO {
  ContactsDTO(
    this.title,
    this.value,
  );

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'value')
  final String value;

  factory ContactsDTO.fromJson(Map<String, dynamic> json) => _$ContactsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsDTOToJson(this);
}
