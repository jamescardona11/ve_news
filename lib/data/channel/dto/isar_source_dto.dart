import 'package:isar/isar.dart';

part 'isar_source_dto.g.dart';

@collection
@Name('Channel')
final class IsarSourceDto {
  final Id id;
  final String name;
  final String url;
  final String logo;
  final bool isFavorite;
  final bool isEnabled;

  const IsarSourceDto({
    this.id = Isar.autoIncrement,
    required this.name,
    required this.url,
    required this.logo,
    this.isFavorite = false,
    this.isEnabled = true,
  });

  factory IsarSourceDto.create({
    required String name,
    required String url,
    String logo = '',
    bool isFavorite = false,
    bool isEnabled = true,
  }) =>
      IsarSourceDto(
        name: name,
        url: url,
        logo: logo,
        isFavorite: isFavorite,
        isEnabled: isEnabled,
      );
}
