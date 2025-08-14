import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/components/home_page_component.dart';
import 'package:pg_hostel/components/hostel_details_component.dart';
import 'package:pg_hostel/components/hostel_details_horizontal_component1.dart';
import 'package:pg_hostel/components/side_heading_component.dart';
import 'package:pg_hostel/request_model/auth_request_model.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/shimmers/hostel_details_horizontal_shimmer.dart';
import 'package:pg_hostel/shimmers/hostel_details_shimmer.dart';
import 'package:pg_hostel/shimmers/room_details_shimmer.dart';
import 'package:pg_hostel/utils/custom_colors.dart';
import 'package:pg_hostel/utils/statefullwrapper.dart';
import 'package:pg_hostel/view_models/auth_view_model.dart';
import 'package:pg_hostel/view_models/hostel_view_model.dart';

import '../components/hostel_details_horizontal_component2.dart';
import '../components/type_of_hostel_component.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authViewModel = Get.put(AuthViewModel());
  final hostelViewModel = Get.put(HostelViewModel());
  @override
  Widget build(BuildContext context) {
    return  StatefulWrapper(
      onInit: (){
        authViewModel.fetchCurrentLocation();
        authViewModel.fetchUserDetails(false);
        hostelViewModel.fetchHostels(PaginationRequestModel(page: 1), true);
      },
      child: Scaffold(
        backgroundColor: CustomColors.white,
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const HomePageComponent(),
              const TypeOfHostelComponent(),
              const SideHeadingComponent(title: "Nearby Hostels",viewVisible: true,viewType: 1,),
              // HostelDetailsHorizontalComponent1(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 230,
                 child: Obx(
                     () => hostelViewModel.fetchHostelsObserver.value.data.value.maybeWhen(
                         loading:(data) => ListView.builder(
                             scrollDirection: Axis.horizontal,
                             itemBuilder: (context,index){
                               return HostelDetailsHorizontalShimmer(index: index, view: 1);
                             },itemCount: 4),
                         success: (data){
                           final hostelsList = (data as FetchHostelsResponseModel).data;
                           return ListView.builder(
                               scrollDirection: Axis.horizontal,
                               itemBuilder: (context,index){
                                 final hostelModel =  hostelsList?[index];
                                 return HostelDetailsHorizontalComponent1(hostelModel:hostelModel);
                               },itemCount: hostelsList?.length ?? 0);
                         },
                         orElse: () => SizedBox()) ,
                 ),
                ),
              ),
              const SideHeadingComponent(title: "Populer Hostels", viewVisible: true,viewType: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 280,
                  child: Obx(
                        () => hostelViewModel.fetchHostelsObserver.value.data.value.maybeWhen(
                        loading:(data) =>  ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return HostelDetailsHorizontalShimmer(index: index, view: 2,);
                            },itemCount: 4),
                        success: (data){
                          final hostelsList = (data as FetchHostelsResponseModel).data;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index){
                                final hostelModel =  hostelsList?[index];
                                return HostelDetailsHorizontalComponent2(hostelModel:hostelModel);
                              },itemCount: hostelsList?.length ?? 0);
                        },
                        orElse: () => SizedBox()) ,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Obx(
                    () => hostelViewModel.fetchHostelsObserver.value.data.value.maybeWhen(
                    loading:(data) => ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context,index){
                          return HostelDetailsShimmer(index: index);
                        },itemCount: 5),
                    success: (data){
                      final hostelsList = (data as FetchHostelsResponseModel).data;
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index){
                            final hostelModel =  hostelsList?[index];
                            return HostelDetailsComponent(hostelModel:hostelModel);
                          },itemCount: hostelsList?.length ?? 0);
                    },
                    orElse: () => SizedBox()) ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
