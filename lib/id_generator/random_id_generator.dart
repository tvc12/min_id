part of min_id;

class RandomIDGenerator extends IDGenerator {
  final random = Random.secure();

  static const spaces = [0x0000, 0x000a, 0x001a, 0x001a];
  static const maximuns = [0x0030, 0x0041, 0x0061, 0x007f];

  @override
  String generate(int character) {
    final raws = List.generate(character, (index) => 0x0021 + random.nextInt(0x005e));
    return String.fromCharCodes(raws);
  }

  @override
  String generateNumber(int character) {
    final raws = List.generate(character, (index) => 0x0030 + random.nextInt(0x000a));
    return String.fromCharCodes(raws);
  }

  @override
  String generateSpecialCharacter(int character) {
    final raws = List.generate(character, (index) {
      int raw = 0x0021 + random.nextInt(0x0020);

      for (int i = 0; i < maximuns.length; ++i) {
        raw += spaces[i];
        if (raw < maximuns[i]) {
          break;
        }
      }
      return raw;
    });
    return String.fromCharCodes(raws);
  }

  @override
  String generateString(int character) {
    final raws = List.generate(character, (index) {
      final raw = 0x0041 + random.nextInt(0x0034);
      return raw > 0x005a ? 0x0006 + raw : raw;
    });
    return String.fromCharCodes(raws);
  }

  @override
  String generateIn(List<String> data, int character) {
    if (data?.isNotEmpty == true) {
      final raws = List.generate(character, (index) {
        final index = random.nextInt(data.length);
        return data[index];
      });
      return raws.join('');
    } else {
      return '';
    }
  }
}
