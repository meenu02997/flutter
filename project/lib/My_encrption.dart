import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';

class MyEncryptionDecryption{

  static final Key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(Key));

  static String encryptAES(text){
    final Encrypted encrypted = encrypter.encrypt(text, iv: iv);

    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);
    return encrypted.base64;
  }

  static String decryptAES(text){
    return encrypter.decrypt(text,iv: iv);
  }
}