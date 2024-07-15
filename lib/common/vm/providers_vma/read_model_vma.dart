
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/vm/providers_vma/future_vma.dart';

abstract class ReadNotifierVMA<Model, Response, Notifier>
    extends StateNotifier<Notifier> with FutureVMA<Response> {
  ReadNotifierVMA(super.state);

  void setModel(Model model) {
    state = model as Notifier;
  }

  @override
  Future<Response?> refresh({
    required Future<Response>? future,
    required AutoDisposeStateNotifierProviderRef ref,
    bool isCaching = true,
    bool isOnPress = false,
    bool isAbstract = true,
  }) async {
    super.refresh(
        future: future,
        ref: ref,
        isCaching: isCaching,
        isAbstract: isAbstract,
        isOnPress: isOnPress);
    try {
      var result = await future;
      if (result != null) {
        setModel(result as Model);
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
