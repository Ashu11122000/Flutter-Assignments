import 'dart:math';

class PasswordLogic {
  static String generatePassword({
    required double length,
    required bool hasUppercase,
    required bool hasLowercase,
    required bool hasNumbers,
    required bool hasSymbols,
  }) {
    const uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
    const numberChars = '0123456789';
    const symbolChars = '!@#\$%^&*()_+~`|}{[]:;?><,./-=';

    String charsToUse = '';
    if (hasUppercase) charsToUse += uppercaseChars;
    if (hasLowercase) charsToUse += lowercaseChars;
    if (hasNumbers) charsToUse += numberChars;
    if (hasSymbols) charsToUse += symbolChars;

    // Fallback if the user unchecks everything
    if (charsToUse.isEmpty) {
      return 'Please select at least one criteria.';
    }

    Random random = Random();
    String password = '';

    for (int i = 0; i < length.toInt(); i++) {
      int randomIndex = random.nextInt(charsToUse.length);
      password += charsToUse[randomIndex];
    }

    return password;
  }
}