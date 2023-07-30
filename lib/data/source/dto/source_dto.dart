import 'package:isar/isar.dart';
import 'package:ve_news/common/domain/models/image_value_object.dart';
import 'package:ve_news/domain/source/source_model.dart';

part 'source_dto.g.dart';

@collection
@Name('Channel')
final class SourceDto {
  final Id id;
  final String name;
  final String url;
  final String logo;
  final bool isFavorite;
  final bool isEnabled;

  const SourceDto({
    this.id = Isar.autoIncrement,
    required this.name,
    required this.url,
    required this.logo,
    this.isFavorite = false,
    this.isEnabled = true,
  });

  factory SourceDto.create({
    required String name,
    required String url,
    String logo = '',
    bool isFavorite = false,
    bool isEnabled = true,
  }) =>
      SourceDto(
        name: name,
        url: url,
        logo: logo,
        isFavorite: isFavorite,
        isEnabled: isEnabled,
      );

  SourceModel toModel() => SourceModel(
        id: id,
        name: name,
        url: url,
        logo: ImageValueObject.create(logo),
        isFavorite: isFavorite,
        isEnabled: isEnabled,
      );
}
