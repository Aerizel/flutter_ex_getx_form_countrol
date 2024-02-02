import 'package:flutter/widgets.dart';

class Validators {
  static FormFieldValidator<String> required(String errMsg) {
    return (value) {
      if (value == null) {
        return errMsg;
      } else if (value.isEmpty) {
        return errMsg;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String> minLength(int minLength, String errMsg) {
    return (value) {
      if (value!.trim().isEmpty) {
        return null;
      } else {
        if (value.length < minLength) {
          return errMsg;
        } else {
          return null;
        }
      }
    };
  }

  static FormFieldValidator<String> maxLength(int maxLength, String errMsg) {
    return (value) {
      if(value!.trim().isEmpty) {
        return null;
      } else {
        if(value.length > maxLength) {
          return errMsg;
        } else {
          return null;
        }
      }
    };
  }

  static FormFieldValidator<String> compose(
      List<FormFieldValidator<String>> validators) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }
}
