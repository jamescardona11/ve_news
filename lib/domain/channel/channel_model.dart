import 'package:equatable/equatable.dart';
import 'package:ve_news/cross/domain/models/image_value_object.dart';

final class ChannelModel with EquatableMixin {
  final String id;
  final String name;
  final String code;
  final ImageValueObject logo;

  const ChannelModel({
    this.id = '',
    required this.name,
    required this.code,
    required this.logo,
  });

  @override
  List<Object?> get props => [
        name,
        code,
        logo,
      ];
}
