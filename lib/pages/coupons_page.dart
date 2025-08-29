import 'dart:math';

import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pg_hostel/response_model/bookings_response_model.dart';
import 'package:pg_hostel/view_models/hostel_view_model.dart';

import '../components/coupon_code_component.dart';
import '../components/custom_progress_bar.dart';
import '../components/empty_data_view.dart';
import '../components/secondary_heading_component.dart';
import '../request_model/auth_request_model.dart';
import '../utils/app_styles.dart';
import '../utils/custom_colors.dart';
import '../utils/statefullwrapper.dart';


class CouponsPage extends StatefulWidget {
  const CouponsPage({super.key});

  @override
  State<CouponsPage> createState() => _CouponsPageState();
}

class _CouponsPageState extends State<CouponsPage> {
  final hostelViewModel = Get.put(HostelViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: StatefulWrapper(
        onInit: _refreshData,
        child: SafeArea(
            top:true,
            child: Column(
              children: [
                SecondaryHeadingComponent(buttonTxt: "Coupons", buttonClick: (){
                  Get.back();
                }),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => _refreshData(),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Obx(() {
                        return hostelViewModel.fetchCouponsObserver.value.data.value.maybeWhen(
                            loading: (loading) => ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context,index){
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
                                    child: FadeShimmer(
                                      height: 50,
                                      width: double.infinity,
                                      radius: 20,
                                      millisecondsDelay: index*300,
                                      highlightColor: Colors.grey.shade200,
                                      baseColor:Colors.white,
                                    ),
                                  );
                                },itemCount: 10),
                            success: (data){
                              final responseData = (data as FetchCouponsResponseModel).data;
                              final couponsList =  responseData;
                              return (couponsList?.length ?? 0) == 0 ? SizedBox(width: double.infinity,height: double.infinity,child: Center(child: SingleChildScrollView(physics: AlwaysScrollableScrollPhysics(),child: SizedBox(width: double.infinity,height: 500,child: Center(child: EmptyDataView(text: "No Coupons Found"),))))) :
                              NotificationListener(
                                onNotification: (ScrollNotification scrollNotification) {
                                  if (scrollNotification.metrics.pixels >= scrollNotification.metrics.maxScrollExtent - 20) {
                                    _addData();
                                  }
                                  return false;
                                },
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: couponsList?.length ?? 0,
                                          itemBuilder: (context, index) {
                                            final couponModel = couponsList?[index];
                                            return CouponCodeComponent(couponModel:couponModel);
                                          }),
                                      Visibility(
                                        visible: (couponsList?.length ?? 0) < 5,
                                        child: SizedBox(
                                          height: max(0, (5 - (couponsList?.length ?? 0)) * 200),
                                          width: double.infinity,
                                        ),
                                      ),
                                      Obx(() => Visibility(
                                          visible: hostelViewModel.fetchCouponsObserver.value.isLoading,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: FadeShimmer(
                                              height: 50,
                                              width: double.infinity,
                                              radius: 20,
                                              millisecondsDelay: 300,
                                              highlightColor: Colors.grey.shade200,
                                              baseColor:Colors.white,
                                            ),
                                          )),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            orElse: () => SizedBox(width: double.infinity,height: double.infinity,child: const Center(child: EmptyDataView(text: "No Coupons Found"))));
                      }
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),);
  }

  Future<void> _refreshData() async{
    hostelViewModel.fetchCoupons(PaginationRequestModel(page: 1),true);
  }

  Future<void> _addData() async {
    final observer = hostelViewModel.fetchCouponsObserver;
    if(observer.value.isPaginationCompleted || observer.value.isLoading ) return;
    hostelViewModel.fetchCoupons(PaginationRequestModel(page: observer.value.page),false);
  }
}
