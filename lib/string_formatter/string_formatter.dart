part of min_id;

abstract class BaseFormatter {
  ///  **format** is a [String], this will be a role for id
  ///
  ///|    Syntax    |         Range         | Description                                                                                                                                    |  version |
  ///|:------------:|:---------------------:|------------------------------------------------------------------------------------------------------------------------------------------------|:--------:|
  ///|    **abc**   |          ___          | Return string `abc`                                                                                                                            | `^1.0.0` |
  ///|    **{d}**   |        [0 - 9]        | Pick random `1` character from **0 -> 9**                                                                                                      | `^1.0.0` |
  ///|    **{w}**   |  [a - z] \|\| [A - Z] | Pick random `1` character from letter string                                                                                                   | `^1.0.0` |
  ///|    **{.}**   |   [0x0021 - 0x007f]   | Pick random `1` character from **0x0021 -> 0x007f** in `UTF8` charset                                                                          | `^1.0.0` |
  ///|   **(abc)**  |        [a - c]        | Pick random `1` character from **a -> c** (**abc** from input user)                                                                            | `^1.0.0` |
  ///| **{2(abc)}** |        [a - c]        | Pick random `2` characters from **a -> c**                                                                                                     |    ___   |
  ///|  **{2{d}}**  |        [0 - 9]        | Pick random `2` character from **0 -> 9**                                                                                                      |    ___   |
  ///| **(abc{d})** | [a -> c] \|\| [0 - 9] | Nested random:<br>+ Step 1: Pick random `1` character in number range<br>+ Step 2: Pick random `1` character in **a -> c** or result in step 1 |    ___   |
  ///
  ///
  /// return **id** as a [String]
  String generate(String format);
}

typedef RandomFunction = String Function(int);

class IDFormatter extends BaseFormatter {
  final IDGenerator generator;
  final _regex = RegExp(r'(\d*)(?:{((?:(?![({]).)*?)}|\(((?:(?![({]).)*?)\))');
  Map<String, RandomFunction> commands = {};

  IDFormatter(this.generator) {
    commands.addAll({
      'w': generator.generateString,
      '.': generator.generate,
      'd': generator.generateNumber
    });
  }

  @override
  String generate(String format) {
    RawId rawID = _format(format);
    while (rawID.canFormat) {
      rawID = _format(rawID.format);
    }
    return rawID.toString();
  }

  RawId _format(String format) {
    bool canFormat = false;

    final newFormat = format.replaceAllMapped(this._regex, (matcher) {
      canFormat = true;
      final numCharacter = _getNumberCharaterWillGenerate(matcher.group(1));
      final rawFormat = _getFormater(matcher);

      switch (rawFormat.mode) {
        // {.}, {d}
        case GenerateMode.AllCharacter:
          if (_isCommand(rawFormat.formater)) {
            final func = this.commands[rawFormat.formater];
            final chars = func(numCharacter);
            return chars;
          } else
            return List.generate(numCharacter, (index) => rawFormat.formater).join('');
          break;
        // (abc)
        case GenerateMode.OneCharacter:
          return generator.generateIn(rawFormat.formater, numCharacter);
          break;
        default:
          // throw exception if not support
          return rawFormat.formater;
      }
    });
    return RawId(newFormat, canFormat);
  }

  int _getNumberCharaterWillGenerate(String number) {
    return int.tryParse(number) ?? 1;
  }

  RawFormat _getFormater(Match matcher) {
    final allChar = matcher.group(2);
    if (allChar != null && allChar.isNotEmpty) {
      return RawFormat(GenerateMode.AllCharacter, allChar);
    }
    final oneChar = matcher.group(3);
    if (oneChar != null && oneChar.isNotEmpty) {
      return RawFormat(GenerateMode.OneCharacter, oneChar);
    }
    return RawFormat(GenerateMode.NotSupport, '');
  }

  bool _isCommand(String formater) {
    return this.commands.containsKey(formater);
  }
}

class RawId {
  final String format;
  final bool canFormat;

  RawId(this.format, this.canFormat);

  @override
  String toString() => format;
}

enum GenerateMode { OneCharacter, AllCharacter, NotSupport }

class RawFormat {
  final GenerateMode mode;
  final String formater;

  RawFormat(this.mode, this.formater);

  @override
  String toString() => 'mode:: $mode - formatter:: $formater';
}
