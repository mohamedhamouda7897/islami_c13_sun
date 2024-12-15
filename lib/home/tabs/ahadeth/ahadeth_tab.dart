import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c13_sunday/hadeth_details/hadeth_details.dart';
import 'package:islami_c13_sunday/models/hadeth_model.dart';
import 'package:islami_c13_sunday/my_theme_data.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            options: CarouselOptions(height: double.infinity),
            items: allAhadeth.map((hadeth) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        HadethDetailsScreen.routeName,
                      arguments: hadeth
                      );
                    },
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          "assets/images/hadeth_bg.png",
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 24),
                              child: Text(
                                hadeth.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: MyThemeData.blackColor),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: Text(
                                  hadeth.content.first,
                                  textAlign: TextAlign.center,
                                  maxLines: 12,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: MyThemeData.blackColor),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 24,
        )
      ],
    );
  }

  loadHadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then(
      (file) {
        List<String> ahadeth = file.split("#");
        for (String data in ahadeth) {
          List<String> lines = data.trim().split("\n");
          String title = lines[0];
          lines.removeAt(0);
          List<String> content = lines;
          HadethModel hadethModel = HadethModel(title: title, content: content);

          print(title);
          allAhadeth.add(hadethModel);
        }

        setState(() {});
      },
    ).catchError(
      (error) {
        print("Error $error");
      },
    );
  }
}
