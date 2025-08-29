import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';

import '../components/empty_data_view.dart';
import '../components/hostel_details_component.dart';
import '../request_model/auth_request_model.dart';
import '../shimmers/hostel_details_shimmer.dart';
import '../utils/custom_colors.dart';
import '../utils/statefullwrapper.dart';
import '../view_models/hostel_view_model.dart';

import 'package:get/get.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  final hostelViewModel = Get.put(HostelViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: StatefulWrapper(
        onInit: (){
          _refreshData();
        },
        child: SafeArea(
            top:true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Text("My Favourites",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: CustomColors.textColor)),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => _refreshData(),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Obx(() {
                        return hostelViewModel.fetchFavouriteHostelsObserver.value.data.value.maybeWhen(
                            loading: (loading) => ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context,index){
                                  return HostelDetailsShimmer(index: index);
                                },itemCount: 5),
                            success: (data){
                              final responseData = (data as FetchHostelsResponseModel).data;
                              final hostelsList =  responseData;
                              return (hostelsList?.length ?? 0) == 0 ? const SizedBox(width: double.infinity,height: double.infinity,child: Center(child: SingleChildScrollView(physics: AlwaysScrollableScrollPhysics(),child: SizedBox(width: double.infinity,height: 500,child: Center(child: EmptyDataView(text: "No Favourites Found"),))))) :
                              NotificationListener(
                                onNotification: (ScrollNotification scrollNotification) {
                                  if (scrollNotification.metrics.pixels >= scrollNotification.metrics.maxScrollExtent - 20) {
                                    _addData();
                                  }
                                  return false;
                                },
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical:10,horizontal: 20),
                                        child: Text("Hostels (${hostelsList?.length ?? 0}) ",style: TextStyle(fontWeight: FontWeight.w700,color: CustomColors.textColor,fontSize: 22)),
                                      ),
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context,index){
                                            final hostelModel =  hostelsList?[index];
                                            return HostelDetailsComponent(hostelModel:hostelModel);
                                          },itemCount: hostelsList?.length ?? 0),
                                      Visibility(
                                        visible: (hostelsList?.length ?? 0) < 5,
                                        child: SizedBox(
                                          height: max(0, (5 - (hostelsList?.length ?? 0)) * 200),
                                          width: double.infinity,
                                        ),
                                      ),
                                      Obx(() => Visibility(
                                          visible: hostelViewModel.fetchFavouriteHostelsObserver.value.isLoading,
                                          child: HostelDetailsShimmer(index: 0)),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            orElse: () => const SizedBox(width: double.infinity,height: double.infinity,child: Center(child: EmptyDataView(text: "No Favourites Found"))));
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
    hostelViewModel.fetchHostels(PaginationRequestModel(page: 1,type: "favourites"),true);
  }

  Future<void> _addData() async {
    final observer = hostelViewModel.fetchFavouriteHostelsObserver;
    if(observer.value.isPaginationCompleted || observer.value.isLoading ) return;
    hostelViewModel.fetchHostels(PaginationRequestModel(page: observer.value.page,type: "favourites"),false);
  }

}
