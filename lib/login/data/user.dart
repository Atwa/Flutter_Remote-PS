import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User  {
  final String? message;
  final String? name;
  final String? email;
  @JsonKey(name : 'access_token')
  final String? accessToken;

  User({this.message, this.name, this.email, this.accessToken});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}
