import 'package:collection/collection.dart';

import 'slider.dart';

class Data {
  List<Slider>? sliders;

  Data({this.sliders});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sliders: (json['sliders'] as List<dynamic>?)
            ?.map((e) => Slider.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'sliders': sliders?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => sliders.hashCode;
}
