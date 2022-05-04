import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phokey/models/keyhole/keyhole_model.dart';
import 'package:phokey/repositories/custom_exception.dart';
import 'package:phokey/repositories/keyhole/keyhole_repository.dart';

final keyholeExceptionProvider = StateProvider<CustomException?>((_) => null);

final keyholeControllerProvider =
    StateNotifierProvider<KeyholeController, AsyncValue<List<Keyhole>>>((ref) {
  return KeyholeController(ref.read);
});

class KeyholeController extends StateNotifier<AsyncValue<List<Keyhole>>> {
  final Reader _read;

  KeyholeController(this._read) : super(const AsyncValue.loading()) {
    retrieveKeyholes();
  }

  Future<void> retrieveKeyholes({bool isRefreshing = false}) async {
    if (isRefreshing) state = const AsyncValue.loading();
    try {
      final keyholes =
          await _read(keyholeRepositoryProvider).retrieveKeyholes();
      if (mounted) {
        state = AsyncValue.data(keyholes);
      }
    } on CustomException catch (e) {
      state = AsyncValue.error(e);
    }
  }

  Future<void> addKeyhole(
      {required String imagePath,
      required String body,
      required String latitude,
      required String longitude}) async {
    try {
      final keyhole = await _read(keyholeRepositoryProvider).createKeyhole(
          imagePath: imagePath,
          body: body,
          latitude: latitude,
          longitude: longitude);

      state.whenData((keyholes) => state =
          AsyncValue.data(keyholes..add(keyhole.copyWith(id: keyhole.id))));
    } on CustomException {
      // I can't imitate origin code.
      _read(keyholeExceptionProvider);
    }
  }
}
