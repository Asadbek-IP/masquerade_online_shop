import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:like_button/like_button.dart';
import 'package:maskarad_online_shop/models/product_model/product_model.dart';
import 'package:maskarad_online_shop/widgets/primary_button.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({super.key, required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.singleProduct.image,
                height: 350,
                width: 350,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.singleProduct.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  LikeButton(
                      // isLiked: widget.singleProduct.isFavourite,
                      // onTap: (isLiked) async {
                      //   setState(() {
                      //     widget.singleProduct.isFavourite = isLiked;
                      //   });
                      // },
                      ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(widget.singleProduct.description),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  CupertinoButton(
                      padding: EdgeInsets.only(left: 0, right: 14),
                      child: CircleAvatar(
                        child: Icon(Icons.remove),
                      ),
                      onPressed: () {
                        setState(() {
                          if (qty > 1) {
                            qty--;
                          }
                        });
                      }),
                  Text(
                    qty.toString(),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  CupertinoButton(
                      child: CircleAvatar(
                        child: Icon(Icons.add),
                      ),
                      onPressed: () {
                        setState(() {
                          qty++;
                        });
                      }),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: OutlinedButton(
                          onPressed: () {}, child: Text("Savatcha  qo'shish")),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: PrimaryButton(
                      title: "Sotib olish",
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
