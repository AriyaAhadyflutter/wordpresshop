import 'package:flutter/material.dart' show ChangeNotifier;

class LoaderProvider extends ChangeNotifier {
  bool _isApiCalled = false;

  bool get isApiCalled => _isApiCalled;
  setLoadingStatus(bool status) {
    _isApiCalled = status;
    notifyListeners();
  }
}
