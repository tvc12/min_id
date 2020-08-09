import 'package:min_id/min_id.dart';

void main() {
  final id = MinId.getId();
  print('ID:: $id');

  final stringId = MinId.getId('3{w}-3{w}-3{w}');
  print('ID:: $stringId');

  final numId = MinId.getId('3{d}-3{w}-3{w}');
  print('ID:: $numId');
}
