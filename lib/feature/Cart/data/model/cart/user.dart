import 'package:collection/collection.dart';

class User {
  int? userId;
  String? userName;

  User({this.userId, this.userName});

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json['user_id'] as int?,
        userName: json['user_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'user_name': userName,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => userId.hashCode ^ userName.hashCode;
}
