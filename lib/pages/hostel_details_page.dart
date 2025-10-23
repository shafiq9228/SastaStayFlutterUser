import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pg_hostel/api/api_result.dart';
import 'package:pg_hostel/components/amenities_component.dart';
import 'package:pg_hostel/components/custom_outlined_button.dart';
import 'package:pg_hostel/components/empty_data_view.dart';
import 'package:pg_hostel/components/error_text_component.dart';
import 'package:pg_hostel/components/hostel_details_extra_options_view.dart';
import 'package:pg_hostel/components/primary_button.dart';
import 'package:pg_hostel/components/rating_component.dart';
import 'package:pg_hostel/components/read_more_text.dart';
import 'package:pg_hostel/components/secondary_heading_component.dart';
import 'package:pg_hostel/pages/checkout_page.dart';
import 'package:pg_hostel/pages/hostel_images_page.dart';
import 'package:pg_hostel/pages/hostels_map_view.dart';
import 'package:pg_hostel/pages/rating_reviews_page.dart';
import 'package:pg_hostel/pages/rooms_list_page.dart';
import 'package:pg_hostel/response_model/bookings_response_model.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/shimmers/hostel_details_page_shimmer.dart';
import 'package:pg_hostel/utils/app_styles.dart';
import 'package:pg_hostel/utils/auth_utils.dart';
import 'package:pg_hostel/utils/custom_colors.dart';
import 'package:pg_hostel/utils/statefullwrapper.dart';
import 'package:pg_hostel/view_models/auth_view_model.dart';
import 'package:pg_hostel/view_models/booking_view_model.dart';
import 'package:pg_hostel/view_models/hostel_view_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:url_launcher/url_launcher.dart';


import '../components/animated_tap.dart';
import '../components/custom_network_image.dart';
import '../components/room_component_1.dart';
import '../components/side_heading_component.dart';
import '../components/title_message_component.dart';
import '../request_model/auth_request_model.dart';
import 'package:get/get.dart';

import 'amenities_page.dart';

class HostelDetailPage extends StatefulWidget {
  final String? hostelId;
  const HostelDetailPage({super.key, required this.hostelId});

  @override
  State<HostelDetailPage> createState() => _HostelDetailPageState();
}

class _HostelDetailPageState extends State<HostelDetailPage> {
  final hostelViewModel = Get.put(HostelViewModel());
  final authViewModel = Get.put(AuthViewModel());
  final bookingViewModel = Get.put(BookingViewModel());

