import 'package:flutter_modular_todo_list/app/utils/validation/string_validators.dart';
import 'package:formz/formz.dart';

enum DesValidationError {
  empty,
  ;

  String getMessage() {
    switch (this) {
      case empty:
        return 'Des can\'t be empty';
    }
  }
}

class DesFormz extends FormzInput<String, DesValidationError> {
  const DesFormz.pure() : super.pure('');

  const DesFormz.dirty(String value) : super.dirty(value);

  @override
  DesValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return DesValidationError.empty;
    }
    return null;
  }
}
