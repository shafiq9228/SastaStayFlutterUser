import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:pg_hostel/components/custom_network_image.dart';
import 'package:pg_hostel/components/custom_outlined_button.dart';
import 'package:pg_hostel/components/primary_button.dart';
import 'package:pg_hostel/request_model/bookings_request_model.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/utils/custom_colors.dart';
import 'package:pg_hostel/utils/statefullwrapper.dart';
import 'package:pg_hostel/view_models/booking_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HostelRoomAvailabilityDialog extends StatefulWidget {
  final  RoomModel? roomModel;
  const HostelRoomAvailabilityDialog({super.key,required this.roomModel});

  @override
  State<HostelRoomAvailabilityDialog> createState() => _HostelRoomAvailabilityDialogState();
}

class _HostelRoomAvailabilityDialogState extends State<HostelRoomAvailabilityDialog> {
  final bookingViewModel = Get.put(BookingViewModel());
  int _guestCount = 1;
  final List<DateTime> _selectedDates = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDateRange: _selectedDates.length >= 2
          ? DateTimeRange(
        start: _selectedDates.first,
        end: _selectedDates.last,
      )
          : null,
    );

    if (picked != null) {
      setState(() {
        _selectedDates.clear();
        // Add all dates in the range to selectedDates
        DateTime current = picked.start;
        while (current.isBefore(picked.end) || current == picked.end) {
          _selectedDates.add(current);
          current = current.add(const Duration(days: 1));
        }
      });
    }
  }

  void _incrementGuests() {
    setState(() {
      _guestCount++;
    });
  }

  void _decrementGuests() {
    if (_guestCount > 1) {
      setState(() {
        _guestCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: (){
        if (widget.roomModel?.checkInDate != null && widget.roomModel?.checkOutDate != null) {
          setState(() {
            _selectedDates.clear();
            DateTime current = widget.roomModel!.checkInDate!;
            DateTime end = widget.roomModel!.checkOutDate!;
            while (current.isBefore(end) || current.isAtSameMomentAs(end)) {
              _selectedDates.add(current);
              current = current.add(const Duration(days: 1));
            }
          });
        }
      },
      child: AlertDialog(
        backgroundColor: CustomColors.white,
        title:  Text('Booking Details',style: TextStyle(fontSize: 18,color:CustomColors.textColor,fontWeight: FontWeight.w800),),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  CustomNetworkImage(imageUrl: widget.roomModel?.image ?? '',borderRadius: 10,fit: BoxFit.cover,width: 100,height: 50),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.roomModel?.roomType ?? "",
                        style: TextStyle(fontWeight: FontWeight.w800,color:CustomColors.primary,fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.roomModel?.roomNo ?? "",
                        style: TextStyle(fontWeight: FontWeight.w600,color:CustomColors.textColor,fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              if (_selectedDates.isNotEmpty) ...[
                Text(
                  'Selected Dates (${_selectedDates.length}):',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _selectedDates.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Chip(
                          label: Text(
                            DateFormat('MMM dd').format(_selectedDates[index]),
                          ),
                          // onDeleted: () {
                          //   setState(() {
                          //     _selectedDates.removeAt(index);
                          //   });
                          // },
                        ),
                      );
                    },
                  ),
                ),
              ],
              const SizedBox(height: 8),
              // Date Selection Section
              Text(
                'Select Dates:',
                style: TextStyle(fontWeight: FontWeight.w600,color:CustomColors.textColor,fontSize: 14),
              ),
              const SizedBox(height: 8),
              CustomOutlinedButton(buttonTxt: "Choose Dates", buttonClick: (){
                _selectDate(context);
              }),
              // ElevatedButton(
              //
              //   onPressed: () => _selectDate(context),
              //   child: const Text('Choose Dates'),
              // ),
              const SizedBox(height: 16),

              // Guest Counter Section
              const Text(
                'Number of Guests:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: _decrementGuests,
                  ),
                  Text(
                    '$_guestCount',
                    style: const TextStyle(fontSize: 18),
                  ),
                  _guestCount < (widget.roomModel?.capacityCount ?? 0) ? IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _incrementGuests,
                  ): SizedBox(width: 50),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Obx(() => bookingViewModel.checkHostelRoomAvailabilityObserver.value.maybeWhen(
            loading: (loading) => Center(child: SizedBox(width:30,height:30,child: const CircularProgressIndicator())),
              orElse: () =>PrimaryButton(buttonTxt: "Confirm", buttonClick: (){
                if(_selectedDates.length == 0){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Please Select Dates',
                      ),
                    ),
                  );
                  return;
                }
                bookingViewModel.checkHostelRoomAvailability(BookingRequestModel(roomModel:widget.roomModel,hostelId: widget.roomModel?.hostelId ?? "", roomId: widget.roomModel?.id ?? "", checkInDate: _selectedDates.first, checkOutDate: _selectedDates.last, guestCount: _guestCount));

              }))
          )
        ],
      ),
    );
  }
}