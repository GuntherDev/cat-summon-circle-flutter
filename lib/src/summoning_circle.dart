import 'package:cat_summon_circle_flutter/src/repositories/cat_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'models/cat.dart';
import 'models/tag_list.dart';

const baseUrl = 'https://cataas.com';

class SummoningCircle extends StatefulWidget {
  const SummoningCircle({Key? key}) : super(key: key);

  @override
  _SummoningCircleState createState() => _SummoningCircleState();
}

class _SummoningCircleState extends State<SummoningCircle> {
  late CatRepository catRepo;
  CatModel catModel = CatModel();
  bool isLoading = false;
  bool catLoaded = false;
  bool empty = false;

  TextEditingController tagController = TextEditingController();

  @override
  void initState() {
    catRepo = CatRepository();
    catRepo.fetchCat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color.fromRGBO(169, 243, 0, 100),
            child: Column(
              children: [
                title(),
                circle(context),
                tagSearch(),
                const SizedBox(height: 10),
                meowButton()
              ],
            ),
          ),
          leftCat(context),
          rightCat(context)
        ],
      ));

  Widget title() => Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Text(
          "CAT SUMMONING CIRCLE",
          style: GoogleFonts.staatliches(fontSize: 40),
        ),
      );

  Widget circle(context) => Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(summoningCircleAsset,
                height: MediaQuery.of(context).size.height * 0.60,
                width: MediaQuery.of(context).size.width * 0.45),
            placeholder(),
          ],
        ),
      );

  Widget meowButton() => SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
          onPressed: () async {
            setState(() {
              isLoading = true;
              catLoaded = false;
            });
            final cat = await catRepo.fetchCat();
            setState(() {
              isLoading = false;
              catLoaded = true;
              catModel = cat;
            });
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          child: const Text("MEOW")));

  Widget tagSearch() => Column(
        children: [
          SizedBox(
            width: 270,
            height: 60,
            child: TextFormField(
              controller: tagController,
              decoration: InputDecoration(
                  hintText: "Search by tag",
                  labelText: "Tag",
                  labelStyle: TextStyle(
                    fontSize: 24,
                    color: empty ? Colors.red : Colors.black,
                  )),
            ),
          ),
          SizedBox(
              width: 150,
              height: 30,
              child: ElevatedButton(
                  onPressed: () async {
                    if (tagController.text.toString().isNotEmpty &&
                        tagList.contains(
                            tagController.text.toString().toUpperCase())) {
                      setState(() {
                        isLoading = true;
                        catLoaded = false;
                      });
                      final cat = await catRepo
                          .fetchCatByTag(tagController.text.toString());
                      setState(() {
                        isLoading = false;
                        catLoaded = true;
                        catModel = cat;
                      });
                    } else {
                      setState(() {
                        empty = true;
                      });
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigoAccent)),
                  child: const Text("RAWR"))),
        ],
      );

  Widget leftCat(context) => Positioned(
        bottom: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            leftCatAsset,
            width: MediaQuery.of(context).size.width * 0.15,
          ),
        ),
      );

  Widget rightCat(context) => Positioned(
        bottom: 0,
        right: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            rightCatAsset,
            width: MediaQuery.of(context).size.width * 0.15,
          ),
        ),
      );

  Widget errorBox() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(sadCatAsset, width: 150, height: 150),
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.black,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              child: Text("Sorry, couldn't find a cat.",
                  style: GoogleFonts.patrickHand(
                      fontSize: 24, color: Colors.white)),
              padding: const EdgeInsets.all(20),
            ),
          ],
        ),
      );

  Widget placeholder() => Container(
        child: isLoading
            ? const CircularProgressIndicator()
            : catLoaded
                ? SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.network(
                        'https://cataas.com${catModel.url.toString()}'))
                : Container(),
      );
}
