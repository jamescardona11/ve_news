import 'package:isar/isar.dart';

part 'isar_channel_dto.g.dart';

@collection
@Name('Channel')
final class IsarChannelDto {
  final Id id;
  final String name;
  final String code;
  final String logo;

  const IsarChannelDto({
    this.id = Isar.autoIncrement,
    required this.name,
    required this.code,
    required this.logo,
  });

  factory IsarChannelDto.create({
    required String name,
    required String code,
    String logo = '',
  }) =>
      IsarChannelDto(
        name: name,
        code: code,
        logo: logo,
      );
}
