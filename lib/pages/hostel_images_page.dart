import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/utils/app_styles.dart';
import 'package:pg_hostel/utils/custom_colors.dart';
import 'package:pg_hostel/view_models/auth_view_model.dart';

import '../components/custom_network_image.dart';
import '../components/empty_data_view.dart';
import '../components/secondary_heading_component.dart';

class HostelImagesPage extends StatelessWidget {
  final List<ImageDataModel> imageDataList;
  const HostelImagesPage({super.key, required this.imageDataList});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Get.put(AuthViewModel());

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
              if (imageDataList.isEmpty)
                const EmptyDataView(text: "No Images Found"),
              if (imageDataList.isNotEmpty)
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
                child: imageDataList.isEmpty
                    ? const SizedBox.shrink()
                    : TabBarView(
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
                          final double width =
                              MediaQuery.of(context).size.width / 3 - 16;

                          return GestureDetector(
                            onTap: () => authViewModel.showImagePopup(
                              context,
                              images[index],
                            ),
                            child: CustomNetworkImage(
                              borderRadius: 8,
                              imageUrl: images[index],
                              height: height,
                              width: width,
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
