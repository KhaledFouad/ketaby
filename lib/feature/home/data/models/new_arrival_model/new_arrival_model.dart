import 'package:collection/collection.dart';
import 'package:ketaby/feature/home/data/models/best_seller_model/data.dart';

class NewArrivalModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  NewArrivalModel({this.data, this.message, this.error, this.status});

  factory NewArrivalModel.fromJson(Map<String, dynamic> json) {
    return NewArrivalModel(
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
    if (other is! NewArrivalModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      data.hashCode ^ message.hashCode ^ error.hashCode ^ status.hashCode;
}
