import 'package:flutter/cupertino.dart';

import '../utils/custom_colors.dart';

class SearchViewComponent extends StatelessWidget {
  const SearchViewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: CustomColors.white,borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(children: [
          SizedBox(width:20,height:20,child: Image.asset("assets/images/search.png",color: CustomColors.textColor)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("Search",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: CustomColors.gray)),
          ),
        ],),
      ),
    );
  }
}
