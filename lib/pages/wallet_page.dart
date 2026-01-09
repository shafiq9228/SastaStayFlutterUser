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

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final authViewModel = Get.put(AuthViewModel());
  final transactionViewModel = Get.put(TransactionViewModel());
  final TextEditingController addFundController = TextEditingController();

  /// 🔹 Cashfree
  final CFPaymentGatewayService _cfPaymentService =
  CFPaymentGatewayService();

  final CFEnvironment _environment = CFEnvironment.SANDBOX;

  late String orderId;
  late String paymentSessionId;

  @override
  void initState() {
    super.initState();
    _cfPaymentService.setCallback(_verifyPayment, _onPaymentError);
  }

  /// ✅ PAYMENT SUCCESS
  void _verifyPayment(String orderId) async {
    await transactionViewModel.updateDepositStatus(orderId,int.tryParse(addFundController.text) ?? 0,context);
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
    transactionViewModel.updateDepositStatusObserver.value = ApiResult.error(
      errorResponse.getMessage() ?? "Payment failed. Please try again",
    );
  }

  /// 🔐 CREATE CASHFREE SESSION
  CFSession _createSession() {
    return CFSessionBuilder()
        .setEnvironment(_environment)
        .setOrderId(orderId)
        .setPaymentSessionId(paymentSessionId)
        .build();
  }

  /// 🌐 OPEN CASHFREE CHECKOUT
  void _openCashfree() {
    try {
      final session = _createSession();

      final cfWebCheckout = CFWebCheckoutPaymentBuilder().setSession(session).build();

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
                          /// 💰 WALLET BALANCE
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
                                          ((data as FetchUserDetailsResponseModel)
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

                          /// 💳 ADD MONEY BUTTON
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

                                  /// 🔥 CREATE CASHFREE ORDER FROM BACKEND
                                  final response = await transactionViewModel.performAddAmountToBalance(amount,context);

                                  if (response != null && response.status == 1) {
                                    orderId = response.data?.bookingResponse?.orderId ?? "";
                                    paymentSessionId = response.data?.bookingResponse?.paymentId ?? "";
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

            /// 🔄 FULLSCREEN LOADER
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
