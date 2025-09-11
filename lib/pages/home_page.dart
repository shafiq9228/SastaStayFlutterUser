import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/components/home_page_component.dart';
import 'package:pg_hostel/components/hostel_details_component.dart';
import 'package:pg_hostel/components/hostel_details_horizontal_component1.dart';
import 'package:pg_hostel/components/secondary_heading_component.dart';
import 'package:pg_hostel/components/side_heading_component.dart';
import 'package:pg_hostel/pages/filter_page.dart';
import 'package:pg_hostel/pages/hostels_map_view.dart';
import 'package:pg_hostel/pages/search_page.dart';
import 'package:pg_hostel/request_model/auth_request_model.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/shimmers/hostel_details_horizontal_shimmer.dart';
import 'package:pg_hostel/shimmers/hostel_details_shimmer.dart';
import 'package:pg_hostel/shimmers/room_details_shimmer.dart';
import 'package:pg_hostel/utils/custom_colors.dart';
import 'package:pg_hostel/utils/statefullwrapper.dart';
import 'package:pg_hostel/view_models/auth_view_model.dart';
import 'package:pg_hostel/view_models/hostel_view_model.dart';

import '../components/banner_widget.dart';
import '../components/hostel_details_horizontal_component2.dart';
import '../components/swipable_image_overlay.dart';
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
      onInit: () async {
        hostelViewModel.fetchHostels(PaginationRequestModel(page: 1,type:"popular"), true);
        hostelViewModel.fetchHostels(PaginationRequestModel(page: 1), true);
        await authViewModel.fetchUserDetails(false);
        hostelViewModel.fetchHostels(PaginationRequestModel(page: 1,type: "nearby",latitude:authViewModel.locationDetails.value?.latitude,longitude:authViewModel.locationDetails.value?.longitude), true);
      },
      child: Scaffold(
        backgroundColor: CustomColors.white,
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const HomePageComponent(),
              const TypeOfHostelComponent(),
              // HostelDetailsHorizontalComponent1(),
              Obx(
                  () => hostelViewModel.fetchNearbyHostelsObserver.value.data.value.maybeWhen(
                      loading:(data) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index){
                                return HostelDetailsHorizontalShimmer(index: index, view: 1);
                              },itemCount: 4),
                        ),
                      ),
                      success: (data){
                        final hostelsList = (data as FetchHostelsResponseModel).data;
                        return hostelsList?.isNotEmpty == true ? Column(
                          children: [
                            SideHeadingComponent(title: "Nearby Hostels", viewVisible: true,viewType: 1,viewClick: (){
                              Get.to(() => const SearchPage(type: "Nearby"));
                            }),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                height: 250,
                                width: double.infinity,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context,index){
                                      final hostelModel =  hostelsList?[index];
                                      return HostelDetailsHorizontalComponent1(hostelModel:hostelModel);
                                    },itemCount: hostelsList?.length ?? 0),
                              ),
                            ),
                          ],
                        ) : SizedBox();
                      },
                      orElse: () => SizedBox()) ,
              ),
              const SwipableImageOverlay(imageHeight:150,viewportFraction:1),
              Obx(
                    () => hostelViewModel.fetchPopularHostelsObserver.value.data.value.maybeWhen(
                    loading:(data) =>  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 280,
                        width: double.infinity,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return HostelDetailsHorizontalShimmer(index: index, view: 2,);
                            },itemCount: 4),
                      ),
                    ),
                    success: (data){
                      final hostelsList = (data as FetchHostelsResponseModel).data;
                      return Column(
                        children: [
                          SideHeadingComponent(title: "Popular Hostels", viewVisible: true,viewType: 1,viewClick: (){
                            Get.to(() => const SearchPage(type: "Popular"));
                          }),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              height: 280,
                              width: double.infinity,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context,index){
                                    final hostelModel =  hostelsList?[index];
                                    return HostelDetailsHorizontalComponent2(hostelModel:hostelModel);
                                  },itemCount: hostelsList?.length ?? 0),
                            ),
                          ),
                        ],
                      );
                    },
                    orElse: () => SizedBox()) ,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Row(
                  children: [
                    Expanded(child: Text("Hostel Feed",style:  TextStyle(fontWeight: FontWeight.w800,fontSize: 22,color: CustomColors.black))),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap:(){
                        Get.to(() => FilterPage());
                      },
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(width: 0.5,color: CustomColors.darkGray)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Row(
                            children: [
                              Text("Filter",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: CustomColors.black)),
                              const SizedBox(width: 5),
                              Image.asset("assets/images/filter.png",width: 15,height: 15,color: CustomColors.textColor)
                            ],
                          ),
                        ),),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap:(){
                        Get.to(() => HostelsMapView());
                      },
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(width: 0.5,color: CustomColors.darkGray)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Row(
                            children: [
                              Text("Map View",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: CustomColors.black)),
                              const SizedBox(width: 5),
                              Image.asset("assets/images/map.png",width: 15,height: 15,color: CustomColors.textColor)
                            ],
                          ),
                        ),),
                    )
                  ],
                ),
              ),
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
