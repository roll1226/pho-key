import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  CollectionReference<Map<String, dynamic>> keyholesRef() =>
      collection('keyholes');
  DocumentReference<Map<String, dynamic>> keyholeDocRef(String keyholeId) =>
      collection('keyholes').doc(keyholeId);
}
