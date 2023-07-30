import 'package:ve_news/core/domain/base_value_object.dart';

final class ImageValueObject extends BaseValueObject {
  final String value;

  const ImageValueObject._(this.value);

  factory ImageValueObject.create(String value) {
    return ImageValueObject._(value);
  }

  @override
  bool get isValid => isAsset || isNetwork;

  bool get isAsset => value.contains('assets');

  bool get isNetwork => value.contains('http') || value.contains('https');

  @override
  List<Object?> get props => [value];
}
