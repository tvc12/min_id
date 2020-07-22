part of min_id;

class RandomIDGenerator extends IDGenerator {
  final random = Random.secure();

  @override
  String generate(int character) {}

  @override
  String generateNumber(int character) {
    // TODO: implement generateNumber
    throw UnimplementedError();
  }

  @override
  String generateSpecialCharacter(int character) {
    // TODO: implement generateSpecialCharacter
    throw UnimplementedError();
  }

  @override
  String generateString(int character) {
    // TODO: implement generateString
    throw UnimplementedError();
  }

  @override
  String generateIn(List<String> data, int character) {
    throw UnimplementedError();
  }
}
