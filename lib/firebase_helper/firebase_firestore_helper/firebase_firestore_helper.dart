import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maskarad_online_shop/constants/constants.dart';
import 'package:maskarad_online_shop/models/categoriy_model/categoriy_model.dart';

import '../../models/product_model/product_model.dart';

class FirebaseFirestoreHelper {
  static final FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<List<CategoryModel>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collection("categories").get();

      List<CategoryModel> categoriesList = querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();
      return categoriesList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getBestProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collectionGroup("products").get();

      List<ProductModel> productsList = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      print(productsList);
      return productsList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }
}
