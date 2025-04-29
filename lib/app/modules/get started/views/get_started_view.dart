import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/register_widget.dart';
import '../components/second_sceen_widget.dart';
import '../controller/get_started_controller.dart';

class GetStartedView extends GetView<GetStartedController>{
  final _pageController = PageController();

  GetStartedView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: const [
                SecondScreenWidget(
                  title: "Watch on any Device",
                  imageAssets: 'assets/images/image2.png',
                ),
                SecondScreenWidget(
                  title: "Download and Go",
                  imageAssets: 'assets/images/image3.png',
                ),
                SecondScreenWidget(
                  title: "No pesky Contracts",
                  imageAssets: 'assets/images/image4.png',
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const SwapEffect(
                  activeDotColor: Color.fromARGB(255, 216, 14, 0),
                  dotHeight: 6,
                  dotWidth: 6,
                ),
              ),
              const RegisterWidget()
            ],
          ),
        ],
      ),
    );
  }

}
