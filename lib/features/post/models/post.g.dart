// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    medias: (json['medias'] as List)
        ?.map(
            (e) => e == null ? null : Media.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    location: json['location'] as String,
    description: json['description'] as String,
    isLoved: json['isLoved'] as bool,
    isSaved: json['isSaved'] as bool,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'user': instance.user?.toJson(),
      'medias': instance.medias?.map((e) => e?.toJson())?.toList(),
      'location': instance.location,
      'description': instance.description,
      'isLoved': instance.isLoved,
      'isSaved': instance.isSaved,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
