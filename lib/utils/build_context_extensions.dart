// @TODO: Double quote the import statements
import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  // MediaQueryData get mediaQuery => MediaQuery.of(this);

  // double get screenWidth => mediaQuery.size.width;
}
