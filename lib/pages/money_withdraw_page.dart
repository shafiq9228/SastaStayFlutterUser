import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/components/secondary_heading_component.dart';
import 'package:pg_hostel/view_models/auth_view_model.dart';
import '../components/money_input_formater.dart';
import '../utils/app_styles.dart';
import '../utils/custom_colors.dart';
import '../utils/statefullwrapper.dart';
import '../view_models/transaction_view_model.dart';

class MoneyWithdrawPage extends StatefulWidget {
  const MoneyWithdrawPage({super.key});

  @override
  State<MoneyWithdrawPage> createState() => _MoneyWithdrawPageState();
}

class _MoneyWithdrawPageState extends State<MoneyWithdrawPage> {

  final transactionViewModel = Get.put(TransactionViewModel());
  final authViewModel = Get.put(AuthViewModel());



  @override
  Widget build(BuildContext context) {
    final TextEditingController editTextController = TextEditingController();
    return
      StatefulWrapper(onInit: (){
        authViewModel.fetchUserDetails(false);
      },
        child: Scaffold(
          backgroundColor: CustomColors.white,
        body: SafeArea(
          top: true,
          child:
          Column(
            children: [
              SecondaryHeadingComponent(buttonTxt: "Withdraw", buttonClick: () {
                Get.back();
              }),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refresh,
                  child: Container(
                    color: Colors.white,
                    child:
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: CustomColors.primary
                                  ,borderRadius: BorderRadius.circular(15)
                              ),
                              child:
                              SizedBox(
                                width: double.infinity,
                                child:
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.center,
                                    children: [
                                      IntrinsicWidth(
                                        child: TextFormField(
                                            maxLength: 10,
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w800,
                                                color: CustomColors.primary
                                            ),
                                            keyboardType: TextInputType.phone,
                                            inputFormatters: [MoneyInputFormatter()],
                                            controller: editTextController,
                                            decoration: InputDecoration(
                                                counterText: '',
                                                prefixIcon: Icon(Icons.currency_rupee,size: 20,color:CustomColors.primary),
                                                border: InputBorder.none,
                                                hintText:'00',
                                                contentPadding: const EdgeInsets.symmetric(vertical: 5)
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20.0),
                                        child: Text(style: TextStyle(
                                          color: CustomColors.primary,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                        ),'Total amount to be transferred'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child:
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0,top: 10,bottom: 10),
                              child: Text(style: TextStyle(
                                color: CustomColors.primary,
                                fontSize:18,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),'Transfer to'),
                            ),
                          ),

                          const SizedBox(height: 300)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                      color: CustomColors.primary.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child:
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.topLeft,
                          child:
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(style: TextStyle(
                              color: CustomColors.primary,
                              fontSize:18,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),'Add New Payment method'),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
    ),
      );
  }

  Future<void> _refresh() async{
    authViewModel.fetchUserDetails(false);
  }
}
