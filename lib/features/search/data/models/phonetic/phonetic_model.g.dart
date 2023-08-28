// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phonetic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneticModel _$PhoneticModelFromJson(Map<String, dynamic> json) =>
    PhoneticModel(
      audio: json['audio'] as String,
      phonetic: json['text'] as String? ?? '',
    );

Map<String, dynamic> _$PhoneticModelToJson(PhoneticModel instance) =>
    <String, dynamic>{
      'text': instance.phonetic,
      'audio': instance.audio,
    };
