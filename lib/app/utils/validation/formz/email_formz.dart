import 'package:flutter_modular_todo_list/app/utils/validation/string_validators.dart';
import 'package:formz/formz.dart';

enum EmailValidationError {
  empty,
  invalid,
  ;

  String getMessage() {
    switch (this) {
      case empty:
        return 'Email can\'t be empty';
      case invalid:
        return 'Invalid email';
    }
  }
}

class EmailFormz extends FormzInput<String, EmailValidationError> {
  const EmailFormz.pure() : super.pure('');

  const EmailFormz.dirty(String value) : super.dirty(value);

  @override
  EmailValidationError? validator(String value) {
    if (value.length < 4) return EmailValidationError.empty;

    if (!EmailSubmitRegexValidator().isValid(value)) {
      return EmailValidationError.invalid;
    }

    return null;
  }
}
