import 'package:collection/collection.dart';

import 'data.dart';

class BestSellerModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  BestSellerModel({this.data, this.message, this.error, this.status});

  factory BestSellerModel.fromJson(Map<String, dynamic> json) {
    return BestSellerModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'message': message,
        'error': error,
        'status': status,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BestSellerModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      data.hashCode ^ message.hashCode ^ error.hashCode ^ status.hashCode;
}
