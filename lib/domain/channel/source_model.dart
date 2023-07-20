import 'package:equatable/equatable.dart';
import 'package:ve_news/cross/domain/models/image_value_object.dart';

final class SourceModel with EquatableMixin {
  final String id;
  final String name;
  final String url;
  final ImageValueObject logo;
  final bool isFavorite;
  final bool isEnabled;

  const SourceModel({
    this.id = '',
    required this.name,
    required this.url,
    required this.logo,
    this.isFavorite = false,
    this.isEnabled = true,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        url,
        logo,
        isFavorite,
        isEnabled,
      ];
}
