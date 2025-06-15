import 'package:flutter/material.dart';
import 'package:frontend/widgets/future_loader.dart';

class FutureCreateButtonWidget<T> extends StatelessWidget {
  final Future<T>? future;
  final Function(Object)? onError;
  final Function(BuildContext, T)? onDone;
  final String buttonText;
  final String loadedText;
  final VoidCallback? buttonCallback;

  const FutureCreateButtonWidget({
    super.key,
    required this.future,
    required this.buttonText,
    required this.loadedText,
    this.onError,
    this.onDone,
    this.buttonCallback,
  });

  @override
  Widget build(BuildContext context) {
    return future != null
        ? FutureLoaderWidget(
          future: future!,
          builder: (context, result) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (onDone != null) {
                onDone!(context, result);
              }
            });
            return Text(loadedText);
          },
          onError: (error) => onError != null ? onError!(error) : null,
        )
        : ElevatedButton(onPressed: buttonCallback, child: Text(buttonText));
  }
}
