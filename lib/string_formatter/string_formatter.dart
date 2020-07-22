part of min_id;

abstract class BaseFormatter {
  String generate(String format);
}

class IDFormatter extends BaseFormatter {
  final IDGenerator generator;

  IDFormatter(this.generator);

  @override
  String generate(String format) {}
}
