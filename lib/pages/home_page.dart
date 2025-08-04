import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/components/home_page_component.dart';
import 'package:pg_hostel/components/hostel_details_horizontal_component1.dart';
import 'package:pg_hostel/components/side_heading_component.dart';
import 'package:pg_hostel/utils/custom_colors.dart';

import '../components/hostel_details_horizontal_component2.dart';
import '../components/type_of_hostel_component.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: CustomColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomePageComponent(),
            const TypeOfHostelComponent(),
            const SideHeadingComponent(title: "Nearby Hostels"),
            // HostelDetailsHorizontalComponent1(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 230,
               child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                   itemBuilder: (context,index){
                 return const HostelDetailsHorizontalComponent1();
               },itemCount: 5),
              ),
            ),
            const SideHeadingComponent(title: "Populer Hostels"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 280,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return const HostelDetailsHorizontalComponent2();
                    },itemCount: 5),
              ),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
