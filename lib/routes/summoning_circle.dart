import 'package:cat_summon_circle_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cat_summon_circle_flutter/controller/controller_summoning_circle.dart';

class SummoningCircle extends StatelessWidget {
  SummoningCircle({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();
  final ControllerSummoningCircle controllerSummoningCircle =
      Get.put(ControllerSummoningCircle());

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color.fromRGBO(169, 243, 0, 100),
            child: Column(
              children: [title(), circle(context), meowButton()],
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
            showLoading()
          ],
        ),
      );

  Widget meowButton() => SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
          onPressed: () async => await controllerSummoningCircle.getCat(),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          child: const Text("MEOW")));

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

  Widget checkPlaceholder() =>
      Obx(() => controllerSummoningCircle.cat.value.url.isEmpty
          ? placeholder()
          : Image.network(baseUrl + controllerSummoningCircle.cat.value.url));

  Widget fetchGif() => Obx(() => controllerSummoningCircle.hasError.value
      ? errorBox()
      : checkPlaceholder());

  Widget showLoading() => Obx(() => controllerSummoningCircle.isLoading.value
      ? const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue))
      : fetchGif());

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

  Widget placeholder() => Container();
}
