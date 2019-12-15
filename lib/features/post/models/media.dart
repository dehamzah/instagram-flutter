import 'package:json_annotation/json_annotation.dart';

part 'media.g.dart';

enum MediaType { image, video }

@JsonSerializable()
class Media {
  final String mediaUrl;
  final MediaType mediaType;

  Media({
    this.mediaUrl,
    this.mediaType,
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}
