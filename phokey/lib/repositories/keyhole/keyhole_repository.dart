import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phokey/general_providers.dart';
import 'package:phokey/models/keyhole/keyhole_model.dart';
import 'package:phokey/extensions/firebase_firesotre_extension.dart';
import 'package:phokey/repositories/custom_exception.dart';

abstract class BaseKeyholeRepository {
  // keyholeのリストを返す
  Future<List<Keyhole>> retrieveKeyholes();
  // keyholeを保存
  // Future<String> createKeyhole({required Keyhole keyhole});
}

final keyholeRepositoryProvider =
    Provider<KeyholeRepository>((ref) => KeyholeRepository(ref.read));

class KeyholeRepository implements BaseKeyholeRepository {
  final Reader _read;

  const KeyholeRepository(this._read);

  @override
  Future<List<Keyhole>> retrieveKeyholes() async {
    try {
      // UserIdに紐づく、アイテムを取得
      final snap = await _read(firebaseFirestoreProvider).keyholeRef().get();
      return snap.docs.map((doc) => Keyhole.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  // @override
  // Future<String> createKeyhole({required Keyhole keyhole}) async {
  //   try {
  //     // UserIdに紐付けてアイテムを登録
  //     final docRef = await _read(firebaseFirestoreProvider)
  //         .userListRef(userId)
  //         .add(item.toDocument());
  //     return docRef.id;
  //   } on FirebaseException catch (e) {
  //     throw CustomException(e.message);
  //   }
  // }
}
