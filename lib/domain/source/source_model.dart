import 'package:equatable/equatable.dart';
import 'package:ve_news/common/domain/models/image_value_object.dart';

final class SourceModel with EquatableMixin {
  final int? id;
  final String name;
  final String url;
  final ImageValueObject logo;
  final bool isFavorite;
  final bool isEnabled;

  const SourceModel({
    this.id,
    required this.name,
    required this.url,
    required this.logo,
    this.isFavorite = false,
    this.isEnabled = true,
  });

  bool get hasLogo => logo.isValid;
  bool get longName => name.length > 10;

  String get formatName {
    final nameParts = name.split(' ');
    if (nameParts.length > 2) {
      return '${nameParts[0]} ${nameParts[1]}\n${nameParts[2]}';
    } else if (nameParts.length == 2 && longName) {
      return '${nameParts[0]}\n${nameParts[1]}';
    } else {
      return name;
    }
  }

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
