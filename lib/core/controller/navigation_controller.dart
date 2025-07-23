import 'package:flutter/material.dart';

class NavigationController extends ChangeNotifier {
  bool _isVisible = true;
  List<NavigationDestination> _destinations = [];
  int _selectedIndex = 0;
  Function(int)? _onDestinationSelected;
  //globalen index und liste für AppBar und Seitensteuerung
  int _currentScreenIndex = 0;
  List<Map<String, dynamic>> _screenList = [];
  //ScreenHistory aufbauen, da pop den Scaffold zerstört
  final List<int> _screenHistory = [0]; //Home ist Start

  //Getter
  bool get isVisible => _isVisible;
  List<NavigationDestination> get destinations => _destinations;
  int get selectedIndex => _selectedIndex;
  Function(int)? get onDestinationSelected => _onDestinationSelected;
  //global
  int get currentScreenIndex => _currentScreenIndex;
  Map<String, dynamic> get currentScreen =>
      _screenList.isNotEmpty ? _screenList[_currentScreenIndex] : {};

  //globale Screenliste setzen
  void setScreenList(List<Map<String, dynamic>> screens) {
    _screenList = screens;
    notifyListeners();
  }

  //globalen Index ändern und History erweitern
  void setCurrentScreenIndex(int index) {
    if (index >= 0 &&
        index < _screenList.length &&
        index != _currentScreenIndex) {
      _currentScreenIndex = index;
      _screenHistory.add(index);
      _selectedIndex = index;
      notifyListeners();
    }
  }

  //Zurück für die AppBar
  void goBack() {
    if (_screenHistory.length > 1) {
      _screenHistory.removeLast();
      _currentScreenIndex = _screenHistory.last;
      _selectedIndex = _screenHistory.last;
      notifyListeners();
    }
  }

  //NavigationBar anzeigen/verstecken
  void setVisibility(bool visible) {
    _isVisible = visible;
    notifyListeners();
  }

  //NavigationItems setzen
  void setDestinations(
    List<NavigationDestination> destinations, {
    Function(int)? onTap,
  }) {
    _destinations = destinations;
    _onDestinationSelected = onTap;
    notifyListeners();
  }

  //selectedIndex setzen
  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  //NavigationBar konfigurieren
  void configure({
    bool? visible,
    List<NavigationDestination>? destinations,
    int? selectedIndex,
    Function(int)? onDestinationSelected,
  }) {
    if (visible != null) _isVisible = visible;
    if (destinations != null) _destinations = destinations;
    if (selectedIndex != null) _selectedIndex = selectedIndex;
    if (onDestinationSelected != null) {
      _onDestinationSelected = onDestinationSelected;
    }
    notifyListeners();
  }
}
