import 'package:collection/collection.dart';

import 'cart_item.dart';
import 'user.dart';

class Data {
  int? id;
  User? user;
  String? total;
  List<CartItem>? cartItems;

  Data({this.id, this.user, this.total, this.cartItems});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        total: json['total'] as String?,
        cartItems: (json['cart_items'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user?.toJson(),
        'total': total,
        'cart_items': cartItems?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^ user.hashCode ^ total.hashCode ^ cartItems.hashCode;
}
