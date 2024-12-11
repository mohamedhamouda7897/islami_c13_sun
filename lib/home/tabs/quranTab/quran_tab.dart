import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c13_sunday/home/tabs/quranTab/sura_item_horizontal.dart';
import 'package:islami_c13_sunday/home/tabs/quranTab/sura_name_item.dart';
import 'package:islami_c13_sunday/models/sura_model.dart';
import 'package:islami_c13_sunday/sura_details/sura_details.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  var searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.addListener(onSearch);
  }

  onSearch() {
    SuraModel.searchResult.clear();
    String text = searchController.text;
    if (text.isNotEmpty) {
      for (String data in SuraModel.suraNamesEn) {
        if (data.toLowerCase().contains(text.toLowerCase())) {
          SuraModel.searchResult.add(data);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/onboarding_header.png"),
          _searchItem(),
          if (!(SuraModel.searchResult.isNotEmpty ||
              searchController.text.isNotEmpty)) ...[
            _suraNamesHorizontalList()
          ],
          _suraNamesVerticalList(),
        ],
      ),
    );
  }

  Widget _suraNamesHorizontalList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Most Recently",
          style: GoogleFonts.elMessiri(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 8,
        ),
        SuraModel.searchResult.isNotEmpty
            ? const SizedBox()
            : SizedBox(
                height: 150,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 16,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SuraItemHorizontal(
                      model: SuraModel.getSuraModel(index),
                    );
                  },
                  itemCount: SuraModel.listCounts,
                ),
              ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget _suraNamesVerticalList() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Suras List",
            style: GoogleFonts.elMessiri(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                endIndent: 40,
                indent: 40,
              ),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                        arguments: SuraModel.getSuraModel(index));
                  },
                  child: SuraNameItem(
                      model: SuraModel.searchResult.isNotEmpty
                          ? SuraModel.getSelectedSuraModel(index)
                          : SuraModel.getSuraModel(index)),
                );
              },
              itemCount: SuraModel.searchResult.isNotEmpty
                  ? SuraModel.searchResult.length
                  : SuraModel.listCounts,
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchItem() {
    return Column(
      children: [
        TextField(
          style: GoogleFonts.elMessiri(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          controller: searchController,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: "Sura Name",
            prefixIcon: const ImageIcon(
              AssetImage("assets/images/ic_pre_search.png"),
              color: Color(0xFFE2BE7F),
            ),
            hintStyle: GoogleFonts.elMessiri(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Color(0xFFE2BE7F), width: 3)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Color(0xFFE2BE7F), width: 3)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE2BE7F), width: 3),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
