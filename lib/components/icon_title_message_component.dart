import 'package:flutter/material.dart'
    '';
import 'package:pg_hostel/utils/custom_colors.dart';
class IconTitleMessageComponent extends StatelessWidget {
  final String? assetImage;
  final String? title;
  final String? message;
  final Color? color;
  final VoidCallback? onClick;
  const IconTitleMessageComponent({super.key, this.assetImage, this.title, this.message, this.color, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: 50,height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(1000),color: (color ?? Color(0xFFB7DFF5)).withOpacity(0.2)),
              child: Center(child: Image.asset(assetImage ?? "",width: 20,height: 20,color: color ?? CustomColors.primary
              ))),
          SizedBox(height: 5),
          Text(message ?? "",style: TextStyle(fontWeight: FontWeight.w600,color: color ?? CustomColors.textColor,fontSize: 16)),
          SizedBox(height: 2),
          Text(title ?? "",style: TextStyle(fontWeight: FontWeight.w500,color: CustomColors.darkGray,fontSize: 16)),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
