part of min_id;

abstract class IDGenerator {
  String generateString(int character);
  String generateNumber(int character);
  String generateSpecialCharacter(int character);
  String generate(int character);
}
