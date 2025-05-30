import 'dart:convert';

import 'package:flutter/material.dart';

import 'log_in_model.dart';
import 'networking/networking.dart';

class LogInController with ChangeNotifier {
  LoginModel? _loginData;
  bool _isLoading = false;

  LoginModel? get loginData => _loginData;

  bool get isLoading => _isLoading;

  Future<void> loadForm(String domain, String formId) async {
    _isLoading = true;
    notifyListeners();

    final res = await Networking().fetchFormElements();
    print(res);
     _loginData = loginModelFromJson(json.encode(res)).first;

    _isLoading = false;
    notifyListeners();
  }
}
