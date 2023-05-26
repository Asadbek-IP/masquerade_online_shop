import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:maskarad_online_shop/screens/favorite_screen/widgets/single_favorite_item.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sevimlilar",
        ),
      ),
      body: appProvider.getFavoriteProductList.isEmpty
          ? const Center(
              child: Text("Sevimlilar bo'sh"),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                  itemCount: appProvider.getFavoriteProductList.length,
                  itemBuilder: (context, index) => SingleFavoriteItem(
                        singleProductModel:
                            appProvider.getFavoriteProductList[index],
                      )),
            ),
    );
  }
}
