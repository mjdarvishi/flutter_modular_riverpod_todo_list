import 'package:flutter_modular_todo_list/app/utils/validation/string_validators.dart';
import 'package:formz/formz.dart';

enum DateValidationError {
  empty,
  ;

  String getMessage() {
    switch (this) {
      case empty:
        return 'Date can\'t be empty';
    }
  }
}

class DateFormz extends FormzInput<String, DateValidationError> {
  const DateFormz.pure() : super.pure('');

  const DateFormz.dirty(String value) : super.dirty(value);

  @override
  DateValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return DateValidationError.empty;
    }
    return null;
  }
}
