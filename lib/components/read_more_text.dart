import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  const ReadMoreText({super.key, required this.text});

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text.isNotEmpty ? widget.text : 'No description available',
          maxLines: isExpanded ? null : 3,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: TextStyle(
            color: CustomColors.darkGray,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (widget.text.length > 100) // Show button only if text is long enough
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? 'Read Less' : 'Read More',
              style: TextStyle(
                color: CustomColors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
