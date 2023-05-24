import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TopTitles extends StatelessWidget {
  final String title, subtitle;
  const TopTitles({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!(title == "Kirish" || title == "Ro'yxatdan o'tish"))
          const SizedBox(
            height: kToolbarHeight + 12,
          ),
        if (title == "Kirish" || title == "Ro'yxatdan o'tish")
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 16),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
