import 'package:json_annotation/json_annotation.dart';

part 'contact_dto.g.dart';

@JsonSerializable()
class ContactDTO {
  ContactDTO(this.title, this.value);

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'value')
  final String value;

  factory ContactDTO.fromJson(Map<String, dynamic> json) => _$ContactDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ContactDTOToJson(this);
}
