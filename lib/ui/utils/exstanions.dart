extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPassWord {
    final passwordRegExp =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    return passwordRegExp.hasMatch(this);
  }

  String get removeAllHtmlTags {
    RegExp exp = RegExp(
      r"<[^>]*>|\n",
      multiLine: true,
      caseSensitive: true,
    );
    String text = this;
    return text.replaceAll(exp, '');
  }
}

extension FarsiNubers on String {
  String get farsiNumbers {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    String text = this;
    for (int i = 0; i < english.length; i++) {
      text = text.replaceAll(english[i], farsi[i]);
    }
    return text;
  }
}
