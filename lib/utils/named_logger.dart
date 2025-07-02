import 'package:logger/logger.dart';

/// Returns a Logger that prefixes each log line with the given [name].
Logger namedLogger(String name) {
  return Logger(printer: NamedPrefixPrinter(name));
}

/// A LogPrinter that prefixes each log line with a custom name.
class NamedPrefixPrinter extends LogPrinter {
  final String prefix;
  final LogPrinter realPrinter;

  NamedPrefixPrinter(this.prefix, [LogPrinter? realPrinter])
    : realPrinter = realPrinter ?? PrettyPrinter();

  @override
  List<String> log(LogEvent event) {
    final realLogs = realPrinter.log(event);
    return realLogs.map((line) => '[$prefix] $line').toList();
  }
}
