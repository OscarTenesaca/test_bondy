import 'package:flutter/material.dart';

class ProviderTime extends ChangeNotifier {
  bool _loading = false;

  bool get isLoading => this._loading;

  set isLoading(bool valor) {
    this._loading = valor;
    notifyListeners();
  }
}
