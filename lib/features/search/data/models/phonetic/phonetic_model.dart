import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'phonetic_model.g.dart';

@JsonSerializable()
class PhoneticModel extends Equatable {
  @JsonKey(name: "text", defaultValue: "")
  final String? phonetic;

  final String audio;

  const PhoneticModel({
    required this.audio,
    this.phonetic,
  });

  factory PhoneticModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneticModelFromJson(json);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [phonetic, audio];
}
