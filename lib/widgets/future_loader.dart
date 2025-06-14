import 'package:flutter/material.dart';
import 'package:frontend/utils/toasts.dart';
import 'package:toastification/toastification.dart';

class FutureLoaderWidget<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(BuildContext, T) builder;
  final VoidCallback? onRetry;
  final Function(Object)? onError;
  final VoidCallback? onDone;

  const FutureLoaderWidget({
    super.key,
    required this.future,
    required this.builder,
    this.onRetry,
    this.onError,
    this.onDone,
  });

  Widget _defaultLoading(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _defaultError(
    BuildContext context,
    Object error,
    VoidCallback? onRetry,
  ) {
    if (onError != null) onError!(error);

    // Show toast
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Toast.show("Error", error.toString(), ToastificationType.error);
    });

    return Center(
      child:
          onRetry != null
              ? GestureDetector(
                onTap: onRetry,
                child: const Text(
                  'Retry',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                  ),
                ),
              )
              : const Text(
                'An error occurred.',
                style: TextStyle(color: Colors.red),
              ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _defaultLoading(context);
        } else if (snapshot.hasError) {
          return _defaultError(context, snapshot.error!, onRetry);
        } else if (snapshot.hasData) {
          return builder(context, snapshot.data as T);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
