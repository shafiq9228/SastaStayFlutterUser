
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/components/primary_button.dart';
import '../pages/mobile_verification_page.dart';
import '../utils/custom_colors.dart';
import 'onboarding_component.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreens();
}

class _OnBoardingScreens  extends State<OnBoardingScreens> {
  List<String> itemList = [
    'assets/images/onboarding_1.png',
    'assets/images/onboarding_2.png',
    'assets/images/onboarding_3.png',
  ];
  late PageController _pageController;
  int _currentPage = 0;


  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < 2) { // 2 represents the index of the last skippable page
      _pageController.animateToPage(
          _currentPage + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
    }
    else{
      Get.offAll(()  =>   MobileVerificationPage());
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => MobileVerificationPage()),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        top: true,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 50),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return OnBoardingScreenComponent(image: itemList[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(3,
                      (int index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: _currentPage == index ? 25 : 10,
                      height: 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _currentPage == index ? CustomColors.primary : CustomColors.gray,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Visibility(
                      visible: _currentPage < 2,
                      child: Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(width: 0.5,color: CustomColors.textColor)),
                          child:
                          TextButton(onPressed:(){
                            Get.offAll(() => MobileVerificationPage());
                          }
                          , child:  Text( style: TextStyle(
                            color:CustomColors.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),'Skip'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: CustomColors.primary),
                        child:
                        TextButton(onPressed:
                        _goToNextPage, child:  Text( style: TextStyle(
                          color:  Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),_currentPage == 2 ? 'Get Started' : "Next"),
                        ),
                      ),
                    )

                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}