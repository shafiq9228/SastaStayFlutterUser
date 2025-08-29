import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/components/primary_button.dart';
import 'package:pg_hostel/components/secondary_heading_component.dart';
import 'package:pg_hostel/pages/search_page.dart';
import 'package:pg_hostel/utils/custom_colors.dart';

import '../components/type_of_hostel_component.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  final  areaType = [
    "Ameerpet",
    "Kukatpally",
    "Dilshuknagar",
    "Sr Nagar",
    "Panjagutta",
    "Secunderabad",
    "Kachiguda",
    "Begumpet",
    "Lb Nagar",
    "Uppal",
    "Jeedimetla",
    "Paradise"
  ];

  bool showAllAreas = false;

  final  roomType = [
    "Single",
    "Double Sharing",
    "Triple Sharing",
    "Quad Sharing",
    "Dormitory",
    "Deluxe Single",
    "Deluxe Double Sharing",
    "Studio Room",
    "Private Room",
    "Semi-Private Room",
    "Attached Bathroom",
    "Non-Attached Bathroom",
    "AC Room",
    "Non-AC Room",
    "Bunker Bed Room",
    "Suite Room"
  ];

  bool showAllRooms = false;


  @override
  Widget build(BuildContext context) {
    final displayList = showAllRooms ? roomType : roomType.take(5).toList();
    final displayAreaList = showAllAreas ? areaType : areaType.take(5).toList();

    return Scaffold(
      backgroundColor: CustomColors.white,
      body: SafeArea(
        top: true,
        child: Stack(children: [
          Column(
            children: [
              SecondaryHeadingComponent(buttonTxt: "Filter"),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(title: "Popular localities in Hyderabad"),
                      Wrap(
                          spacing: 8,
                          children: [
                            ...displayAreaList.map((item) {
                              return InkWell(
                                onTap: (){
                                  Get.to(() => SearchPage(type: "Search",search: item));
                                },
                                  child: CustomChip(label: item));
                            }),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showAllAreas = !showAllAreas;
                                });
                              },
                              child: CustomChip(label: showAllAreas ? "Less" : " + ${areaType.length-5} More"),
                            )
                          ]
                      ),
                      const SizedBox(height: 16),
                      SectionTitle(title: "Type of hostels"),
                      const TypeOfHostelComponent(),
                      const SizedBox(height: 16),
                      SectionTitle(title: "Types of Beds"),
                      Wrap(
                        spacing: 8,
                        children: [
                          ...displayList.map((item) {
                            return InkWell(
                                onTap: (){
                                  Get.to(() => SearchPage(type: "Search",search: item));
                                },
                                child: CustomChip(label: item));}),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showAllRooms = !showAllRooms;
                              });
                            },
                            child: CustomChip(label: showAllRooms ? "Less" : " + ${roomType.length-5} More"),
                          )
                        ]
                      ),
                      const SizedBox(height: 16),
                      // SectionTitle(title: "Bed Price"),
                      // RangeSliderWidget(min: 1000, max: 20000),
                      // const SizedBox(height: 16),
                      // SectionTitle(title: "Hostel Facilities"),
                      // Wrap(
                      //   spacing: 8,
                      //   children: [
                      //     FacilityChip(icon: Icons.wifi, label: "Wi-Fi"),
                      //     FacilityChip(
                      //         icon: Icons.local_drink, label: "Water Purifier"),
                      //     FacilityChip(
                      //         icon: Icons.security,
                      //         label: "24x7 Security",
                      //         isSelected: true),
                      //     FacilityChip(
                      //         icon: Icons.local_laundry_service, label: "Laundry"),
                      //     CustomChip(label: "+7 More"),
                      //   ],
                      // ),
                      // const SizedBox(height: 16),
                      // SectionTitle(title: "Room Facilities"),
                      // Wrap(
                      //   spacing: 8,
                      //   children: [
                      //     FacilityChip(icon: Icons.bathtub, label: "Attached Bathroom"),
                      //     FacilityChip(icon: Icons.tv, label: "Television"),
                      //     FacilityChip(icon: Icons.bed, label: "Pillow & Blanket"),
                      //     FacilityChip(icon: Icons.microwave_rounded, label: "Mirror"),
                      //     CustomChip(label: "+10 More"),
                      //   ],
                      // ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Container(
          //         color: Colors.white,
          //         child: Padding(
          //           padding: const EdgeInsets.only(bottom: 12),
          //           child: BottomButtons(),
          //         ))),
        ]),
      ),
    );
  }
}

