class TextFormFieldValidation {
  const TextFormFieldValidation._();

  static String? validateEmail(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        // The form is empty
        return "E-posta adresinizi yazınız!";
      }
      // This is just a regular expression for email addresses
      final bool emailValid =
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);

      if (!emailValid) {
        return 'Geçerli bir e-posta adresi giriniz';
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
        return "Kullanıcı adınızı yazınız!";
      }
      final bool userNameValid = RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value);
      if (!userNameValid) {
        return "Sadece harf ve rakamlardan oluşmalıdır!";
      } else {
        return null;
      }
    }
    return null;
  }
}
