import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Cashfree
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfwebcheckoutpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
import 'package:flutter_cashfree_pg_sdk/api/cferrorresponse/cferrorresponse.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';

// Components
import '../api/api_result.dart';
import '../components/custom_edit_text_component.dart';
import '../components/custom_progress_bar.dart';
import '../components/secondary_heading_component.dart';
import '../components/primary_button.dart';
import '../components/static_refer_and_earn_component.dart';

// Utils & Models
import '../utils/custom_colors.dart';
import '../response_model/auth_response_model.dart';

// ViewModels
import '../view_models/auth_view_model.dart';
import '../view_models/transaction_view_model.dart';

class WalletPage extends StatelessWidget {

  WalletPage({super.key});

  final authViewModel = Get.put(AuthViewModel());
  final transactionViewModel = Get.put(TransactionViewModel());
  final TextEditingController addFundController = TextEditingController();

  /// 🔹 Cashfree
  final CFPaymentGatewayService _cfPaymentService =
  CFPaymentGatewayService();

  late final CFEnvironment environment =
  authViewModel.isCashFreProduction()
      ? CFEnvironment.PRODUCTION
      : CFEnvironment.SANDBOX;

  final RxString orderId = "".obs;
  final RxString paymentSessionId = "".obs;

  /// ✅ Constructor-like init
  void _initCallbacks(BuildContext context) {
    _cfPaymentService.setCallback(
          (orderId) => _verifyPayment(orderId, context),
      _onPaymentError,
    );
  }

  /// ✅ PAYMENT SUCCESS
  void _verifyPayment(String orderId, BuildContext context) async {
    await transactionViewModel.updateDepositStatus(
      orderId,
      int.tryParse(addFundController.text) ?? 0,
      context,
    );
  }

  /// ❌ PAYMENT FAILED
  void _onPaymentError(CFErrorResponse errorResponse, String orderId) {
    Get.snackbar(
      "Payment Failed",
      errorResponse.getMessage() ?? "Something went wrong",
      backgroundColor: CustomColors.primary,
      colorText: CustomColors.white,
      snackPosition: SnackPosition.BOTTOM,
    );

    transactionViewModel.updateDepositStatusObserver.value =
        ApiResult.error(
          errorResponse.getMessage() ?? "Payment failed. Please try again",
        );
  }

  /// 🔐 CREATE SESSION
  CFSession _createSession() {
    return CFSessionBuilder()
        .setEnvironment(environment)
        .setOrderId(orderId.value)
        .setPaymentSessionId(paymentSessionId.value)
        .build();
  }

  /// 🌐 OPEN CHECKOUT
  void _openCashfree() {
    try {
      final session = _createSession();

      final cfWebCheckout =
      CFWebCheckoutPaymentBuilder().setSession(session).build();

      _cfPaymentService.doPayment(cfWebCheckout);
    } on CFException catch (e) {
      Get.snackbar(
        "Error",
        e.message ?? "Unable to start payment",
        backgroundColor: CustomColors.primary,
        colorText: CustomColors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    /// 🔥 ensure callback set once per build lifecycle
    _initCallbacks(context);

    return Scaffold(
      backgroundColor: CustomColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SecondaryHeadingComponent(buttonTxt: "Add Money"),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          /// 💰 BALANCE
                          Container(
                            width: double.infinity,
                            height: 100,
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Available Balance",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: CustomColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Obx(
                                      () => Text(
                                    '₹ ${authViewModel.fetchUserDetailsObserver.value.maybeWhen(
                                      success: (data) =>
                                          ((data
                                          as FetchUserDetailsResponseModel)
                                              .data
                                              ?.wallet ??
                                              0)
                                              .toString(),
                                      orElse: () => "0",
                                    )}',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: CustomColors.primary,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// ➕ ADD FUNDS
                          CustomEditTextComponent(
                            controller: addFundController,
                            title: "Add Funds",
                            hint: "Amount",
                            keyboardType: TextInputType.number,
                          ),

                          const SizedBox(height: 50),
                          const StaticReferAndEarnComponent(),
                          const SizedBox(height: 50),

                          /// 💳 BUTTON
                          Obx(
                                () => transactionViewModel
                                .addAmountToWalletObserver.value
                                .maybeWhen(
                              loading: (loading) =>
                              const Center(child: CustomProgressBar()),
                              orElse: () => PrimaryButton(
                                buttonTxt: "Add Money To Wallet",
                                buttonClick: () async {
                                  final amount =
                                      int.tryParse(addFundController.text) ??
                                          0;

                                  if (amount <= 0) {
                                    Get.snackbar(
                                      "Error",
                                      "Enter valid amount",
                                      backgroundColor:
                                      CustomColors.primary,
                                      colorText: CustomColors.white,
                                    );
                                    return;
                                  }

                                  final response =
                                  await transactionViewModel
                                      .performAddAmountToBalance(
                                      amount, context);

                                  if (response != null &&
                                      response.status == 1) {
                                    orderId.value = response.data?.bookingResponse
                                        ?.orderId ??
                                        "";
                                    paymentSessionId.value = response
                                        .data?.bookingResponse?.paymentId ??
                                        "";

                                    _openCashfree();
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// 🔄 LOADER
            Obx(
                  () => transactionViewModel
                  .updateDepositStatusObserver.value
                  .maybeWhen(
                loading: (loading) => Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: CustomColors.black.withOpacity(0.4),
                  child: const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ),
                orElse: () => const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
