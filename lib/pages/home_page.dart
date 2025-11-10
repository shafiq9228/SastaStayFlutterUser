import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/api/api_result.dart';
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

import '../components/side_heading_component.dart';
import '../components/swipable_image_overlay.dart';
import '../components/home_page_component.dart';
import '../components/home_page_search.dart';
import '../components/hostel_details_component.dart';
import '../components/hostel_details_horizontal_component1.dart';
import '../components/hostel_details_horizontal_component2.dart';
import '../components/type_of_hostel_component.dart';
import 'filter_page.dart';
import 'hostels_map_view.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authViewModel = Get.put(AuthViewModel());
  final hostelViewModel = Get.put(HostelViewModel());
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _grayKey = GlobalKey();

  RxBool _hasReachedTop = false.obs;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_grayKey.currentContext == null) return;

    final renderBox = _grayKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero).dy;

    // Trigger 50px before the gray container reaches top
    const triggerOffset = 30.0;

    if (position <= triggerOffset && !_hasReachedTop.value) {
      _hasReachedTop.value = true;
      print("Gray container is near top (within 50px)!");
    }

    // Reset when scrolled away below trigger zone
    if (position > triggerOffset && _hasReachedTop.value) {
      _hasReachedTop.value = false;
    }
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () async {
        hostelViewModel.fetchHostelsObserver.value.data.value = const ApiResult.loading("");
        await authViewModel.fetchUserDetails(false);

        hostelViewModel.fetchHostels(
          const PaginationRequestModel(
            page: 1,
            type: "popular"
          ),
          true,
        );
        hostelViewModel.fetchHostels(
           PaginationRequestModel(
            page: 1,
            latitude: authViewModel.locationDetails.value?.latitude,
            longitude: authViewModel.locationDetails.value?.longitude,
          ),
          true,
        );

        hostelViewModel.fetchHostels(
          PaginationRequestModel(
            page: 1,
            type: "nearby",
            latitude: authViewModel.locationDetails.value?.latitude,
            longitude: authViewModel.locationDetails.value?.longitude,
          ),
          true,
        );
      },
      child: Scaffold(
        backgroundColor: CustomColors.white,
        body:
        Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification.metrics.pixels >=
                    scrollNotification.metrics.maxScrollExtent - 20) {
                  _addData();
                }
                return false;
              },
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const HomePageComponent(),
                    HomePageSearch(key: _grayKey),
                    const TypeOfHostelComponent(),
                    /// Nearby Hostels
                    Obx(() => hostelViewModel
                        .fetchNearbyHostelsObserver.value.data.value
                        .maybeWhen(
                      loading: (data) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          height: 230,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return HostelDetailsHorizontalShimmer(
                                  index: index, view: 1);
                            },
                            itemCount: 4,
                          ),
                        ),
                      ),
                      success: (data) {
                        final hostelsList =
                            (data as FetchHostelsResponseModel).data;
                        return hostelsList?.isNotEmpty == true
                            ? Column(
                          children: [
                            SideHeadingComponent(
                              title: "Nearby Hostels",
                              viewVisible: true,
                              viewType: 1,
                              viewClick: () {
                                Get.to(() =>
                                const SearchPage(type: "Nearby"));
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15),
                              child: SizedBox(
                                height: 230,
                                width: double.infinity,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final hostelModel =
                                    hostelsList?[index];
                                    return HostelDetailsHorizontalComponent1(
                                      hostelModel: hostelModel,
                                    );
                                  },
                                  itemCount: hostelsList?.length ?? 0,
                                ),
                              ),
                            ),
                          ],
                        )
                            : const SizedBox();
                      },
                      orElse: () => const SizedBox(),
                    ),
                    ),
                    const SwipableImageOverlay(
                      imageHeight: 150,
                      viewportFraction: 1,
                    ),
                    /// Popular Hostels
                    Obx(
                          () => hostelViewModel
                          .fetchPopularHostelsObserver.value.data.value
                          .maybeWhen(
                        loading: (data) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SizedBox(
                            height: 230,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return HostelDetailsHorizontalShimmer(
                                  index: index,
                                  view: 2,
                                );
                              },
                              itemCount: 4,
                            ),
                          ),
                        ),
                        success: (data) {
                          final hostelsList =
                              (data as FetchHostelsResponseModel).data;
                          return Column(
                            children: [
                              SideHeadingComponent(
                                title: "Popular Hostels",
                                viewVisible: true,
                                viewType: 1,
                                viewClick: () {
                                  Get.to(() =>
                                  const SearchPage(type: "Popular"));
                                },
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 15),
                                child: SizedBox(
                                  height: 230,
                                  width: double.infinity,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      final hostelModel = hostelsList?[index];
                                      return HostelDetailsHorizontalComponent2(
                                        hostelModel: hostelModel,
                                      );
                                    },
                                    itemCount: hostelsList?.length ?? 0,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        orElse: () => const SizedBox(),
                      ),
                    ),

                    /// Hostel Feed
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Hostel Feed",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: CustomColors.black,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          InkWell(
                            onTap: () {
                              Get.to(() => FilterPage());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 0.5,
                                  color: CustomColors.darkGray,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Filter",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: CustomColors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Image.asset(
                                      "assets/images/filter.png",
                                      width: 10,
                                      height: 10,
                                      color: CustomColors.textColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              Get.to(() => HostelsMapView());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 0.5,
                                  color: CustomColors.darkGray,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Map View",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: CustomColors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Image.asset(
                                      "assets/images/map.png",
                                      width: 10,
                                      height: 10,
                                      color: CustomColors.textColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    /// Main Hostel List
                    Obx(
                          () => hostelViewModel
                          .fetchHostelsObserver.value.data.value
                          .maybeWhen(
                        loading: (data) => ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return HostelDetailsShimmer(index: index);
                          },
                          itemCount: 5,
                        ),
                        success: (data) {
                          final hostelsList =
                              (data as FetchHostelsResponseModel).data;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              final hostelModel = hostelsList?[index];
                              return HostelDetailsComponent(
                                hostelModel: hostelModel,
                              );
                            },
                            itemCount: hostelsList?.length ?? 0,
                          );
                        },
                        orElse: () => const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() => AnimatedOpacity(
                opacity: _hasReachedTop.value ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: IgnorePointer(
                  ignoring: !_hasReachedTop.value, // Prevent taps when invisible
                  child: HomePageSearch(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addData() async {
    final observer = hostelViewModel.fetchHostelsObserver;
    if (observer.value.isPaginationCompleted || observer.value.isLoading) {
      return;
    }
    hostelViewModel.fetchHostels(
      PaginationRequestModel(
        page: observer.value.page,
        latitude: authViewModel.locationDetails.value?.latitude,
        longitude: authViewModel.locationDetails.value?.longitude,
      ),
      false,
    );
  }
}
