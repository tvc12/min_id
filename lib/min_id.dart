library min_id;

import 'dart:math' show Random;

part 'id_generator/id_generator.dart';
part 'id_generator/random_id_generator.dart';
part 'string_formatter/string_formatter.dart';

abstract class MinId {
  static String _defaultPattern = '3{w}-3{d}-3{w}-3{d}';
  static BaseFormatter _formatter = IDFormatter(RandomIDGenerator());

  /// Change default formatter
  @Deprecated('use withFormatter instead, it will remove at 1.1.1')
  static BaseFormatter withFormater(BaseFormatter newFormatter) {
    return _formatter = newFormatter;
  }
  
  /// Change default formatter
  static BaseFormatter withFormatter(BaseFormatter newFormatter) {
    return _formatter = newFormatter;
  }

  /// Change default pattern
  @Deprecated('use withPattern instead, it will remove at 1.1.1')
  static String withFormat(String pattern) {
    return _defaultPattern = pattern;
  }

  /// Change default pattern
  static String withPattern(String pattern) {
    return _defaultPattern = pattern;
  }
  /// Generate ID by formatter
  /// 
  /// String? customPattern is custom pattern
  static String getId([String? customPattern]) =>
      _formatter.generate(customPattern ?? _defaultPattern);
}
