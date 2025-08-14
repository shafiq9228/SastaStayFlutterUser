import 'package:flutter/material.dart';
import '../utils/custom_colors.dart';

class OnBoardingScreenComponent extends StatelessWidget {
  final String image;
  const OnBoardingScreenComponent({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SafeArea(
        top: true,
        child:Container(
          color: Colors.white,
          child: Column(
            children:[
              // Container(
              //   width: double.infinity,
              //   height: 50,
              //   color: CustomColors.primary,
              //   child: Center(
              //     child: const Text(
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 30,
              //           fontFamily: 'Inter',
              //           fontWeight: FontWeight.w700,
              //           fontStyle: FontStyle.italic,
              //         ),
              //         textAlign: TextAlign.center,
              //         'Vlogcall'),
              //   ),
              // ),
              Center(child: Image.asset(image,width: MediaQuery.sizeOf(context).width*0.8,height: MediaQuery.sizeOf(context).height*0.5,)),

            ],
          )
        )
      ),
    );
  }
}
