// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../contacts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactsDTO _$ContactsDTOFromJson(Map<String, dynamic> json) => ContactsDTO(
      json['mail'] as String,
      json['phone'] as String,
      json['location'] as String,
      json['github_username'] as String,
      json['github_link'] as String,
      json['linkedin_username'] as String,
      json['linkedin_link'] as String,
      json['instagram_username'] as String,
      json['instagram_link'] as String,
      json['facebook_username'] as String,
      json['facebook_link'] as String,
    );

Map<String, dynamic> _$ContactsDTOToJson(ContactsDTO instance) =>
    <String, dynamic>{
      'mail': instance.mail,
      'phone': instance.phone,
      'location': instance.location,
      'github_username': instance.githubUsername,
      'github_link': instance.githubLink,
      'linkedin_username': instance.linkedinUsername,
      'linkedin_link': instance.linkedinLink,
      'instagram_username': instance.instagramUsername,
      'instagram_link': instance.instagramLink,
      'facebook_username': instance.facebookUsername,
      'facebook_link': instance.facebookLink,
    };