  @override
  Widget build(BuildContext context) {

    return StatefulWrapper(
      onInit: (){
        bookingViewModel.guestDetailsList.clear();
        bookingViewModel.bookingRequestModelObserver.value = null;
        bookingViewModel.checkHostelRoomAvailabilityObserver.value = ApiResult.init();
        hostelViewModel.fetchHostelDetails(PaginationRequestModel(page: 1,docId:widget.hostelId));
      },
      child: Scaffold(
        backgroundColor: CustomColors.white,
        body: Obx(() => hostelViewModel.fetchHostelDetailsObserver.value.maybeWhen(
          loading: (loading) => HostelDetailsPageShimmer(),
            success: (data){
            final hostelData = (data as FetchHostelDetailsResponseModel).data;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 250.0,
                  floating: false,
                  pinned: true,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => Get.back(),
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Circle background color
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(child: Image.asset("assets/images/back_btn.png",width: 10,height: 10,)),
                      ),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Hero(
                      tag: hostelData?.id ?? "",
                      child: InkWell(
                        onTap: (){
                          Get.to(() => HostelImagesPage(imageDataList: hostelData?.images ?? []));
                        },
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CustomNetworkImage(imageUrl: hostelData?.hostelImage ??"",width: double.infinity,height: 300,fit: BoxFit.cover,),
                            Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                          child: Visibility(
                            visible: hostelData?.images?.isNotEmpty == true,
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: CustomColors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: (hostelData?.images?.isNotEmpty == true)
                                      ? ((hostelData!.images!.first.images?.length ?? 0) > 5
                                      ? 5
                                      : hostelData.images!.first.images?.length ?? 0)
                                      : 0,
                                  itemBuilder: (context, index) {
                                    final images = hostelData?.images?.isNotEmpty == true
                                        ? hostelData!.images!.first.images ?? []
                                        : [];

                                    if (images.isEmpty) return const SizedBox.shrink();

                                    final imageUrl = images[index];

                                    // If last index and more than 5 images
                                    if (index == 4 && images.length > 5) {
                                      final remainingCount = images.length - 5;
                                      return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            CustomNetworkImage(
                                              imageUrl: imageUrl,
                                              fit: BoxFit.cover,
                                              width: 40,
                                              height: 40,
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.black54,
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                '+$remainingCount',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }

                                    // Normal image item
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: CustomNetworkImage(
                                        imageUrl: imageUrl,
                                        fit: BoxFit.cover,
                                        width: 50,
                                        height: 50,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                            Container(
                              height: 30,
                              width: double.infinity,
                              decoration: BoxDecoration(color: CustomColors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))),
                            )
                        ],
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    InkWell(
                      onTap: (){

                      },
                      child: Container(width:35,height:35,decoration: AppStyles.whiteCircleBg,child:Center(child: Icon(Icons.share,size: 20,))),
                    ),
                    const SizedBox(width: 10),
                    Obx(() => hostelViewModel.updateFavouritesObserver.value.maybeWhen(
                        loading: (loadingId) => loadingId ==  hostelData?.id ? const CircularProgressIndicator() : Container(width: 30,height: 30,decoration: AppStyles.whiteCircleBg,child:Center(child: Icon(hostelData?.isFavorite == true ? Icons.favorite : Icons.favorite_outline_rounded,size: 20,color: hostelData?.isFavorite == true ? CustomColors.red : CustomColors.black))),
                        orElse: () => AnimatedTap(
                          onTap: (){
                            hostelViewModel.updateFavouriteStatus(hostelData?.id ?? "",hostelData?.isFavorite ?? false);
                          },
                          child: Container(width: 30,height: 30,decoration: AppStyles.whiteCircleBg,child:Center(child: Icon(hostelData?.isFavorite == true ? Icons.favorite : Icons.favorite_outline_rounded,size: 20,color: hostelData?.isFavorite == true ? CustomColors.red : CustomColors.black))),
                        )
                    )
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                hostelData?.hostelName ?? 'Hostel',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Image.asset("assets/images/star.png",width: 18,height: 18),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Text("${hostelData?.rating ?? 0}",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16,color: CustomColors.black,decoration: TextDecoration.underline)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Image.asset("assets/images/location.png",width: 10,height: 10,color: CustomColors.textColor),
                              Expanded(child: Text(hostelData?.location?.address1 ?? "",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: CustomColors.textColor))),
                              Text("${AuthUtils.formatNumber(hostelData?.totalVotes ?? 0)} reviews",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray))
                            ],
                          ),
                        ),
                        ReadMoreText(text:  hostelData?.aboutHostel ?? 'No description available'),
                        // Chip(
                        //   label: Text(hostelData?.hostelType ?? 'Type'),
                        //   backgroundColor: _getHostelTypeColor(hostelData?.hostelType),
                        // ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            width: double.infinity,
                            color: CustomColors.lightGray,
                            height: 5,
                          ),
                        ),
                        SideHeadingComponent(title: "Amenities",
                            viewVisible: false
                            // viewVisible: (hostelData?.amenitiesMore ?? 0) > 0
                            ,viewClick: (){

                        },viewType: 2),
                        authViewModel.buildAmenitiesGrid(hostelData?.amenities,hostelData?.amenitiesMore,hostelData?.id ?? ""),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            width: double.infinity,
                            color: CustomColors.lightGray,
                            height: 5,
                          ),
                        ),
                        SideHeadingComponent(title: "Room Type",
                            viewVisible: true,
                            // viewVisible: (hostelData?.roomsMore ?? 0) > 0,
                            viewClick: (){
                          Get.to(() => RoomsListPage(hostelId: hostelData?.id ?? ""));
                        }),
                        _buildHostelRoomsList(hostelData),
                        Visibility(visible: (hostelData?.faq ?? []).isNotEmpty,child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                width: double.infinity,
                                color: CustomColors.lightGray,
                                height: 5,
                              ),
                            ),
                            const SideHeadingComponent(title: "Why To Book this Hostel ?",viewVisible: false),
                          ],
                        )),
                        _buildFaqList(hostelData?.faq ?? []),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            width: double.infinity,
                            color: CustomColors.lightGray,
                            height: 5,
                          ),
                        ),
                        SideHeadingComponent(title: "Ratings And Reviews",viewVisible: true,viewClick: (){
                          Get.to(() => RatingReviewsPage(hostelId: hostelData?.id ?? "", rating: double.tryParse((hostelData?.rating ?? "0").toString()) ?? 0, categoryRating:  hostelData?.categoryRatings));
                        }),
                        RatingComponent(rating: double.tryParse((hostelData?.rating ?? "0").toString()) ?? 0,categoryRatings:hostelData?.categoryRatings),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            width: double.infinity,
                            color: CustomColors.lightGray,
                            height: 5,
                          ),
                        ),
                        const SideHeadingComponent(title: "Location",viewVisible:false),
                        _buildLocationInfo(hostelData?.location),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            width: double.infinity,
                            color: CustomColors.lightGray,
                            height: 5,
                          ),
                        ),
                        HostelDetailsExtraOptionsView(rules: hostelData?.rules ?? [],checkInTime: hostelData?.checkInTime,checkOutTime: hostelData?.checkOutTime, mobileNumber: ""),
                        const SizedBox(height: 30),
                        Obx(() => bookingViewModel.bookingRequestModelObserver.value != null ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                width: double.infinity,
                                color: CustomColors.lightGray,
                                height: 5,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(child: Text("Your Booking Details",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: CustomColors.black))),
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: (){
                                    Get.to(() => RoomsListPage(hostelId: hostelData?.id ?? "",roomModel: bookingViewModel.bookingRequestModelObserver.value?.roomModel));
                                  },
                                    child: Text("Change",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: CustomColors.primary,decoration: TextDecoration.underline))),
                              ],
                            ),
                            const SizedBox(height: 10),
                            TitleMessageComponent(asset: 'assets/images/profile.png', title: 'Total Guests', message: "${bookingViewModel.bookingRequestModelObserver.value?.guestCount ?? 0}",),
                            DottedLine(
                              dashColor: CustomColors.darkGray,
                            ),
                            TitleMessageComponent(asset: 'assets/images/booking.png', title: 'Dates', message: "${AuthUtils.formatDateToLong(bookingViewModel.bookingRequestModelObserver.value?.checkInDate)}" +" - " + "${AuthUtils.formatDateToLong(bookingViewModel.bookingRequestModelObserver.value?.checkOutDate)}",),
                            DottedLine(
                              dashColor: CustomColors.darkGray,
                            ),
                            TitleMessageComponent(asset: 'assets/images/bed.png', title: 'Room Type', message: "${bookingViewModel.bookingRequestModelObserver.value?.roomModel?.roomType ?? ""}"),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                width: double.infinity,
                                color: CustomColors.lightGray,
                                height: 5,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ) : const SizedBox(),
                        ),
                        Obx(() => bookingViewModel.checkHostelRoomAvailabilityObserver.value.maybeWhen(
                            success: (response) {
                              final availabilityResponse = (response as HostelRoomAvailabilityResponseModel).data;
                              return Column(
                                children: [
                                  const SideHeadingComponent(title: "Pricing Details",viewVisible: false),
                                  const SizedBox(height: 10),
                                  Container(
                                    decoration: AppStyles.categoryBg4,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 20, // keep bottom if you want
                                        top: 0,     // remove upper padding
                                      ),
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context,index){
                                            final hostelModel =  availabilityResponse?.paymentDetailLogs?[index];
                                            return Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 2),
                                              child: Row(
                                                children: [
                                                  Expanded(child: Text(hostelModel?.message ?? "",style: TextStyle(fontWeight: FontWeight.w400,color: CustomColors.darkGray,fontSize: 14))),
                                                  Text("₹${hostelModel?.amount}",style: TextStyle(fontWeight: FontWeight.w400,color: CustomColors.primary,fontSize: 14)),
                                                ],
                                              ),
                                            );
                                          },itemCount: availabilityResponse?.paymentDetailLogs?.length ?? 0),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(child: Text("Total Amount",style: TextStyle(fontWeight: FontWeight.w700,color: CustomColors.textColor,fontSize: 16))),
                                      Visibility(visible: (availabilityResponse?.discount ?? 0) +  (availabilityResponse?.walletDeduction ?? 0) != 0 ,child: Text("₹${(availabilityResponse?.subTotal ?? 0) + (availabilityResponse?.walletDeduction ?? 0) + (availabilityResponse?.discount ?? 0)}",style: TextStyle(fontWeight: FontWeight.w500,color: CustomColors.textColor,fontSize: 16,decoration: TextDecoration.lineThrough, // 👈 strike-through
                                          decorationThickness: 2,
                                          decorationColor: Colors.black))),
                                      const SizedBox(width: 5),
                                      Text("₹${(availabilityResponse?.subTotal ?? 0)}",style: TextStyle(fontWeight: FontWeight.w700,color: CustomColors.primary,fontSize: 16)),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  PrimaryButton(buttonTxt: "Book Now", buttonClick: (){
                                      Get.to(() => CheckoutPage(hostelData: hostelData));
                                  }),
                                  const SizedBox(height: 50),
                                ],
                              );
                            },
                            orElse: () => SizedBox()))
                      ],
                    ),
                  ),
                ),
              ],
            );
            },
            orElse: () => Center(
          child: EmptyDataView(text: "Something went wrong"),
        ))
        ),
        bottomNavigationBar: _buildBottomAppBar(),
      ),
    );
  }

  Widget _buildLocationInfo(LocationModel? location) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://maps.googleapis.com/maps/api/staticmap?center=${location?.latitude},${location?.longitude}&zoom=15&size=600x300&maptype=roadmap&markers=color:red%7C${location?.latitude},${location?.longitude}&key=AIzaSyDf0aKkhQtwMnkHdjLEAmK7hjajE5T32cU',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: AppStyles.categoryBg4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${location?.address1}, ${location?.address2}',
                  style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.w700),
                ),
                Text(
                  '${location?.city}, ${location?.state} - ${location?.pinCode}',
                  style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16.0, color: Colors.blue),
                    SizedBox(width: 4.0),
                    Text(
                      'Landmark: ${location?.landMark}',
                      style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        CustomOutlinedButton(buttonTxt: "Open In Google Maps", buttonClick: (){
          Get.to(() => HostelsMapView(hostelId: widget.hostelId));
          // _openGoogleMaps(location?.latitude ?? 0.00,location?.longitude ?? 0.00);
        }),
        SizedBox(height: 10),
      ],
    );
  }

  Future<void> _openGoogleMaps(double latitude, double longitude) async {
    if(latitude == 0.00 || latitude == 0.00) throw "Could not open Google Maps";
    final Uri googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
    );

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open Google Maps';
    }
  }

  Widget _buildFaqList(List<FaqModel> faqs) {
    return faqs.isNotEmpty ? Container(
      decoration: AppStyles.categoryBg4,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: faqs.map((faq) =>
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                         Container(width: 40,height:40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(200),color: CustomColors.white),child: Icon(Icons.question_answer,color: CustomColors.textColor,size: 20)),
                         const SizedBox(width: 10),
                         Expanded(child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text((faq.question ?? ""),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: CustomColors.textColor)),
                             Text(faq.answer ?? "",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: CustomColors.darkGray)),
                           ],
                         ))
                      ],
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      visible: faqs.length > 1,
                      child: DottedLine(
                        dashColor: CustomColors.darkGray,
                      ),
                    )
                  ],
                ),
              )
          ).toList(),
        ),
      ),
    ) : SizedBox();
  }

  Widget _buildHostelRoomsList(HostelModel? hostelModel) {
    final roomList = hostelModel?.rooms;
    final roomsMore = hostelModel?.roomsMore;
    final safeList = roomList ?? [];
    final displayList = List<RoomModel>.from(safeList);

    if ((roomsMore ?? 0) > 0) {
      displayList.add(
        RoomModel(
          image: "https://firebasestorage.googleapis.com/v0/b/sastastay-1d420.firebasestorage.app/o/bannerImages%2F1755513864049.png?alt=media&token=b25f99c1-8dcc-44a7-a888-fc7bf4398426",
          roomType: "$roomsMore More",
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: displayList.isEmpty ? ErrorTextComponent(text: "Currently Rooms Are Not Available") : SizedBox(
        height: 180,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: displayList.length,
          itemBuilder: (context, index) {
            final roomModel = displayList[index];
            return InkWell(
                  onTap:(){
                    Get.to(() => RoomsListPage(hostelId: hostelModel?.id ?? ""));
                  },
                child: RoomComponent1(roomModel: roomModel));
          },
        ),
      ),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      elevation: 6,
      color: CustomColors.primary.withOpacity(0.1),
      child: Obx(() =>
        hostelViewModel.fetchHostelDetailsObserver.value.maybeWhen(
          orElse: () => SizedBox(),
          success: (responseData){
            final hostelModel = (responseData as FetchHostelDetailsResponseModel).data;
            return bookingViewModel.bookingRequestModelObserver.value == null ?
            PrimaryButton(buttonTxt: "Select Room", buttonClick: (){
              Get.to(() => RoomsListPage(hostelId: hostelModel?.id ?? ""));
            }) :
            Obx(() => bookingViewModel.checkHostelRoomAvailabilityObserver.value.maybeWhen(
                success: (response) {
                  final availabilityResponse = (response as HostelRoomAvailabilityResponseModel).data;
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              '₹${availabilityResponse?.subTotal ?? 0}',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors.primary,
                            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () {
                            Get.to(() => CheckoutPage(hostelData: hostelModel));
                          },
                          child: Text('Book Now',style: TextStyle(fontSize: 16,color: CustomColors.white)),
                        ),
                      ],
                    ),
                  );
                },
                orElse: () => PrimaryButton(buttonTxt: "Select Room", buttonClick: (){
                  Get.to(() => RoomsListPage(hostelId: hostelModel?.id ?? ""));
                })));
          }
        )
      )
    );
  }

  Color _getHostelTypeColor(String? type) {
    switch (type?.toLowerCase()) {
      case 'boys':
        return Colors.blue[100]!;
      case 'girls':
        return Colors.pink[100]!;
      default:
        return Colors.grey[200]!;
    }
  }
}
