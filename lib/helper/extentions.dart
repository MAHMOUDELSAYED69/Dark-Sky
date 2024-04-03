import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//! THEME EXTENSION
extension ThemeExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;
  InputDecorationTheme get inputDecoration =>
      Theme.of(this).inputDecorationTheme;
}

//! SCREEN EXTENSION
extension MediaQueryExtensions on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

//! BLOC EXTENSION
extension CubitExtension<T extends Cubit<Object>> on BuildContext {
  T bloc<T extends Cubit<Object>>() {
    try {
      return BlocProvider.of<T>(this);
    } catch (e) {
      throw Exception('Cannot find bloc of type $T.');
    }
  }
}

//! NAVIGATOR EXTENSION
extension NavigatorExtensions on BuildContext {
  //? push
  void push(Widget screen) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (context) => screen));
  //? pushReplacement
  void pushReplacement(Widget screen) => Navigator.of(this)
      .pushReplacement(MaterialPageRoute(builder: (context) => screen));
  //? pop
  void goBack() => Navigator.of(this).pop();
}
