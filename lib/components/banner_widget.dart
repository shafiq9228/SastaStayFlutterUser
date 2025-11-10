import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../response_model/auth_response_model.dart';
import 'package:get/get.dart';

import '../utils/custom_colors.dart';
import '../view_models/auth_view_model.dart';
import 'custom_network_image.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final PageController _pageController = PageController();

  final authViewModel = Get.put(AuthViewModel());
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (!mounted) return;
      if (_pageController.hasClients && mounted) {
        final bannerList = authViewModel.validaVersionObserver.value.maybeWhen(success: (data) => (data as ValidateVersionResponseModel).data?.banners ?? [], orElse: () => []);

        if (bannerList.isEmpty) return;

        _currentPage++;

        if (_currentPage >= bannerList.length) {
          _currentPage = 0;
          _pageController.jumpToPage(_currentPage); // instant jump to first
        } else {
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CustomColors.white,
      ),
      child: Obx(() => authViewModel.validaVersionObserver.value.maybeWhen(
        success: (data) {
          final banners = (data as ValidateVersionResponseModel).data;
          final bannerList = banners?.banners ?? [];

          if (_currentPage >= bannerList.length) {
            _currentPage = 0;
          }

          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: bannerList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CustomNetworkImage(imageUrl: bannerList[index],fit: BoxFit.fill,),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: IntrinsicWidth(
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(bannerList.length ?? 0,
                              (int index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPage == index ?  CustomColors.primary : Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
        orElse: () => const SizedBox(),
      )),
    );
  }

}
