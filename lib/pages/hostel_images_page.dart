import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pg_hostel/components/empty_data_view.dart';
import 'package:pg_hostel/components/secondary_heading_component.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/utils/custom_colors.dart';


class HostelImagesPage extends StatelessWidget {
  final List<ImageDataModel> imageDataList;
  const HostelImagesPage({super.key, required this.imageDataList});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: imageDataList.length,
      child: Scaffold(
        backgroundColor: CustomColors.white,
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              SecondaryHeadingComponent(
                buttonTxt: "Hostel Images",
                buttonClick: () {
                  Get.back();
                },
              ),
              // Tabs for image types
              if(imageDataList.isEmpty) const EmptyDataView(text: "No Images Found"),
              TabBar(
                isScrollable: true,
                labelColor: CustomColors.textColor,
                unselectedLabelColor: Colors.black54,
                indicatorColor: CustomColors.textColor,
                tabs: imageDataList
                    .map((data) => Tab(text: data.imagesType ?? "Unknown"))
                    .toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: imageDataList.map((data) {
                    final images = data.images ?? [];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MasonryGridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          final double height =
                          (100 + (index % 5) * 40).toDouble();
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              images[index],
                              height: height,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

