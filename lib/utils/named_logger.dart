import 'package:logger/logger.dart';

/// Returns a Logger that prefixes each log line with the given [name].
Logger namedLogger(String name) {
  return Logger(printer: _NamedPrefixPrinter(name));
}

/// A LogPrinter that prefixes each log line with a custom name.
class _NamedPrefixPrinter extends LogPrinter {
  final String prefix;
  final LogPrinter _realPrinter;

  _NamedPrefixPrinter(this.prefix, [LogPrinter? realPrinter])
    : _realPrinter = realPrinter ?? PrettyPrinter();

  @override
  List<String> log(LogEvent event) {
    final realLogs = _realPrinter.log(event);
    return realLogs.map((line) => '[$prefix] $line').toList();
  }
}
