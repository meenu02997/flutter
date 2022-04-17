import 'package:intl/intl.dart';

mixin LocalizedStrings {
  String get login => Intl.message(
        'Login',
        name: 'login',
      );

  String get accountName => Intl.message(
        'Account Name',
        name: 'account_name',
      );

  String get errorMsg => Intl.message(
        'You are not authorized to enable SmartShifts for this account',
        name: 'error_msg',
      );

  String get username => Intl.message(
        'Username',
        name: 'username',
      );

  String get password => Intl.message(
        'Password',
        name: 'password',
      );

  String get signUpText => Intl.message(
        'I don’t have an account',
        name: 'sign_up_text',
      );

  // ignore: non_constant_identifier_names
  String get powered_by => Intl.message(
    'Powered by simplified.io',
    name: 'powered_by',
  );
  // ignore: non_constant_identifier_names
  String get app_name => Intl.message(
    'SmartShifts',
    name: 'app_name',
  );

  String get tm => Intl.message(
    'TM',
    name: 'tm',
  );
}
