import 'package:collection/collection.dart';

class Slider {
  String? image;

  Slider({this.image});

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'image': image,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Slider) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => image.hashCode;
}
