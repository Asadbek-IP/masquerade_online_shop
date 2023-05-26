import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:maskarad_online_shop/models/categoriy_model/categoriy_model.dart';
import 'package:maskarad_online_shop/widgets/top_titles.dart';

import '../../constants/constants.dart';
import '../../constants/routes.dart';
import '../../firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import '../../models/product_model/product_model.dart';
import '../product_details/product_details.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key, required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ProductModel> productsList = [];

  bool isLoading = false;

  void getCategoriyProductsList() async {
    setState(() {
      isLoading = true;
    });

    productsList = await FirebaseFirestoreHelper.instance
        .getCatigoryViewProduct(widget.categoryModel.id);
    print(widget.categoryModel.id);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoriyProductsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 30,
        title: Text(
          widget.categoryModel.name,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: productsList.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3 / 4,
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                        itemBuilder: (context, index) {
                          ProductModel singleProduct = productsList[index];
                          return Container(
                            decoration: BoxDecoration(
                                color: kPrimaryColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Image.network(
                                  singleProduct.image,
                                  width: 80,
                                  height: 80,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  singleProduct.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                    "Narxi: ${singleProduct.price.toInt()}.000 so'm"),
                                SizedBox(
                                  height: 8,
                                ),
                                OutlinedButton(
                                    onPressed: () {
                                      Routes.instanse.push(
                                          ProductDetails(
                                              singleProduct: singleProduct),
                                          context);
                                    },
                                    child: Text(
                                      "Sotib olish",
                                      style: TextStyle(color: kPrimaryColor),
                                    ))
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
    );
  }
}
