import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/utils/named_logger.dart';
import 'package:logger/logger.dart';

void main() {
  group('NamedPrefixPrinter', () {
    test('should prefix log lines with the provided name', () {
      const prefix = 'TestLogger';
      final printer = NamedPrefixPrinter(prefix);

      final logEvent = LogEvent(Level.info, 'This is a test log');
      final logOutput = printer.log(logEvent);

      for (var line in logOutput) {
        expect(line, contains('[TestLogger]'));
      }
    });

    test('should use PrettyPrinter by default', () {
      const prefix = 'DefaultLogger';
      final printer = NamedPrefixPrinter(prefix);

      expect(printer.realPrinter, isA<PrettyPrinter>());
    });

    test('should allow custom LogPrinter', () {
      const prefix = 'CustomLogger';
      final customPrinter = SimplePrinter();
      final printer = NamedPrefixPrinter(prefix, customPrinter);

      expect(printer.realPrinter, equals(customPrinter));
    });
  });
}
