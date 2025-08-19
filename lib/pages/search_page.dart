import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/components/hostel_details_component.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/shimmers/hostel_details_shimmer.dart';
import 'package:pg_hostel/utils/app_styles.dart';
import 'package:pg_hostel/view_models/hostel_view_model.dart';

import '../api/api_result.dart';
import '../components/empty_data_view.dart';
import '../request_model/auth_request_model.dart';
import '../utils/custom_colors.dart';
import '../utils/statefullwrapper.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final hostelViewModel = Get.put(HostelViewModel());
  RxString searchQuery = "".obs;
  final TextEditingController searchEditController = TextEditingController();
  Timer? _debounce;

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
        onInit: _refreshData,
        child: SafeArea(
            top:true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
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
                                      controller: searchEditController,
                                      onChanged: (query){
                                        searchQuery.value = query;
                                        _onSearchChanged(query);
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
                                  child: Obx(() => searchQuery.value.isEmpty ? const SizedBox() : hostelViewModel.fetchSearchedHostelsObserver.value.data.value.maybeWhen(
                                      loading: (_) => SizedBox(height: 10,width: 10,child: Center(child: CircularProgressIndicator(color:CustomColors.textColor,strokeWidth: 2))),
                                      orElse: () => GestureDetector(
                                          onTap: (){
                                            searchQuery.value = "";
                                            _refreshData();
                                          },
                                          child: SizedBox(height: 20,width: 20,child: Center(child: Icon(Icons.cancel_outlined,color:CustomColors.textColor)))))),
                                )
                              ],),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(20),
                //   child: Container(width: double.infinity
                //       ,decoration: BoxDecoration(color: CustomColors.white,borderRadius: BorderRadius.circular(20),border: Border.all(width: 0.5,color: CustomColors.lightGray)),
                //       child:Padding(
                //         padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                //         child: Row(
                //           children: [
                //             Image.asset("assets/images/search.png",width: 20,height: 20,color: CustomColors.gray),
                //             const SizedBox(width: 10),
                //             Text("Search by area,hostel or city",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: CustomColors.gray),),
                //           ],
                //         ),
                //       )),
                // ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => _refreshData(),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Obx(() {
                        return hostelViewModel.fetchSearchedHostelsObserver.value.data.value.maybeWhen(
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
                                    children: [
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: hostelList?.length ?? 0,
                                          itemBuilder: (context, index) {
                                            final hostelModel = hostelList?[index];
                                            return HostelDetailsComponent(hostelModel: hostelModel);
                                          }),
                                      Obx(() => Visibility(
                                          visible: hostelViewModel.fetchSearchedHostelsObserver.value.isLoading,
                                          child: HostelDetailsShimmer(index: 1)),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            orElse: () => SizedBox(width: double.infinity,height: double.infinity,child: const Center(child: EmptyDataView(text: "No Hostels Found"))));
                      }
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),);
  }

  void _onSearchChanged(String query) {
    hostelViewModel.fetchSearchedHostelsObserver.value.data.value = const ApiResult.loading("");
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      searchQuery.value = query;;
      _refreshData();
    });
  }

  Future<void> _refreshData() async{
    hostelViewModel.fetchHostels(PaginationRequestModel(page: 1,type: "search",query:searchQuery.value),true);
  }

  Future<void> _addData() async {
    final observer = hostelViewModel.fetchSearchedHostelsObserver;
    if(observer.value.isPaginationCompleted || observer.value.isLoading ) return;
    hostelViewModel.fetchHostels(PaginationRequestModel(page: observer.value.page,type: "search",query:searchQuery.value),false);
  }
}
