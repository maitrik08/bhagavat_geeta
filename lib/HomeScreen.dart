import 'package:bhagavat_geeta/ChapterDetailPage.dart';
import 'package:bhagavat_geeta/JsonDecode.dart';
import 'package:bhagavat_geeta/JsonDecodemodel.dart';
import 'package:bhagavat_geeta/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadJSON();
  }

  Future<void> loadJSON() async {
    await Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
        .loadJSON();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bhagavat Geeta"),
        centerTitle: true,
        leading: SizedBox(),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: (Provider.of<ThemeProvider>(context).isDark)
                ? const Icon(Icons.mode_night)
                : const Icon(Icons.light_mode_rounded),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Provider.of<ChapterJsonDecodeProvider>(context).chapterJsonDecodeModel.allChapter.length,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        itemBuilder: (context, index) => Card(
          child: ListTile(
            onTap: () {
              chapterIndex = index;
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChapterDetailPage()));
              //Navigator.of(context).pushNamed("chapter_detail_page");
            },
            leading: Text(
                "${Provider.of<ChapterJsonDecodeProvider>(context, listen: false).chapterJsonDecodeModel.allChapter[index].id}",
              style: TextStyle(
                fontSize: 15
              ),
            ),
            title: Text(
                Provider.of<ChapterJsonDecodeProvider>(context, listen: false).chapterJsonDecodeModel.allChapter[index].nameHindi),
            subtitle: Text(
                "Verses : ${Provider.of<ChapterJsonDecodeProvider>(context, listen: false).chapterJsonDecodeModel.allChapter[index].versesCount}"),
            trailing:  Icon(Icons.arrow_forward_ios_outlined,size: 15,),
          ),
        ),
      )
    );
  }
}
