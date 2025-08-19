import 'package:flutter/material.dart';
import 'package:pg_hostel/components/booking_details_component.dart';
import 'package:pg_hostel/request_model/auth_request_model.dart';
import 'package:pg_hostel/response_model/bookings_response_model.dart';
import 'package:pg_hostel/shimmers/booking_details_shimmer.dart';
import 'package:pg_hostel/shimmers/hostel_details_shimmer.dart';
import 'package:pg_hostel/utils/app_styles.dart';
import 'package:pg_hostel/utils/custom_colors.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/view_models/booking_view_model.dart';

import '../components/amenities_component.dart';
import '../components/empty_data_view.dart';
import '../components/secondary_heading_component.dart';
import '../utils/statefullwrapper.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  final bookingsViewModel = Get.put(BookingViewModel());
  final displayList = ["All","Ongoing","Upcoming","Past"];
  RxString filterType = "All".obs;

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
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Text("My Bookings",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: CustomColors.textColor)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: displayList.length,
                      itemBuilder: (context, index) {
                        final heading = displayList[index];
                        return GestureDetector(
                          onTap: (){
                            filterType.value = heading;
                            _refreshData();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Obx(()=> Container(
                                decoration: filterType.value != heading ? BoxDecoration(borderRadius: BorderRadius.circular(15),color: CustomColors.white,border: Border.all(width: 0.5,color: CustomColors.textColor)) : AppStyles.selectedCategoryBg,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                    child: Text(heading ?? '',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: CustomColors.textColor),),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => _refreshData(),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Obx(() {
                        return bookingsViewModel.fetchBookingsObserver.value.data.value.maybeWhen(
                            loading: (loading) => ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context,index){
                                  return BookingDetailsShimmer(index: index);
                                },itemCount: 10),
                            success: (data){
                              final responseData = (data as FetchBookingsResponseModel).data;
                              final bookingsList =  responseData;
                              return (bookingsList?.length ?? 0) == 0 ? SizedBox(width: double.infinity,height: double.infinity,child: Center(child: SingleChildScrollView(physics: AlwaysScrollableScrollPhysics(),child: SizedBox(width: double.infinity,height: 500,child: Center(child: EmptyDataView(text: "No Bookings Found"),))))) :
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
                                          itemCount: bookingsList?.length ?? 0,
                                          itemBuilder: (context, index) {
                                            final bookingModel = bookingsList?[index];
                                            return BookingDetailsComponent(bookingModel:bookingModel);
                                          }),
                                      Obx(() => Visibility(
                                          visible: bookingsViewModel.fetchBookingsObserver.value.isLoading,
                                          child: BookingDetailsShimmer(index: 1)),
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
    bookingsViewModel.fetchBookings(PaginationRequestModel(page: 1,query:filterType.value),true);
  }

  Future<void> _addData() async {
    final observer = bookingsViewModel.fetchBookingsObserver;
    if(observer.value.isPaginationCompleted || observer.value.isLoading ) return;
    bookingsViewModel.fetchBookings(PaginationRequestModel(page: observer.value.page,query:filterType.value),false);
  }
}
