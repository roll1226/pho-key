import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phokey/general_providers.dart';
import 'package:phokey/models/challenge/challenge_model.dart';
import 'package:phokey/extensions/firebase_firesotre_extension.dart';
import 'package:phokey/repositories/custom_exception.dart';
import 'package:http/http.dart' as http;

abstract class BaseChallengeRepository {
  Future<Challenge> createChallenge({required String keyholeId});
}

final keyholeRepositoryProvider =
    Provider<ChallengeRepository>((ref) => ChallengeRepository(ref.read));

class ChallengeRepository implements BaseChallengeRepository {
  final Reader _read;

  const ChallengeRepository(this._read);

  @override
  Future<Challenge> createChallenge({required String keyholeId}) async {
    try {
      final url = Uri.parse('http://192.168.0.12:8080/');
      Map<String, String> headers = {'content-type': 'application/json'};
      final String postBody = json.encode({
        'keyhole_id': keyholeId,
      });

      final response = await http.post(url, headers: headers, body: postBody);

      final doc = await _read(firebaseFirestoreProvider)
          .challengeDocRef(response.body)
          .get();
      return Challenge.fromDocument(doc);
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}
