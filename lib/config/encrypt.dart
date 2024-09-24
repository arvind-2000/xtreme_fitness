import 'package:encrypt/encrypt.dart' as encrypt;

// Replace with your own key
final key = encrypt.Key.fromUtf8('G7s8dQ3mF4hR9tVwJ2kL0xA5eP1zYcUo'); // 32 characters
final iv = encrypt.IV.fromLength(16); // Initialization vector

String encryptData(String data) {
  final encrypter = encrypt.Encrypter(encrypt.AES(key));
  return encrypter.encrypt(data, iv: iv).base64;
}

String decryptData(String encryptedData) {
  final encrypter = encrypt.Encrypter(encrypt.AES(key));
  return encrypter.decrypt64(encryptedData, iv: iv);
}