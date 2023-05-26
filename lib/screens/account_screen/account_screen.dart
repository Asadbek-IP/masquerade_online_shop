import 'package:flutter/material.dart';
import 'package:maskarad_online_shop/screens/welcome/welcome.dart';
import 'package:provider/provider.dart';

import '../../constants/routes.dart';
import '../../firebase_helper/firebase_auth_helper.dart/firebase_auth_helper.dart';
import '../../provider/app_provider.dart';
import '../../widgets/primary_button.dart';
import '../edit_profile/edit_profile.dart';
import '../favorite_screen/favorite_screen.dart';
import '../password_change/change_password.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                appProvider.getUserInformation.image == null
                    ? const Icon(
                        Icons.person_outline,
                        size: 120,
                      )
                    : CircleAvatar(
                        backgroundImage:
                            NetworkImage(appProvider.getUserInformation.image!),
                        radius: 60,
                      ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  appProvider.getUserInformation.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  appProvider.getUserInformation.email,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  width: 130,
                  child: PrimaryButton(
                    title: "Tahrirlash",
                    onPressed: () {
                      Routes.instanse.push(const EditProfile(), context);
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    // Routes.instance
                    //     .push(widget: const OrderScreen(), context: context);
                  },
                  leading: const Icon(Icons.shopping_bag_outlined),
                  title: const Text("Buyurtmalar"),
                ),
                ListTile(
                  onTap: () {
                    Routes.instanse.push(const FavoriteScreen(), context);
                  },
                  leading: const Icon(Icons.favorite_outline),
                  title: const Text("Sevimlilar"),
                ),
                ListTile(
                  onTap: () {
                    // Routes.instance
                    //     .push(widget: const AboutUs(), context: context);
                  },
                  leading: const Icon(Icons.info_outline),
                  title: const Text("Biz haqimizda"),
                ),
                ListTile(
                  onTap: () {
                    Routes.instanse.push(const ChangePassword(), context);
                  },
                  leading: const Icon(Icons.change_circle_outlined),
                  title: const Text("Parolni o'zgartirish"),
                ),
                ListTile(
                  onTap: () {
                    FirebaseAuthHelper.instance.signOut();
                    Routes.instanse.pushAndRemoveUtil(Welcome(), context);
                  },
                  leading: const Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  title: const Text(
                    "Chiqish",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const Text("Versiya 1.0.0")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
