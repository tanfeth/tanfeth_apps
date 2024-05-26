import 'package:flutter_riverpod/flutter_riverpod.dart';

class FutureNotifier<R> extends StateNotifier<Future<R?>?> {
  FutureNotifier() : super(null);

  void setState(Future<R?>? future) {
    state = future;
  }
}
