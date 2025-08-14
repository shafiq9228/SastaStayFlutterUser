import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pg_hostel/components/amenities_component.dart';
import 'package:pg_hostel/components/custom_outlined_button.dart';
import 'package:pg_hostel/components/empty_data_view.dart';
import 'package:pg_hostel/components/primary_button.dart';
import 'package:pg_hostel/components/rating_component.dart';
import 'package:pg_hostel/components/read_more_text.dart';
import 'package:pg_hostel/components/secondary_heading_component.dart';
import 'package:pg_hostel/pages/hostel_images_page.dart';
import 'package:pg_hostel/pages/rooms_list_page.dart';
import 'package:pg_hostel/response_model/bookings_response_model.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/shimmers/hostel_details_page_shimmer.dart';
import 'package:pg_hostel/utils/app_styles.dart';
import 'package:pg_hostel/utils/auth_utils.dart';
import 'package:pg_hostel/utils/custom_colors.dart';
import 'package:pg_hostel/utils/statefullwrapper.dart';
import 'package:pg_hostel/view_models/booking_view_model.dart';
import 'package:pg_hostel/view_models/hostel_view_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:url_launcher/url_launcher.dart';


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
  final bookingViewModel = Get.put(BookingViewModel());

  @override
  Widget build(BuildContext context) {

    return StatefulWrapper(
      onInit: (){
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
                  flexibleSpace: FlexibleSpaceBar(
                    background: Hero(
                      tag: hostelData?.id ?? "",
                      child: InkWell(
                        onTap: (){
                          Get.to(() => HostelImagesPage(imageUrls: hostelData?.images ?? []));
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
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: CustomColors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: (hostelData?.images?.length ?? 0) > 5
                                      ? 5
                                      : hostelData?.images?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final images = hostelData?.images ?? [];
                                    final imageUrl = images[index];

                                    // If last index and there are more than 5 images
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
                                        width: 40,
                                        height: 40,
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
                    InkWell(
                      onTap: (){

                      },
                      child: Container(width: 35,height: 35,decoration: AppStyles.whiteCircleBg,child:Center(child: Icon(Icons.favorite_border,size: 20,))),
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
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Image.asset("assets/images/star.png",width: 18,height: 18),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Text("${hostelData?.rating ?? 0}",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: CustomColors.black,decoration: TextDecoration.underline)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Image.asset("assets/images/location.png",width: 10,height: 10,color: CustomColors.textColor),
                              Expanded(child: Text(hostelData?.location?.address1 ?? "",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: CustomColors.textColor))),
                              Text("${hostelData?.totalVotes ?? 0} reviews",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray))
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
                            viewVisible: true
                            // viewVisible: (hostelData?.amenitiesMore ?? 0) > 0
                            ,viewClick: (){
                          Get.to(() =>  AmenitiesPage(hostelId: hostelData?.id ?? ""));
                        },viewType: 2),
                        _buildAmenitiesGrid(hostelData?.amenities,hostelData?.amenitiesMore),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            width: double.infinity,
                            color: CustomColors.lightGray,
                            height: 5,
                          ),
                        ),
                        SideHeadingComponent(title: "Room Types",
                            viewVisible: true,
                            // viewVisible: (hostelData?.roomsMore ?? 0) > 0,
                            viewClick: (){
                          Get.to(() => RoomsListPage(hostelId: hostelData?.id ?? ""));
                        }),
                        _buildHostelRoomsList(hostelData),
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
                        const SideHeadingComponent(title: "Rules",viewVisible: false),
                        _buildRulesList(hostelData?.rules ?? []),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            width: double.infinity,
                            color: CustomColors.lightGray,
                            height: 5,
                          ),
                        ),
                        SideHeadingComponent(title: "Ratings",viewVisible: true,viewClick: (){

                        }),
                        const RatingComponent(),
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
                                Expanded(child: Text("Your Booking Details",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: CustomColors.black))),
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
                        ) : SizedBox(),
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
                                            return Row(
                                              children: [
                                                Expanded(child: Text(hostelModel?.message ?? "",style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.darkGray,fontSize: 14))),
                                                Text("₹${hostelModel?.amount}",style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.primary,fontSize: 14)),
                                              ],
                                            );
                                          },itemCount: availabilityResponse?.paymentDetailLogs?.length ?? 0),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text("Total Amount",style: TextStyle(fontWeight: FontWeight.w700,color: CustomColors.textColor,fontSize: 18)),
                                      Spacer(),
                                      Text("₹${availabilityResponse?.amount}",style: TextStyle(fontWeight: FontWeight.w700,color: CustomColors.primary,fontSize: 18)),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Obx(()=> bookingViewModel.confirmBookingObserver.value.maybeWhen(
                                      loading: (loading) => CircularProgressIndicator(),
                                      orElse: () => PrimaryButton(buttonTxt: "Confirm Booking", buttonClick: (){
                                         bookingViewModel.performConfirmBooking(bookingViewModel.bookingRequestModelObserver.value);
                                  })),
                                  ),
                                  const SizedBox(height: 50),
                                ],
                              );
                            },
                            orElse: () => PrimaryButton(buttonTxt: "Select Room", buttonClick: (){
                              Get.to(() => RoomsListPage(hostelId: hostelData?.id ?? ""));
                            })))
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
        // bottomNavigationBar: _buildBottomAppBar(),
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
          _openGoogleMaps(location?.latitude ?? 0.00,location?.longitude ?? 0.00);
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

  Widget _buildAmenitiesGrid(List<AmenitiesModel>? amenities,int? amenitiesMore) {
    return Builder(
      builder: (context) {
        final List<AmenitiesModel> displayList = List.from(amenities ?? []);
        if ((amenitiesMore ?? 0) > 0) {
          displayList.add(
            AmenitiesModel(
              image: "https://icon-library.com/images/add-icon-png/add-icon-png-0.jpg",
              name: "${amenitiesMore} More",
            ),
          );
        }
        return GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2.5,
          ),
          itemCount: displayList.length,
          itemBuilder: (context, index) {
            final amenityModel = displayList[index];
            return AmenitiesComponent(amenitiesModel: amenityModel,view: 2);
          },
        );
      },
    );
  }

  Widget _buildRulesList(List<String> rules) {
    return Container(
      decoration: AppStyles.categoryBg4,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: rules.map((rule) =>
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                         Container(width: 40,height:40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(200),color: CustomColors.white),child: Icon(Icons.rule,color: CustomColors.textColor,size: 20)),
                         const SizedBox(width: 10),
                         Expanded(child: Text(rule,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: CustomColors.textColor)))
                      ],
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      visible: rules.length > 1,
                      child: DottedLine(
                        dashColor: Colors.black.withOpacity(0.8),
                      ),
                    )
                  ],
                ),
              )
          ).toList(),
        ),
      ),
    );
  }

  Widget _buildHostelRoomsList(HostelModel? hostelModel) {
    final roomList = hostelModel?.rooms;
    final roomsMore = hostelModel?.roomsMore;
    final safeList = roomList ?? [];
    final displayList = List<RoomModel>.from(safeList);

    if ((roomsMore ?? 0) > 0) {
      displayList.add(
        RoomModel(
          image: "https://icon-library.com/images/add-icon-png/add-icon-png-0.jpg",
          roomType: "$roomsMore More",
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
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
      child: Container(
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
                  'Starting from',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  '₹5,000/month',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                // Book now action
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
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
