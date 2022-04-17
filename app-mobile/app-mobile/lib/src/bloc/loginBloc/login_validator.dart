import 'dart:async';

class LoginValidator {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (
      email,
      sink,
    ) {
      final regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      );

      if (regExp.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('E-mail is not valid');
      }
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.isNotEmpty) {
        sink.add(password);
      } else {
        sink.addError('You must type your password');
      }
    },
  );

  final validateUserName = StreamTransformer<String, String>.fromHandlers(
    handleData: (userName, sink) {
      if (userName.isNotEmpty) {
        sink.add(userName);
      } else {
        sink.addError('User name is invalid');
      }
    },
  );

  final validateAccount = StreamTransformer<String, String>.fromHandlers(
    handleData: (account, sink) {
      if (account.isNotEmpty) {
        sink.add(account);
      } else {
        sink.addError('Account is invalid');
      }
    },
  );
}
