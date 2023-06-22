import '../constants/constants.dart';

class TextFormFieldValidation {
  const TextFormFieldValidation._();

  static Map<String, String> errorMessages = {
    'email': 'E-posta adresinizi yazınız!',
    'invalidEmail': 'Geçerli bir e-posta adresi giriniz',
    'userName': 'Kullanıcı adınızı yazınız!',
    'invalidUserName': 'Sadece harf ve rakamlardan oluşmalıdır!'
  };

  static String? validateEmail(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return errorMessages['email'];
      }
      final bool emailValid = RegExp(Constants.emailRegex).hasMatch(value);
      if (!emailValid) {
        return errorMessages['invalidEmail'];
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static String? validateUserName(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return errorMessages['userName'];
      }
      final bool userNameValid = RegExp(Constants.userNameRegex).hasMatch(value);
      if (!userNameValid) {
        return errorMessages['invalidUserName'];
      } else {
        return null;
      }
    }
    return null;
  }
}
