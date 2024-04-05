import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/app/modules/intro_slider/controllers/intro_slider_controller.dart';
import 'package:shopping_demo/app/modules/intro_slider/views/intro_page1.dart';
import 'package:shopping_demo/app/modules/intro_slider/views/intro_page2.dart';
import 'package:shopping_demo/app/modules/intro_slider/views/intro_page3.dart';
import 'package:shopping_demo/app/modules/intro_slider/views/intro_page4.dart';
import 'package:shopping_demo/app/routes/app_pages.dart';
import 'package:shopping_demo/utility/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroSliderView extends StatelessWidget {
  const IntroSliderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IntroSliderController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (i) {
              controller.onLastPage.value = (i == 3);
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
              IntroPage4(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.pageController.jumpToPage(3);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: UIC.imgBackground, borderRadius: BorderR.br15),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text("Skip",
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: UIC.iconblu)),
                  ),
                ),
                SmoothPageIndicator(
                  effect: WormEffect(
                    dotColor: UIC.imgBackground,
                    activeDotColor: UIC.iconblu,
                  ),
                  controller: controller.pageController,
                  count: 4,
                ),
                Obx(
                  () => controller.onLastPage.isFalse
                      ? GestureDetector(
                          onTap: () {
                            controller.pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: UIC.imgBackground,
                                borderRadius: BorderR.br15),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text("Next",
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(color: UIC.icongry)),
                          ))
                      : GestureDetector(
                          onTap: () {
                            Get.offAndToNamed(Routes.HOME);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: UIC.imgBackground,
                                borderRadius: BorderR.br15),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text("Done",
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(color: UIC.s400)),
                          )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
