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
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.lightBlueAccent,
          child: Column(
            children: [title(), circle(), meowButton()],
          ),
        ),
        leftCat(context),
        rightCat(context)
      ],
    ));
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Text(
        "CAT SUMMONING CIRCLE",
        style: GoogleFonts.staatliches(fontSize: 40),
      ),
    );
  }

  Widget circle() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(summoningCircleAsset),
          //Obx(() => Image.network(controllerSummoningCircle.cat.value.url);
        ],
      ),
    );
  }

  Widget meowButton() {
    return SizedBox(
        width: 150,
        height: 50,
        child: ElevatedButton(
            onPressed: () async =>
                await controllerSummoningCircle.getCat(controller.text),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            child: const Text("MEOW")));
  }

  Widget leftCat(context) {
    return Positioned(
      bottom: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          leftCatAsset,
          width: MediaQuery.of(context).size.width * 0.15,
        ),
      ),
    );
  }

  Widget rightCat(context) {
    return Positioned(
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
  }
}
