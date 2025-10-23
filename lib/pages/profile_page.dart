import 'package:dotted_line/dotted_line.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pg_hostel/components/helper_bottom_sheet.dart';
import 'package:pg_hostel/components/icon_title_message_component.dart';
import 'package:pg_hostel/pages/coupons_page.dart';
import 'package:pg_hostel/pages/help_support_page.dart';
import 'package:pg_hostel/pages/kyc_page.dart';
import 'package:pg_hostel/pages/refer_and_earn_page.dart';
import 'package:pg_hostel/pages/register_user_page.dart';
import 'package:pg_hostel/pages/transactions_page.dart';
import 'package:pg_hostel/pages/wallet_page.dart';
import 'package:pg_hostel/response_model/auth_response_model.dart';
import 'package:pg_hostel/utils/statefullwrapper.dart';

import 'package:url_launcher/url_launcher.dart';

import '../components/custom_progress_bar.dart';
import '../components/empty_data_view.dart';
import '../components/profile_menu.dart';
import '../utils/app_styles.dart';
import '../utils/auth_utils.dart';
import '../utils/custom_colors.dart';
import '../utils/preference_manager.dart';
import '../view_models/auth_view_model.dart';
import 'mobile_verification_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final preferenceManager = Get.put(PreferenceManager());
  final authViewModel = Get.put(AuthViewModel());
  RxBool logOuting = false.obs;
  RxString customerSupportNumber = "".obs;
  RxString version = "".obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;




  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: _refreshData,
      child: Scaffold(
        backgroundColor: CustomColors.white,
        body: RefreshIndicator(
          onRefresh: _refreshData,
          child: SafeArea(
          top: true,
            child: Obx(() => authViewModel.fetchUserDetailsObserver.value.maybeWhen(
                error: (error) => const SizedBox(width: double.infinity,height: double.infinity,child: Center(child: SingleChildScrollView(physics: AlwaysScrollableScrollPhysics(),child: SizedBox(width: double.infinity,height: 500,child: Center(child: EmptyDataView(text: "Something went wrong"),))))),
                loading: (data) => SizedBox(width: double.infinity,height: double.infinity,child: Center(child: SingleChildScrollView(physics: AlwaysScrollableScrollPhysics(),child: SizedBox(width: double.infinity,height: 500,child: Center(child: SizedBox(height: 30,width: 30,child: CircularProgressIndicator(color: CustomColors.primary)),))))),
                success: (data){
                  final userModel = (data as FetchUserDetailsResponseModel).data;

                  return SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomColors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Profile",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: CustomColors.textColor,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => RegisterUserPage(userModel: userModel));
                                      },
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                          userModel?.profilePic?.isEmpty == true ? 'https://i.stack.imgur.com/l60Hf.png' : userModel?.profilePic ?? "https://i.stack.imgur.com/l60Hf.png",
                                        ),
                                        backgroundColor: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      userModel?.name ?? "",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: CustomColors.textColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      userModel?.email ?? "",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColors.textColor,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "${userModel?.mobile ?? 0}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColors.textColor,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    IntrinsicWidth(
                                      child: Row(
                                        children: [
                                          Icon(
                                            (userModel?.gender ?? "") == "Male"
                                                ? Icons.male
                                                : (userModel?.gender ?? "") == "Female"
                                                ? Icons.female
                                                : Icons.transgender,
                                            color: CustomColors.darkGray,
                                            size: 15,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            userModel?.gender ?? "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: CustomColors.darkGray,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Icon(Icons.cake_outlined,
                                              color: CustomColors.darkGray, size: 15),
                                          const SizedBox(width: 5),
                                          Text(
                                            userModel?.dob ?? "",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: CustomColors.darkGray,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => RegisterUserPage(userModel: userModel));
                                      },
                                      child: IntrinsicWidth(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(width: 0.5,color: CustomColors.darkGray),
                                            color: CustomColors.white.withOpacity(0.3),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 6),
                                          child: Row(
                                            children: [
                                              Icon(Icons.mode_edit_outline_outlined,color: CustomColors.textColor,size: 15),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                child: Text(
                                                  "Edit Profile",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: CustomColors.textColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconTitleMessageComponent(assetImage: "assets/images/bookmark.png",title: "Saved",message: "${userModel?.favouriteHostels ?? 0}"),
                                        Container(width: 0.5,height: 50,color: CustomColors.darkGray),
                                        IconTitleMessageComponent(assetImage: "assets/images/bed.png",title: "Ongoing",message: "${userModel?.onGoingBookings ?? 0}"),
                                        Container(width: 0.5,height: 50,color: CustomColors.darkGray),
                                        IconTitleMessageComponent(assetImage: "assets/images/wallet.png",title: "Wallet",message: "${userModel?.wallet ?? 0}",onClick: (){
                                          Get.to(() => const WalletPage());
                                        })
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              decoration: AppStyles.categoryBg3,
                              child:Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ProfileMenu(title: "Helps", image: "assets/images/help.png", onTapped: (){
                                       Get.to(() => const HelpSupportPage());
                                    }),
                                    DottedLine(dashColor: CustomColors.darkGray),
                                    Obx(() => Visibility(
                                         visible: (authViewModel.kysDocuments ?? []).any((edir) =>  edir.documentStatus == "pending") == true,
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             ProfileMenu(title: "Kyc Verification", image: "assets/images/kyc.png", onTapped: (){
                                               Get.to(() => KycPage(userModel: userModel));
                                             }),
                                             DottedLine(dashColor: CustomColors.darkGray),
                                           ],
                                         ),
                                       ),
                                    ),
                                    ProfileMenu(title: "Transaction History", image: "assets/images/wallet.png", onTapped: (){
                                      Get.to(() => TransactionsPage());
                                    }),
                                    DottedLine(dashColor: CustomColors.darkGray),
                                    ProfileMenu(title: "Add Money", image: "assets/images/wallet.png", onTapped: (){
                                      Get.to(() => const WalletPage());
                                    }),
                                    DottedLine(dashColor: CustomColors.darkGray),
                                    ProfileMenu(title: "Refer And Earn", image: "assets/images/refer_and_earn_1.png", onTapped: (){
                                      Get.to(() => const ReferAndEarnPage());
                                    }),
                                    DottedLine(dashColor: CustomColors.darkGray),
                                    ProfileMenu(title: "Coupons", image: "assets/images/couponv.png", onTapped: (){
                                      Get.to(() => CouponsPage(selecting: false));
                                    }),
                                    DottedLine(dashColor: CustomColors.darkGray),
                                    Obx(() => logOuting.value == true ? CustomProgressBar() :
                                    ProfileMenu(title: "Log Out", image: "assets/images/log_out_icon.png",logOutMenu: true, onTapped: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true, // allows full height scroll
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                        ),
                                        builder: (context) {
                                          return HelperBottomSheet(assetImage: "assets/images/log_out.png",title: "Are you sure you want to log out?",message: "You will need to sign in again to access your account.",btn1Txt: "NO",btn1Click: (){
                                            Get.back();
                                          },btn2Txt: "Yes",btn2Click: ()async {
                                            Get.back();
                                            logOuting.value = true;
                                            preferenceManager.clearAll();
                                            await _auth.signOut();
                                            await _googleSignIn.signOut();
                                            logOuting.value = false;
                                            authViewModel.kysDocuments.value  =  authViewModel.initialKycDocuments;
                                            Get.offAll(() =>  MobileVerificationPage());
                                          });
                                        },
                                      );
                                      // logOutConfirmationDialog(userModel);
                                    }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Obx(()=> Text("V ${version.value ?? ""}",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: CustomColors.textColor)),
                          ),
                          SizedBox(height: 100)
                        ],
                      ),
                    ),
                  );
                },
                orElse: () => SizedBox())
            )
          ),
        ),),
    );
  }


  Future<void> _refreshData() async{
    authViewModel.fetchUserDetails(true);
    version.value = await AuthUtils.getAppVersion() ?? "";
  }
}
