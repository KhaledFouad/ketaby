import 'package:collection/collection.dart';
import 'package:ketaby/feature/books/data/model/books_model/product.dart';

class Data {
  List<Product>? products;

  Data({this.products});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'products': products?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => products.hashCode;
}
