
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/vm/langauge/langauge_vm.dart';
import 'package:tanfeth_apps/common/vm/providers_vma/future_notifier.dart';

mixin class FutureVMA<R> {
  final futureProvider =
      AutoDisposeStateNotifierProvider<FutureNotifier<R>, Future<R?>?>((ref) {
    ref.keepAlive();
    return FutureNotifier<R>();
  });

  Future<void> refresh(
      {required AutoDisposeStateNotifierProviderRef ref,
      required Future<R>? future,
      bool isCaching = true,
      bool isAbstract = false,
      bool isOnPress = false}) async {
    try {
      if (!isAbstract) {
        if (isCaching) {
          ref.keepAlive();
        } else {
          ref.keepAlive().close();
        }
      }
      if (isOnPress) {
        ref.refresh(futureProvider.notifier).setState(future);
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.refresh(futureProvider.notifier).setState(future);
        });
      }

      await future;
    } catch (e) {
      if (!isAbstract) ref.keepAlive().close();
    }

    ref.listen(languageProvider, (_, __) {
      ref.keepAlive().close();
    });
  }
}
