import 'package:flutter/material.dart';
import 'package:pg_hostel/components/custom_network_image.dart';

import '../utils/custom_colors.dart';

class HostelDetailsHorizontalComponent1 extends StatelessWidget {
  const HostelDetailsHorizontalComponent1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              const CustomNetworkImage(imageUrl: 'https://images.squarespace-cdn.com/content/v1/5e72c8bfe21ad940ba788673/1620923464746-9P9CHDE3GWWYHK2WWALV/hostel-dorm-bedroom-two.jpg',width: 200,height: 100,fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(200),color: CustomColors.white),
                  child: Center(child: Icon(Icons.favorite,color: CustomColors.red,size: 14,)),
                ),
              )
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 5),
                Text("Sri Laila Hostel",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: CustomColors.black)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/location.png",width: 15,height: 15,color: CustomColors.darkGray),
                      const SizedBox(width: 2),
                      Expanded(child: Text("Sr Nagar",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray))),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("₹5,000",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: CustomColors.black)),
                    Text("/Mo",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: CustomColors.darkGray)),
                    Spacer(),
                    Image.asset("assets/images/star.png",width: 15,height: 15),
                    Text("4.6",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: CustomColors.black)),
                    Text("(50)",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: CustomColors.darkGray)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