/// Section Title
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}

/// Custom Rounded Chip
class CustomChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  const CustomChip({super.key, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey.shade400,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

/// Hostel Type (Card with Icon + Text)
class HostelType extends StatelessWidget {
  final IconData icon;
  final String label;
  const HostelType({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: Colors.deepPurple),
          const SizedBox(height: 6),
          Text(label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

/// Range Slider
class RangeSliderWidget extends StatefulWidget {
  final double min;
  final double max;
  const RangeSliderWidget({super.key, required this.min, required this.max});

  @override
  State<RangeSliderWidget> createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  RangeValues values = const RangeValues(2000, 15000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Min",style: TextStyle(fontWeight: FontWeight.w500,color: CustomColors.darkGray,fontSize: 16)),
                  Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(width: 0.5,color: CustomColors.darkGray)),
                    child: Center(child: Text("₹${values.start.toInt()}",style: TextStyle(fontSize: 16,color: CustomColors.textColor,fontWeight: FontWeight.w700),)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(" "),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Max",style: TextStyle(fontWeight: FontWeight.w500,color: CustomColors.darkGray,fontSize: 16)),
                  Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(width: 0.5,color: CustomColors.darkGray)),
                    child: Center(child: Text("₹${values.end.toInt()}",style: TextStyle(fontSize: 16,color: CustomColors.textColor,fontWeight: FontWeight.w700),)),
                  )
                ],
              ),
            )
          ],
        ),
        RangeSlider(
          values: values,
          min: widget.min,
          max: widget.max,
          divisions: 20,
          activeColor: Colors.deepPurple,
          labels: RangeLabels(
            "₹${values.start.toInt()}",
            "₹${values.end.toInt()}",
          ),
          onChanged: (val) => setState(() => values = val),
        ),
        Text("₹${values.start.toInt()} - ₹${values.end.toInt()}"),
      ],
    );
  }
}

/// Counter Widget
class CounterWidget extends StatefulWidget {
  final int initialValue;
  const CounterWidget({super.key, required this.initialValue});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => setState(() => count++),
            child: const Icon(Icons.add, size: 18, color: Colors.black87),
          ),
          const SizedBox(width: 12),
          Text(
            count.toString().padLeft(2, '0'), // shows "05"
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              if (count > 1) setState(() => count--);
            },
            child: const Icon(Icons.remove, size: 18, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

/// Facility Chip with Icon
class FacilityChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  const FacilityChip(
      {super.key,
      required this.icon,
      required this.label,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepPurple.shade50 : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.deepPurple : Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: Colors.deepPurple),
            const SizedBox(width: 6),
            Text(label),
          ],
        ),
      ),
    );
  }
}

/// Switch Tile
class SwitchTile extends StatefulWidget {
  final String label;
  final bool value;
  const SwitchTile({super.key, required this.label, required this.value});

  @override
  State<SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<SwitchTile> {
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    switchValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.label),
      trailing: Switch(
        value: switchValue,
        activeColor: Colors.deepPurple,
        onChanged: (val) => setState(() => switchValue = val),
      ),
    );
  }
}

/// Bottom Buttons
class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: PrimaryButton(buttonTxt: "Apply Filter", buttonClick: (){

      }),
    );
  }
}
