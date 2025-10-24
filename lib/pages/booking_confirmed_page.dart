import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/components/pricing_details_component.dart';
import 'package:pg_hostel/components/secondary_heading_component.dart';
import 'package:pg_hostel/components/static_refer_and_earn_component.dart';
import 'package:pg_hostel/pages/main_page.dart';
import 'package:pg_hostel/pages/rating_reviews_page.dart';
import 'package:pg_hostel/pages/rooms_list_page.dart';
import 'package:pg_hostel/view_models/auth_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/api_result.dart';
import '../components/add_guest_item.dart';
import '../components/amenities_component.dart';
import '../components/custom_network_image.dart';
import '../components/custom_outlined_button.dart';
import '../components/empty_data_view.dart';
import '../components/error_text_component.dart';
import '../components/helper_bottom_sheet.dart';
import '../components/hostel_details_extra_options_view.dart';
import '../components/primary_button.dart';
import '../components/rating_and_review_bottom_sheet.dart';
import '../components/rating_component.dart';
import '../components/read_more_text.dart';
import '../components/room_component_1.dart';
import '../components/side_heading_component.dart';
import '../components/title_message_component.dart';
import '../request_model/auth_request_model.dart';
import '../response_model/auth_response_model.dart';
import '../response_model/bookings_response_model.dart';
import '../response_model/hostel_response_model.dart';
import '../shimmers/hostel_details_page_shimmer.dart';
import '../utils/app_styles.dart';
import '../utils/auth_utils.dart';
import '../utils/custom_colors.dart';
import '../utils/statefullwrapper.dart';
import '../view_models/booking_view_model.dart';
import '../view_models/hostel_view_model.dart';
import 'amenities_page.dart';
import 'checkout_page.dart';
import 'hostel_images_page.dart';


class BookingConfirmedPage extends StatefulWidget {
  final String bookingId;
  const BookingConfirmedPage({super.key, required this.bookingId});

  @override
  State<BookingConfirmedPage> createState() => _BookingConfirmedPageState();
}

