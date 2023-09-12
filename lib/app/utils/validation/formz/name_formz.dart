import 'package:flutter_modular_todo_list/app/utils/validation/string_validators.dart';
import 'package:formz/formz.dart';

enum NameValidationError {
  empty,
  ;

  String getMessage() {
    switch (this) {
      case empty:
        return 'Name can\'t be empty';
    }
  }
}

class NameFormz extends FormzInput<String, NameValidationError> {
  const NameFormz.pure() : super.pure('');

  const NameFormz.dirty(String value) : super.dirty(value);

  @override
  NameValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return NameValidationError.empty;
    }
    return null;
  }
}
