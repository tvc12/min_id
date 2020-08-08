library min_id;

import 'dart:math' show Random;

part 'id_generator/id_generator.dart';
part 'id_generator/random_id_generator.dart';
part 'string_formatter/string_formatter.dart';

abstract class MinId {
  static String _defaultFormat = '3{.}-3{.}-3{.}-3{.}';
  static BaseFormatter _formatter = IDFormatter(RandomIDGenerator());

  static BaseFormatter withFormater(BaseFormatter newFormatter) {
    return _formatter = newFormatter;
  }

  static String withFormat(String newFormat) {
    return _defaultFormat = newFormat;
  }

  static String getId([String format]) => _formatter.generate(format ?? _defaultFormat);
}
