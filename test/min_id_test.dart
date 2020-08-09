import 'package:min_id/min_id.dart';
import 'package:test/test.dart';

void main() {
  group('MinID test', () {
    test('Random basic ["5{.}-5{.}-5{.}"]x 10000', () {
      const length = 10000;
      final data = List.generate(length, (index) {
        final id = MinId.getId('5{.}-5{.}-5{.}');
        print(id);
        expect(id.length, 17);
        return id;
      }).toSet();
      expect(data.length, length);
    });
    test('Random basic ["5{d}-5{d}-5{d}"] x10000', () {
      const length = 10000;
      final data = List.generate(length, (index) {
        final id = MinId.getId('5{d}-5{d}-5{d}');
        print(id);
        expect(id.length, 17);
        return id;
      }).toSet();
      expect(data.length, length);
    });
    test('Random basic ["5{w}-5{w}-5{w}"] x10000', () {
      const length = 10000;
      final data = List.generate(length, (index) {
        final id = MinId.getId('5{w}-5{w}-5{w}');
        print(id);
        expect(id.length, 17);
        return id;
      }).toSet();
      expect(data.length, length);
    });
    test('Random default x10000', () {
      const length = 10000;
      final data = List.generate(length, (index) {
        final id = MinId.getId();
        print(id);
        expect(id.length, 15);
        return id;
      }).toSet();
      expect(data.length, length);
    });

    test('Random ["{5{abc}}"]', () {
      final id = MinId.getId('{5{abc}}');
      print(id);
      expect(id, 'abcabcabcabcabc');
    });
    test('Random ["{5(abc)}"]', () {
      final id = MinId.getId('{5(abc)}');
      print(id);
      expect(id.length, 5);
    });
    test('Random ["{5({d}45{abc}12)}"] x1000', () {
      const length = 10000;
      List.generate(length, (index) {
        final id = MinId.getId('{5({d}45{abc}12)}');
        print(id);
        expect(id.length, 5);
      });
    });

    test('Random ["VN_HCM-2{3(1234bcd)_2{d}_2{w}}-3{d}-4{w}"] x10000', () {
      const length = 10000;
      List.generate(length, (index) {
        final id = MinId.getId('VN_HCM-2{3(1234bcd)_2{d}_2{w}}-3{d}-4{w}');
        print(id);
        expect(id.length, 34);
      });
    });
  });
}
