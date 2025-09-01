import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/components/kyc_document_component.dart';
import 'package:pg_hostel/components/primary_button.dart';
import 'package:pg_hostel/components/secondary_heading_component.dart';
import 'package:pg_hostel/components/side_heading_component.dart';
import 'package:pg_hostel/request_model/auth_request_model.dart';
import 'package:pg_hostel/utils/app_styles.dart';
import 'package:pg_hostel/utils/custom_colors.dart';
import 'package:pg_hostel/view_models/auth_view_model.dart';

import '../response_model/auth_response_model.dart';


class KycPage extends StatefulWidget {
  final UserModel? userModel;
  const KycPage({super.key,required this.userModel});

  @override
  State<KycPage> createState() => _KycPageState();
}

class _KycPageState extends State<KycPage> {
  final authViewModel = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: SafeArea(
        top: true,
          child:  Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              const SecondaryHeadingComponent(buttonTxt: "KYC Verification"),
               Expanded(child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(decoration: AppStyles.gradient,child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.info_outline,size: 20,color: CustomColors.primary),
                            SizedBox(width: 10),
                            Expanded(child: Text("Upload a valid ID and a selfie to complete verification"))
                          ],
                        ),
                      ),),
                      Obx(() => ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context,index){
                              final documentModel =  authViewModel.kysDocuments[index];
                              return Column(
                                children: [
                                  SideHeadingComponent(title: "Upload ${documentModel.documentType}", viewVisible: false),
                                  KycDocumentComponent(documentModel:documentModel),
                                  const SizedBox(height: 10),
                                ],
                              );
                            },itemCount: authViewModel.kysDocuments.length ?? 0),
                      ),
                    ],
                  ),
                ),
              )),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                 child: Obx(() => authViewModel.registerUserResponseObserver.value.maybeWhen(
                   loading: (loading) => const CircularProgressIndicator(),
                     orElse: () => PrimaryButton(buttonTxt: "Save", buttonClick: (){
                       if(authViewModel.kysDocuments.toList().any((document) => document.uploadedUrl?.isEmpty == true) == true){
                         Get.snackbar("Error","Please Upload Files",backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
                          return;
                       }
                       print("hello2");
                     authViewModel.registerUser( RegisterUserRequestModel(image: widget.userModel?.image ?? "",name:widget.userModel?.name ?? "",mobile: "${widget.userModel?.mobile ?? 0}",email: widget.userModel?.email ?? "",dob:widget.userModel?.dob ?? "",gender:widget.userModel?.gender ?? "",address: widget.userModel?.address , kycDocuments: authViewModel.kysDocuments));
                 }))),
               )
            ],
          )),
    );
  }
}
