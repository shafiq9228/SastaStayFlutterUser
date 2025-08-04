import 'package:flutter/material.dart';
import 'package:pg_hostel/components/custom_network_image.dart';

import '../utils/custom_colors.dart';

class HostelDetailsHorizontalComponent2 extends StatelessWidget {
  const HostelDetailsHorizontalComponent2({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(width: 0.5,color: CustomColors.lightGray)),
        width: 240,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                const CustomNetworkImage(imageUrl: 'https://images.squarespace-cdn.com/content/v1/5e72c8bfe21ad940ba788673/1620923464746-9P9CHDE3GWWYHK2WWALV/hostel-dorm-bedroom-two.jpg',width: 250,height: 130,fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                        ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 100),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            color: CustomColors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10,vertical: 5),
                            child: Text("20% Off",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Colors.green)),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(200),color: CustomColors.white),
                        child: Center(child: Icon(Icons.favorite,color: CustomColors.red,size: 18)),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 10),
                    Text("Sri Raja Hostel",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: CustomColors.black)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Image.asset("assets/images/location.png",width: 15,height: 15,color: CustomColors.darkGray),
                          Expanded(child: Text("Sr Nagar",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: CustomColors.darkGray))),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text("₹5,000",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: CustomColors.black)),
                        Text("/mo",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: CustomColors.darkGray)),
                        Spacer(),
                        Image.asset("assets/images/star.png",width: 18,height: 18),
                        Text("4.6",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: CustomColors.black)),
                        Text("(50)",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: CustomColors.darkGray)),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