class _BookingConfirmedPageState extends State<BookingConfirmedPage> {
  final bookingViewModel = Get.put(BookingViewModel());
  final authViewModel = Get.put(AuthViewModel());


  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: (){
        bookingViewModel.fetchBookingDetails(widget.bookingId ?? "");
      },
      child: WillPopScope(
        onWillPop: ()async {
          Get.offAll(() => const MainPage());
          return false;
        },
        child: Scaffold(
          backgroundColor: CustomColors.white,
          body: Stack(
            children: [
              Obx(() => bookingViewModel.fetchBookingDetailsObserver.value.maybeWhen(
                  loading: (loading) => const HostelDetailsPageShimmer(),
                  success: (data){
                    final bookingDataModel = (data as FetchBookingDetailsResponseModel).data;
                    final dealerData = UserModel.fromJson(bookingDataModel?.dealerId);
                    final hostelData = HostelModel.fromJson(bookingDataModel?.hostelId);
                    final roomModelData = RoomModel.fromJson(bookingDataModel?.roomId);

                    return CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            backgroundColor: CustomColors.white,
                            expandedHeight: 50.0,
                            floating: false,
                            pinned: true,
                            automaticallyImplyLeading: false, // removes default back arrow
                            leading: IconButton(
                              icon: Image.asset(
                                'assets/images/back_btn.png', // your asset path
                                width: 20,
                                height: 20
                                ,
                              ),
                              onPressed: () => Get.offAll(() => const MainPage()), // or Navigator.pop(context)
                            ),
                            flexibleSpace:
                            FlexibleSpaceBar(
                              background: Hero(
                                tag: hostelData.id ?? "",
                                child: SizedBox(),
                              ),
                            ),
                            title: Text("Your Booking Is Confirmed!",style: TextStyle(fontSize: 18,color: CustomColors.textColor,fontWeight: FontWeight.w600),),
                            actions: [

                            ],
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                              child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PricingDetailsComponent(bookingDataModel:bookingDataModel),
                                  const SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Container(
                                      width: double.infinity,
                                      color: CustomColors.lightGray,
                                      height: 5,
                                    ),
                                  ),
                                  const SideHeadingComponent(title: "Booking Details",viewVisible: false),
                                  Container(
                                      decoration: AppStyles.categoryBg3,
                                      child:
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(hostelData?.hostelName ?? "",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: CustomColors.textColor)),
                                                    SizedBox(height: 10),
                                                    Text(hostelData?.location?.address1 ?? "",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: CustomColors.darkGray)),
                                                    SizedBox(height: 10),
                                                    Row(
                                                      children: [
                                                        Image.asset("assets/images/star.png",width: 18,height: 18),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                                          child: Text("${hostelData?.rating ?? 0}",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16,color: CustomColors.black)),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text(bookingDataModel?.orderId ?? "",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: CustomColors.textColor)),
                                                  ],
                                                ),
                                              ), CustomNetworkImage(imageUrl: hostelData?.hostelImage ?? "",width: 100,height: 100,fit: BoxFit.cover,)
                                            ]),
                                      )
                                  ),
                                  const SizedBox(height: 30),
                                  DottedLine(
                                    dashColor: CustomColors.darkGray,
                                  ),
                                  // Chip(
                                  //   label: Text(hostelData?.hostelType ?? 'Type'),
                                  //   backgroundColor: _getHostelTypeColor(hostelData?.hostelType),
                                  // ),
                                  const SizedBox(height: 10),
                                  TitleMessageComponent(asset: 'assets/images/profile.png', title: 'Total Guests', message: "${bookingDataModel?.guestCount ?? 0}",),
                                  Visibility(
                                    visible: bookingDataModel?.guestDetailsList?.isNotEmpty == true,
                                    child: MediaQuery.removePadding(
                                      context: context,
                                      removeTop: true,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemCount: bookingDataModel?.guestDetailsList?.length ?? 0,
                                        itemBuilder: (context, index) {
                                          final guestDetailsModel = bookingDataModel?.guestDetailsList?[index];
                                          return AddGuestItem(
                                            guestDetailsModel: guestDetailsModel,
                                            index: index,
                                            deleteView: false,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  DottedLine(
                                    dashColor: CustomColors.darkGray,
                                  ),
                                  TitleMessageComponent(asset: 'assets/images/booking.png', title: 'Dates', message: "${AuthUtils.formatDateToLong(bookingDataModel?.checkInDate)}" +" - " + "${AuthUtils.formatDateToLong(bookingDataModel?.checkOutDate)}",),
                                  DottedLine(
                                    dashColor: CustomColors.darkGray,
                                  ),
                                  TitleMessageComponent(asset: 'assets/images/bed.png', title: 'Room Type', message: "${roomModelData?.roomType ?? ""} | ${roomModelData?.roomNo ?? ""} | ${roomModelData?.floor ?? ""}"),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Container(
                                      width: double.infinity,
                                      color: CustomColors.lightGray,
                                      height: 5,
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  SideHeadingComponent(title: "Refer And Earn",viewVisible: false),
                                  StaticReferAndEarnComponent(),
                                  const SizedBox(height: 30),
                                  HostelDetailsExtraOptionsView(rules: hostelData.rules,checkInTime: hostelData?.checkInTime,checkOutTime:  hostelData?.checkOutTime,mobileNumber: dealerData.mobile.toString()),
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: CustomOutlinedButton(buttonTxt: "Cancel Booking", buttonClick: (){
                                      cancelBooking(widget.bookingId);
                                    }),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]
                    );
                  },
                  orElse: () => Center(
                    child: EmptyDataView(text: "Something went wrong"),
                  ))
              ),
              Obx(()=> bookingViewModel.cancelBookingStatusObserver.value.maybeWhen(loading: (loading) => Container(width:double.infinity,height:double.infinity,color: CustomColors.black.withOpacity(0.4),child: Center(child: CircularProgressIndicator(color: CustomColors.white)),),orElse: () => SizedBox())),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> openWhatsAppChat({
    required String phoneNumber, // in international format without '+'
    String message = '',
  }) async {
    final Uri whatsappUri = Uri.parse(
      "https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}",
    );

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch WhatsApp';
    }
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
              image: "https://firebasestorage.googleapis.com/v0/b/sastastay-1d420.firebasestorage.app/o/bannerImages%2F1755513864049.png?alt=media&token=b25f99c1-8dcc-44a7-a888-fc7bf4398426",
              name: "${amenitiesMore} More",
            ),
          );
        }
        return displayList.isEmpty ? ErrorTextComponent(text: "No Amenities Available") : Wrap(
          spacing: 8, // horizontal space
          runSpacing: 8, // vertical space
          children: displayList.map((amenityModel) {
            return AmenitiesComponent(
              amenitiesModel: amenityModel,
              view: 2,
            );
          }).toList(),
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

  void cancelBooking(String bookingId){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // allows full height scroll
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return HelperBottomSheet(assetImage: "assets/images/cancel_booking.png",title: "Are you sure you want to Cancel Booking?",message: "You will refunded amount back to your wallet.",btn1Txt: "NO",btn1Click: (){
          Get.back();
        },btn2Txt: "Yes",btn2Click: ()async {
          Get.back();
          bookingViewModel.performCancelBooking(bookingId);
        });
      },
    );
  }

  void openDialPad(String phoneNumber) async {
    final Uri dialUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(dialUri)) {
      await launchUrl(dialUri);
    } else {
      throw 'Could not open dial pad';
    }
  }

}
