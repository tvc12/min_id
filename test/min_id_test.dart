import 'dart:convert';

import 'package:mini_id/min_id.dart';
import 'package:test/test.dart';

List<int> toUTF8Raw(String str) {
  final raws = str.split('').toSet().toList().join('');
  return utf8.encode(raws)..sort((a, b) => a.compareTo(b));
}

void main() {
  group('ID Generator test', () {
    const character = 10000;
    final IDGenerator generator = RandomIDGenerator();
    test('Generate test success', () {
      final id = generator.generate(character);
      final raws = toUTF8Raw(id);
      expect(raws.length, 94);
      expect(raws.first, 33);
      expect(raws.last, 126);
    });
    test('Generate only string test success', () {
      final id = generator.generateString(character);
      final raws = toUTF8Raw(id);
      expect(raws.length, 52);
      expect(raws.first, 65);
      expect(raws.last, 122);
    });
    test('Generate only number test success', () {
      final id = generator.generateNumber(character);
      final raws = toUTF8Raw(id);
      expect(raws.length, 10);
      expect(raws.first, 48);
      expect(raws.last, 57);
    });
    test('Generate only number test success', () {
      final id = generator.generateSpecialCharacter(character);
      final raws = toUTF8Raw(id);
      expect(raws.length, 32);
      expect(raws.first, 33);
      expect(raws.last, 126);
    });
    test('Generate only number test success', () {
      final id = generator.generateIn('123abc', character);
      final raws = toUTF8Raw(id);
      expect(raws.length, 6);
      expect(raws.first, 49);
      expect(raws.last, 99);
    });
  });
}
