import 'package:flutter/material.dart';
import 'package:maskarad_online_shop/constants/routes.dart';

import 'package:maskarad_online_shop/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:maskarad_online_shop/models/categoriy_model/categoriy_model.dart';
import 'package:maskarad_online_shop/screens/product_details/product_details.dart';
import 'package:maskarad_online_shop/widgets/top_titles.dart';

import '../../constants/constants.dart';
import '../../models/product_model/product_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = [];
  List<ProductModel> bestProductsList = [];

  bool isLoading = false;

  void getCategoriesList() async {
    setState(() {
      isLoading = true;
    });

    categoriesList = await FirebaseFirestoreHelper.instance.getCategories();
    bestProductsList = await FirebaseFirestoreHelper.instance.getBestProducts();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCategoriesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TopTitles(title: "Mahsulotlar", subtitle: ""),
                        TextFormField(
                          decoration: InputDecoration(hintText: "Qidirish..."),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Kategoriyalar",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: categoriesList
                          .map((e) => Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Card(
                                  color: Colors.white,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Image.network(e.image)),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                    ),
                    child: Text(
                      "Top mahsulotlar",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: bestProductsList.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3 / 4,
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                        itemBuilder: (context, index) {
                          ProductModel singleProduct = bestProductsList[index];
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
