import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:split_it/data/models/base_model.dart';

class FirebaseRepository<T extends BaseModel> {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  Future<String> create<T extends BaseModel>(T data) async {
    try {
      final response =
          await firestore.collection(data.collection).add(data.toMap());
      return response.id;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> where({
    required String key,
    required String value,
    required String collection,
  }) async {
    try {
      final response = await firestore
          .collection(collection)
          .where(key, isEqualTo: value)
          .get();
      return response.docs.map(((e) => e.data())).toList();
    } catch (e) {
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> get({required String collection}) async {
    try {
      final response = await this.firestore.collection(collection).get();
      return response.docs
          .map(
            (e) => e.data()
              ..addAll(
                {
                  'id': e.id,
                },
              ),
          )
          .toList();
    } catch (e) {
      throw e;
    }
  }

  Future<bool> update({
    required String id,
    required String collection,
    required BaseModel model,
  }) async {
    try {
      await this.firestore.collection(collection).doc(id).update(model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete({required String id, required String collection}) async {
    try {
      await this.firestore.collection(collection).doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  firstWhere() {}
}
