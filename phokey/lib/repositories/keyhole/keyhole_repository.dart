import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phokey/general_providers.dart';
import 'package:phokey/models/keyhole/api_create_keyhole_model.dart';
import 'package:phokey/models/keyhole/keyhole_model.dart';
import 'package:phokey/extensions/firebase_firesotre_extension.dart';
import 'package:phokey/repositories/custom_exception.dart';
import 'package:http/http.dart' as http;

abstract class BaseKeyholeRepository {
  // keyholeのリストを返す
  Future<List<Keyhole>> retrieveKeyholes();
  // keyholeを返す
  Future<Keyhole> retrieveKeyhole({required String keyholeId});
  Future<Keyhole> createKeyhole(
      {required String imagePath, required String body});
}

final keyholeRepositoryProvider =
    Provider<KeyholeRepository>((ref) => KeyholeRepository(ref.read));

class KeyholeRepository implements BaseKeyholeRepository {
  final Reader _read;

  const KeyholeRepository(this._read);

  @override
  Future<List<Keyhole>> retrieveKeyholes() async {
    try {
      final snap = await _read(firebaseFirestoreProvider).keyholesRef().get();
      return snap.docs.map((doc) => Keyhole.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Keyhole> retrieveKeyhole({required String keyholeId}) async {
    try {
      final doc =
          await _read(firebaseFirestoreProvider).keyholeDocRef(keyholeId).get();
      return Keyhole.fromDocument(doc);
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Keyhole> createKeyhole(
      {required String imagePath, required String body}) async {
    try {
      final url = Uri.parse('http://192.168.0.12:8080/');
      Map<String, String> headers = {'content-type': 'application/json'};
      final String postBody =
          json.encode({'image_path': imagePath, 'body': body});

      final response = await http.post(url, headers: headers, body: postBody);

      final doc = await _read(firebaseFirestoreProvider)
          .keyholeDocRef(response.body)
          .get();
      return Keyhole.fromDocument(doc);
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}
