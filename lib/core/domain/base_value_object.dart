import 'package:equatable/equatable.dart';

abstract base class BaseValueObject with EquatableMixin {
  const BaseValueObject();

  bool get isValid;
}
