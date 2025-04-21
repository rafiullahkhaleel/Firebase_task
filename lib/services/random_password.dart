import 'dart:math';

class RandomPasswordGenerate {
  String generateRandomPassword(int length, bool upper, bool lower, bool num, bool sym) {
    String upperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    String lowerCase = 'abcdefghijklmnopqrstuvwxyz';
    String number = '0123456789';
    String symbols = r'!@#\$%^&*()_+[]{}<>?';


    String chars = '';

    if (upper) chars += upperCase;
    if (lower) chars += lowerCase;
    if (num) chars += number;
    if (sym) chars += symbols;

    if (chars.isEmpty) {
      return 'Please select at least one character type.';
    }
    Random random = Random();

    String password = List.generate(length, (index){
      return chars[random.nextInt(chars.length)];
    }).join();
    return password;

  }
}
