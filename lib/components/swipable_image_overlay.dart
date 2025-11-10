import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../response_model/auth_response_model.dart';
import '../view_models/auth_view_model.dart';
import 'custom_network_image.dart';

class SwipableImageOverlay extends StatefulWidget {
  final double imageHeight;
  final double viewportFraction;

  const SwipableImageOverlay({
    Key? key,
    this.imageHeight = 250,
    this.viewportFraction = 0.8,
  }) : super(key: key);

  @override
  _SwipableImageOverlayState createState() => _SwipableImageOverlayState();
}

class _SwipableImageOverlayState extends State<SwipableImageOverlay> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;
  Timer? _timer;
  final authViewModel = Get.put(AuthViewModel());



  // @override
  // void initState() {
  //   super.initState();
  //   _pageController.addListener(() {
  //     setState(() {
  //       _currentPage = _pageController.page?.round() ?? 0;
  //     });
  //   });
  // }

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
    return Obx(() => authViewModel.validaVersionObserver.value.maybeWhen(
      success: (data) {
        final banners = (data as ValidateVersionResponseModel).data;
        final bannerList = banners?.banners ?? [];

        if (_currentPage >= bannerList.length) {
          _currentPage = 0;
        }

        return Column(
          children: [
            // Image Carousel
            SizedBox(
              height: widget.imageHeight,
              child: PageView.builder(
                controller: _pageController,
                itemCount: bannerList.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double value = 1.0;
                      if (_pageController.position.haveDimensions) {
                        value = _pageController.page! - index;
                        value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                      }

                      return Transform.scale(
                        scale: Curves.easeOut.transform(value),
                        child: child,
                      );
                    },
                    child: _buildImageCard(bannerList[index], index),
                  );
                },
              ),
            ),

            // Page Indicator
            // const SizedBox(height: 16),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: List.generate(bannerList.length, (index) {
            //     return Container(
            //       width: 8,
            //       height: 8,
            //       margin: const EdgeInsets.symmetric(horizontal: 4),
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: _currentPage == index
            //             ? Colors.blue
            //             : Colors.grey.withOpacity(0.5),
            //       ),
            //     );
            //   }),
            // ),
          ],
        );
      },
      orElse: () => const SizedBox(),
    ));
  }

  Widget _buildImageCard(String imageUrl, int index) {
    final isCurrent = index == _currentPage;
    final isPrevious = index == _currentPage - 1;
    final isNext = index == _currentPage + 1;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Background Image
            CustomNetworkImage(imageUrl: imageUrl,width: double.infinity,fit: BoxFit.cover,height: 150),

            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            // Content
            // Positioned(
            //   bottom: 16,
            //   left: 16,
            //   right: 16,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Image ${index + 1}',
            //         style: const TextStyle(
            //           color: Colors.white,
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       const SizedBox(height: 4),
            //       Text(
            //         'Description for image ${index + 1}',
            //         style: TextStyle(
            //           color: Colors.white.withOpacity(0.9),
            //           fontSize: 14,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}