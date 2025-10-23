import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/components/hostel_details_component.dart';
import 'package:pg_hostel/components/secondary_heading_component.dart';
import 'package:pg_hostel/components/sort_by_bottom_sheet.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/shimmers/hostel_details_shimmer.dart';
import 'package:pg_hostel/utils/app_styles.dart';
import 'package:pg_hostel/utils/preference_manager.dart';
import 'package:pg_hostel/view_models/auth_view_model.dart';
import 'package:pg_hostel/view_models/hostel_view_model.dart';

import '../api/api_result.dart';
import '../components/empty_data_view.dart';
import '../request_model/auth_request_model.dart';
import '../utils/custom_colors.dart';
import '../utils/statefullwrapper.dart';
import 'filter_page.dart';


class SearchPage extends StatefulWidget {
  final String? search;
  final String type;
  const SearchPage({super.key, this.search, required this.type});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final authViewModel = Get.put(AuthViewModel());
  final hostelViewModel = Get.put(HostelViewModel());
  final TextEditingController searchController = TextEditingController();
  RxString searchQuery = "".obs;
  Timer? _debounce;
  final preferenceManager =  Get.put(PreferenceManager());
  RxList<String> recentSearchList = <String>[].obs;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: StatefulWrapper(
        onInit: () async {
          if (widget.search != null) {
            searchQuery.value = widget.search ?? "";
            searchController.text = widget.search ?? "";
            _onSearchChanged();
          }
          else if (widget.type == "Filter") {
            _refreshData("");
          }

          recentSearchList.value = await preferenceManager.getRecentSearches();
        }
        ,
        child: SafeArea(
            top:true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.type.toLowerCase() == "search" ? Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Get.close(1);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(width:20,height:20,child: Image.asset("assets/images/back_btn.png",color: CustomColors.textColor)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: AppStyles.categoryBg3,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(width:20,height:20,child: Image.asset("assets/images/search.png",color: CustomColors.textColor)),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: searchController,
                                      onChanged: (query){
                                        searchQuery.value = query;
                                        _onSearchChanged();
                                      },
                                      style: TextStyle(
                                          color:CustomColors.textColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16
                                      ),
                                      decoration: const InputDecoration(
                                        counterText: '',
                                        hintText: 'Search By Address,Hostel Name..',
                                        hintStyle: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w500),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                      )
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Obx(() => searchQuery.value.isEmpty ? GestureDetector(
                                      onTap: (){
                                        Get.off(() => const FilterPage());
                                      },
                                      child: SizedBox(height: 20,width: 20,child: Center(child: Image.asset("assets/images/filter.png")))) : hostelViewModel.fetchSearchedHostelsObserver.value.data.value.maybeWhen(
                                      loading: (_) => SizedBox(height: 10,width: 10,child: Center(child: CircularProgressIndicator(color:CustomColors.textColor,strokeWidth: 2))),
                                      orElse: () => GestureDetector(
                                          onTap: () async {
                                            searchController.clear();
                                            searchQuery.value = "";
                                            _onSearchChanged();
                                          },
                                          child: SizedBox(height: 20,width: 20,child: Center(child: Icon(Icons.cancel_outlined,color:CustomColors.textColor)))))),
                                )
                              ],),
                          ),
                        ),
                      ],
                    ),
                  ),
                ) :
                SecondaryHeadingComponent(buttonTxt: "${widget.type} Hostels",),
                Obx(() =>
                   Visibility(
                     visible: recentSearchList.isNotEmpty && searchQuery.value.trim().isEmpty && widget.type.toLowerCase() == "search",
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Recent Search",style: TextStyle(fontSize: 16,color: CustomColors.textColor,fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          Wrap(
                              spacing: 8,
                              children: recentSearchList.map((item) {
                                return InkWell(
                                    onTap: () async {
                                      searchQuery.value = item;
                                      searchController.text = item;
                                      _onSearchChanged();
                                    }, child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 3),
                                      child: Container(decoration: AppStyles.categoryBg6,child: IntrinsicWidth(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                          child: Row(children: [
                                          Text(item,style: TextStyle(fontSize: 14,color: CustomColors.textColor,fontWeight: FontWeight.w600)),
                                          const SizedBox(width:5),
                                          Image.asset("assets/images/recent.png",width: 15,height: 15)
                                          ],
                                          ),
                                        ),
                                      ),),
                                    )
                                );}).toList()
                          )
                        ],
                       ),
                     ),
                   ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => _refreshData(""),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Obx(() {
                        final observer = widget.type.toLowerCase() == "favourites" ? hostelViewModel.fetchFavouriteHostelsObserver : widget.type.toLowerCase() == "search" ? hostelViewModel.fetchSearchedHostelsObserver : widget.type.toLowerCase() == "nearby" ? hostelViewModel.fetchNearbyHostelsObserver : widget.type.toLowerCase() == "popular" ? hostelViewModel.fetchPopularHostelsObserver  : widget.type.toLowerCase() == "filter" ? hostelViewModel.fetchFilterHostelsObserver  : hostelViewModel.fetchHostelsObserver;
                        print(widget.type.toLowerCase());
                        return observer.value.data.value.maybeWhen(
                            loading: (loading) => ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context,index){
                                  return HostelDetailsShimmer(index: index);
                                },itemCount: 10),
                            success: (data){
                              final responseData = (data as FetchHostelsResponseModel).data;
                              final hostelList =  responseData;
                              return (hostelList?.length ?? 0) == 0 ? SizedBox(width: double.infinity,height: double.infinity,child: Center(child: SingleChildScrollView(physics: AlwaysScrollableScrollPhysics(),child: SizedBox(width: double.infinity,height: 500,child: Center(child: EmptyDataView(text: "No Hostels Found"),))))) :
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
                                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                        child: Row(
                                          children: [
                                            Expanded(child: Text("Hostels (${hostelList?.length ?? 0}) ",style: TextStyle(fontWeight: FontWeight.w700,color: CustomColors.textColor,fontSize: 18))),
                                            Visibility(
                                              visible: widget.type.toLowerCase() == "filter",
                                              child: InkWell(
                                                onTap:(){
                                                  showModalBottomSheet(
                                                    context: context,
                                                    isScrollControlled: true,
                                                    shape: const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                                    ),
                                                    builder: (context) {
                                                      return  SortByBottomSheet(onClick: (id){
                                                         Get.back();
                                                        _refreshData(id);
                                                      },);
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  decoration: AppStyles.categoryBg3,
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.all(5),
                                                          child: Image.asset("assets/images/sort.png",width: 20,height: 20),
                                                        ),
                                                        Text("Sort",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: CustomColors.black)),
                                                      ],
                                                    ),
                                                  ),),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: hostelList?.length ?? 0,
                                          itemBuilder: (context, index) {
                                            final hostelModel = hostelList?[index];
                                            return HostelDetailsComponent(hostelModel: hostelModel);
                                          }),
                                      Visibility(
                                        visible: (hostelList?.length ?? 0) < 2,
                                        child: SizedBox(
                                          height: max(0, (2 - (hostelList?.length ?? 0)) * 200),
                                          width: double.infinity,
                                        ),
                                      ),
                                      Obx(() => Visibility(
                                          visible: observer.value.isLoading,
                                          child: const HostelDetailsShimmer(index: 1)),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            orElse: () => const SizedBox(width: double.infinity,height: double.infinity,child: const Center(child: EmptyDataView(text: "No Hostels Found"))));
                      }
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),);
  }

  Future<void> _onSearchChanged() async {
    final observer = widget.type.toLowerCase() == "favourites" ? hostelViewModel.fetchFavouriteHostelsObserver : widget.type.toLowerCase() == "search" ? hostelViewModel.fetchSearchedHostelsObserver : widget.type?.toLowerCase() == "nearby" ? hostelViewModel.fetchNearbyHostelsObserver : widget.type?.toLowerCase() == "popular" ? hostelViewModel.fetchPopularHostelsObserver : widget.type.toLowerCase() == "filter" ? hostelViewModel.fetchFilterHostelsObserver  : hostelViewModel.fetchHostelsObserver;
    observer.value.data.value = const ApiResult.loading("");
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      if(searchQuery.value.trim().isNotEmpty){
        await preferenceManager.addSearchItem(searchQuery.value);
        recentSearchList.value = await preferenceManager.getRecentSearches();
        _refreshData("");
      }
      else{
        observer.value.data.value = const ApiResult.init();
      }
    });
  }

  Future<void> _refreshData(String sort) async{
    hostelViewModel.fetchHostels(PaginationRequestModel(page: 1,type:widget.type.toLowerCase(),query:searchQuery.value,latitude: authViewModel.locationDetails.value?.latitude,longitude: authViewModel.locationDetails.value?.longitude,sort:sort),true);
  }

  Future<void> _addData() async {
    final observer = widget.type.toLowerCase() == "favourites" ? hostelViewModel.fetchFavouriteHostelsObserver : widget.type.toLowerCase() == "search" ? hostelViewModel.fetchSearchedHostelsObserver : widget.type?.toLowerCase() == "nearby" ? hostelViewModel.fetchNearbyHostelsObserver : widget.type?.toLowerCase() == "popular" ? hostelViewModel.fetchPopularHostelsObserver : widget.type.toLowerCase() == "filter" ? hostelViewModel.fetchFilterHostelsObserver : hostelViewModel.fetchHostelsObserver;
    if(observer.value.isPaginationCompleted || observer.value.isLoading ) return;
    hostelViewModel.fetchHostels(PaginationRequestModel(page: observer.value.page,type:widget.type.toLowerCase(),query:searchQuery.value,latitude: authViewModel.locationDetails.value?.latitude,longitude: authViewModel.locationDetails.value?.longitude),false);
  }
}
