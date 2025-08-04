import 'package:flutter/material.dart';
import 'package:pg_hostel/utils/custom_colors.dart';

class SideHeadingComponent extends StatelessWidget {
  final String title;
  const SideHeadingComponent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Row(
        children: [
          Expanded(child: Text(title,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,color: CustomColors.black))),
          const SizedBox(width: 20),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(width: 0.5,color: CustomColors.darkGray)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Row(
              children: [
                Text("View",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: CustomColors.black)),
                const SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(width: 0.5,color: CustomColors.darkGray)),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(Icons.arrow_forward_ios_rounded,color: CustomColors.black,size: 10),
                  ),
                )
              ],
            ),
          ),),
        ],
      ),
    );
  }
}
