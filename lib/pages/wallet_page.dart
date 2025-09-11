import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/components/custom_edit_text_component.dart';
import 'package:pg_hostel/components/custom_progress_bar.dart';
import 'package:pg_hostel/components/primary_button.dart';
import 'package:pg_hostel/components/static_refer_and_earn_component.dart';
import 'package:pg_hostel/view_models/transaction_view_model.dart';

import '../components/secondary_heading_component.dart';
import '../response_model/auth_response_model.dart';
import '../utils/custom_colors.dart';
import '../view_models/auth_view_model.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final authViewModel = Get.put(AuthViewModel());
  final transactionViewModel = Get.put(TransactionViewModel());
  final TextEditingController addFundController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: SafeArea(
        top: true,
          child: Column(
            children: [
              const SecondaryHeadingComponent(buttonTxt: "Add Money"),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                       Container(
                         color: CustomColors.white,
                        width: double.infinity,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Available Balance",style: TextStyle(fontSize: 12,color: CustomColors.primary,fontWeight: FontWeight.w600)),
                            Obx(() => Text( '₹ ${authViewModel.fetchUserDetailsObserver.value.maybeWhen(success: (data) => ((data as FetchUserDetailsResponseModel).data?.wallet ?? 0).toString() ,orElse: () => "0")}',style: TextStyle(fontSize: 25,color: CustomColors.primary,fontWeight: FontWeight.w800))),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50, // Increase height to stretch into an oval
                        decoration: BoxDecoration(
                          color: CustomColors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.elliptical(200, 20),
                            bottomRight: Radius.elliptical(200, 20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomEditTextComponent(controller:addFundController , title: "Add Funds", hint: ""
                            "Amount",keyboardType: TextInputType.phone),
                      ),
                      StaticReferAndEarnComponent(),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Obx(() => transactionViewModel.addAmountToWalletObserver.value.maybeWhen(
                          loading: (loading) => const Center(child: CustomProgressBar()),
                            orElse: () => PrimaryButton(buttonClick: (){
                               if((int.tryParse(addFundController.text) ?? 0) == 0){
                                 Get.snackbar("Error","Enter Amount Correctly",backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
                                 return;
                               }
                              transactionViewModel.performAddAmountToBalance(int.tryParse(addFundController.text) ?? 0,context);
                            },buttonTxt:"Add Money To Wallet")))
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
