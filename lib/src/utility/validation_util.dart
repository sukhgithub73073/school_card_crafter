class ValidationUtil{

  static bool emailValidation({required String email}) {
    return true ;
   final RegExp emailRegex = RegExp(r'^\w+@\w+\.\w{2,}$');
    return emailRegex.hasMatch(email);
  }
  static bool passwordValidation({required String password}) {
    return true ;
    final RegExp passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
    return passwordRegex.hasMatch(password);
  }

}