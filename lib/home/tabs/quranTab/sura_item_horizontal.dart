import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c13_sunday/models/sura_model.dart';
import 'package:islami_c13_sunday/my_theme_data.dart';

class SuraItemHorizontal extends StatelessWidget {
  SuraModel model;

  SuraItemHorizontal({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color(0xFFE2BE7F)),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(model.nameEn,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: MyThemeData.blackColor)),
              SizedBox(
                height: 8,
              ),
              Text(
                model.nameAr,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: MyThemeData.blackColor),
              ),
              SizedBox(
                height: 8,
              ),
              Text("${model.numOfVerses} Verses",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: MyThemeData.blackColor)),
            ],
          ),
          Image.asset("assets/images/sura_item.png"),
        ],
      ),
    );
  }
}
