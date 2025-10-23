import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/utils/statefullwrapper.dart';

import '../api/api_result.dart';
import '../components/empty_data_view.dart';
import '../components/hostel_details_horizontal_component1.dart';
import '../request_model/auth_request_model.dart';
import '../response_model/hostel_response_model.dart';
import '../shimmers/hostel_details_horizontal_shimmer.dart';
import '../utils/app_styles.dart';
import '../utils/custom_colors.dart';
import '../view_models/auth_view_model.dart';
import '../view_models/hostel_view_model.dart';

class HostelsMapView extends StatefulWidget {
  final String? hostelId;
  const HostelsMapView({super.key, this.hostelId});

  @override
  State<HostelsMapView> createState() => _HostelsMapViewState();
}

class _HostelsMapViewState extends State<HostelsMapView> {
  RxSet<Marker> markers = <Marker>{}.obs;
  late GoogleMapController mapController;

  BitmapDescriptor? unselectedIcon;
  BitmapDescriptor? selectedIcon;
  String? selectedMarkerId;

  final authViewModel = Get.put(AuthViewModel());
  final hostelViewModel = Get.put(HostelViewModel());

  LatLng? selectedLocation;
  RxString hostelId = "".obs;

  final TextEditingController searchController = TextEditingController();
  RxString searchQuery = "".obs;
  Timer? _debounce;
  bool _isProgrammaticMove = false;


  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }


  Future<void> _loadMarkerIcons() async {

    unselectedIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(40, 40)),
      'assets/images/un_selected_pointer.png',width: 40,height: 40
    );

    selectedIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(60, 60)),
      'assets/images/pin.png',width: 60,height: 60
    );

    final details = authViewModel.locationDetails.value;
    if (details != null) {
      selectedLocation = LatLng(
        details.latitude ?? 0.0,
        details.longitude ?? 0.0,
      );
    }

    setState(() {});

  }

  void _setMarkers(List<HostelModel>? hostels) {
    markers.clear();

    for (var loc in hostels ?? []) {
      String id = loc.id ?? "";
      String hostelType = loc.hostelType ?? "Unknown";

      markers.add(
        Marker(
          markerId: MarkerId(id),
          position: LatLng(
            loc.location?.latitude ?? 0.0,
            loc.location?.longitude ?? 0.0,
          ),
          infoWindow: InfoWindow(
            title: loc.hostelName ?? "",
            snippet: "Type: $hostelType",
          ),
          icon: (selectedMarkerId == id)
              ? selectedIcon ?? BitmapDescriptor.defaultMarker
              : unselectedIcon ?? BitmapDescriptor.defaultMarker,
          onTap: () {
            setState(() {
              selectedMarkerId = id;
            });
            searchQuery.value = "";
            searchController.text = "";
            _refreshData(selectedMarkerId);
            _setMarkers(hostels);
          },
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: StatefulWrapper(
        onInit: () async {
          await _refreshData(null);
          _loadMarkerIcons();
        },
        child: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
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
                                    child: Obx(() => searchQuery.value.isEmpty ? const SizedBox() : hostelViewModel.fetchMapLocationsObserver.value.maybeWhen(
                                        loading: (_) => SizedBox(height: 10,width: 10,child: Center(child: CircularProgressIndicator(color:CustomColors.textColor,strokeWidth: 2))),
                                        orElse: () => GestureDetector(
                                            onTap: (){
                                              searchController.clear();
                                              searchQuery.value = "";
                                              _refreshData(null);
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
                  Expanded(
                    child: Obx(
                          () => hostelViewModel.fetchMapLocationsObserver.value
                          .maybeWhen(
                        loading: (data) => Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: markers.isNotEmpty
                                    ? markers.first.position
                                    : LatLng(authViewModel.locationDetails.value?.latitude ?? 0,authViewModel.locationDetails.value?.longitude ?? 0),
                                zoom: 18,
                              ),
                              myLocationEnabled: true,
                              markers: markers,
                              onTap: _onMapTapped,
                              onCameraMove: _onCameraMove,
                              onMapCreated: (controller) {
                                mapController = controller;
                              },
                            ),
                             Padding(
                              padding: const  EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: SizedBox(height: 200,child:ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context,index){return
                                const HostelDetailsHorizontalShimmer(index: 1, view: 1,infiniteWidth:false);
                              },itemCount: 5)),
                            )
                          ],
                        ),
                        success: (data) {
                          final hostelsList = (data as FetchHostelsResponseModel).data ?? [];
                          _setMarkers(hostelsList);

                          if (hostelsList.isNotEmpty) {
                            final first = hostelsList.first;
                            if (first.location?.latitude != null && first.location?.longitude != null) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                moveToPosition(
                                  first.location!.latitude!,
                                  first.location!.longitude!,
                                );
                              });
                            }
                          }

                          return Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: markers.isNotEmpty
                                      ? markers.first.position
                                      : LatLng(authViewModel.locationDetails.value?.latitude ?? 0,authViewModel.locationDetails.value?.longitude ?? 0),
                                  zoom: 18,
                                ),
                                myLocationEnabled: true,
                                markers: markers,
                                onTap: _onMapTapped,
                                onCameraMove: _onCameraMove,
                                onCameraIdle: _onCameraIdle,
                                onMapCreated: (controller) {
                                  mapController = controller;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: SizedBox(
                                    height: 200,
                                    child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context,index){
                                      return HostelDetailsHorizontalComponent1(hostelModel: hostelsList[index],infinityWidth: false);
                                    },itemCount: 5)),
                              )
                            ],
                          );
                        },
                        orElse: () => const EmptyDataView(text: "No Hostels Found"),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(()=> hostelViewModel.fetchMapLocationsObserver.value.maybeWhen(loading: (loading) => Container(width:double.infinity,height:double.infinity,color: CustomColors.black.withOpacity(0.4),child: Center(child: CircularProgressIndicator(color: CustomColors.white)),),orElse: () => SizedBox())),
            ],
          ),
        ),
      ),
    );
  }

  void _onSearchChanged() {
    if (hostelViewModel.fetchMapLocationsObserver.value.maybeWhen(loading: (_) => true, orElse: () => false)) {
      return;
    }
    hostelViewModel.fetchMapLocationsObserver.value = const ApiResult.loading("");
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      _refreshData(null);
    });
  }

  Future<void> _refreshData(String? selectedMarkerId) async {
    await hostelViewModel.fetchMapLocations(
      PaginationRequestModel(
        page: 1,
        query: searchQuery.value,
        hostelId: selectedMarkerId ?? (widget.hostelId ?? ""),
        latitude: selectedLocation?.latitude,
        longitude: selectedLocation?.longitude,
      )
    );
  }

  void _onMapTapped(LatLng tappedPoint) {
    selectedLocation = tappedPoint;
  }

  void _onCameraMove(CameraPosition position) {
    if (_isProgrammaticMove) return;
    selectedLocation = position.target;
  }

  void _onCameraIdle(){
    // _refreshData();
    // _onSearchChanged();
  }

  Future<void> moveToPosition(double lat, double lng, {double zoom = 18}) async {
    if (mapController != null) {
      _isProgrammaticMove = true;
      await mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(lat, lng),
            zoom: zoom,
          ),
        ),
      );
      _isProgrammaticMove = false;
    }
  }

}
