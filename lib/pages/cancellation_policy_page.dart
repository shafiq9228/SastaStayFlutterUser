import 'package:flutter/material.dart';
import 'package:pg_hostel/components/secondary_heading_component.dart';
import 'package:pg_hostel/utils/custom_colors.dart';

class CancellationPolicyPage extends StatelessWidget {
  const CancellationPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SecondaryHeadingComponent(buttonTxt: "Cancellation Policy"),
            policySection(
              title: "Before Check-In Date",
              description:
              "If cancellation is done before the check-in date, the total amount will be refunded to your wallet.",
            ),
            const SizedBox(height: 16),
            policySection(
              title: "Cancellation Request Verification",
              description:
              "All cancellation requests are subject to verification by our panel. The refund will be processed to your wallet after verification.",
            ),
            const SizedBox(height: 16),
            policySection(
              title: "After Check-In Date",
              description:
              "If the user cancels after the check-in date has passed 5 days, a portion of the amount may be deducted as per 5-day charges. The remaining amount will be refunded to your wallet after verification by SastaSaty support.",
            ),
          ],
        ),
      ),
    );
  }

  Widget policySection({required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
