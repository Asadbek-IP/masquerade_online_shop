import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:maskarad_online_shop/models/product_model/product_model.dart';
import 'package:maskarad_online_shop/provider/app_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';

class CartItem extends StatefulWidget {
  ProductModel singleProduct;
  CartItem({super.key, required this.singleProduct});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int qty = 1;

  @override
  void initState() {
    qty = widget.singleProduct.qty ?? 1;
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kPrimaryColor, width: 3)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 140,
              color: kPrimaryColor.withOpacity(0.5),
              child: Image.network(
                widget.singleProduct.image,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(12),
              height: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.singleProduct.name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Text(
                        "${widget.singleProduct.price.toInt()}.000 so'm",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: CircleAvatar(
                            maxRadius: 13,
                            child: Icon(Icons.remove),
                          ),
                          onPressed: () {
                            setState(() {
                              if (qty > 1) {
                                qty--;
                              }
                              appProvider.updateQty(widget.singleProduct, qty);
                            });
                          }),
                      Text(
                        qty.toString(),
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: CircleAvatar(
                            maxRadius: 13,
                            child: Icon(Icons.add),
                          ),
                          onPressed: () {
                            setState(() {
                              qty++;
                            });
                            appProvider.updateQty(widget.singleProduct, qty);
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        onPressed: () {},
                        child: Text(
                          "Istaklarga qo'shish",
                          style: TextStyle(fontSize: 12, color: kPrimaryColor),
                        ),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Provider.of<AppProvider>(context, listen: false)
                              .removeCartProduct(widget.singleProduct);
                          showMessage("Savatchadan o'chirildi");
                        },
                        child: CircleAvatar(
                          maxRadius: 15,
                          child: Icon(Icons.delete),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
