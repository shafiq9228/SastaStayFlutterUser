import 'package:flutter/material.dart';
import 'package:pg_hostel/components/secondary_heading_component.dart';
import 'package:pg_hostel/utils/custom_colors.dart';


class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            SecondaryHeadingComponent(buttonTxt: "Terms And Condition"),
            Expanded(
              child: const SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: TermsContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TermsContent extends StatelessWidget {
  const TermsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('1. Acceptance of Terms'),
        SectionContent(
            'By accessing or using the Hostel Booking application (the "App"), '
                'you agree to be bound by these Terms and Conditions. If you do not agree '
                'to these terms, please do not use our App.'
        ),

        SectionTitle('2. Account Registration'),
        SectionContent(
            'You must be at least 18 years old to create an account and make bookings. '
                'You are responsible for maintaining the confidentiality of your account '
                'information and for all activities that occur under your account.'
        ),

        SectionTitle('3. Booking and Payments'),
        SectionContent(
            'All bookings are subject to availability and confirmation. '
                'Prices are displayed in the App and may change without notice. '
                'Payment must be made in full at the time of booking unless otherwise stated. '
                'We accept various payment methods as indicated in the App.'
        ),

        SectionTitle('4. Cancellation Policy'),
        SectionContent(
            'Cancellations must be made at least 24 hours before the scheduled check-in time '
                'to receive a full refund. Cancellations made within 24 hours may be subject to '
                'a cancellation fee. No-shows will be charged the full amount of the reservation.'
        ),

        SectionTitle('5. User Responsibilities'),
        SectionContent(
            'You agree to provide accurate and complete information during the booking process. '
                'You are responsible for your behavior at the hostel and for any damages caused '
                'by your actions. The hostel reserves the right to refuse service or terminate '
                'your stay for violation of hostel policies.'
        ),

        SectionTitle('6. Limitation of Liability'),
        SectionContent(
            'The App acts solely as a booking platform. We are not liable for any issues '
                'arising from your stay at the hostel, including but not limited to personal injury, '
                'property loss, or dissatisfaction with services. Our liability is limited to '
                'the amount paid for your booking.'
        ),

        SectionTitle('7. Privacy Policy'),
        SectionContent(
            'Your use of the App is also governed by our Privacy Policy, which explains how '
                'we collect, use, and protect your personal information. By using the App, you '
                'consent to the practices described in the Privacy Policy.'
        ),

        SectionTitle('8. Modifications to Terms'),
        SectionContent(
            'We reserve the right to modify these Terms and Conditions at any time. '
                'Continued use of the App after changes constitutes acceptance of the modified terms.'
        ),

        SectionTitle('9. Governing Law'),
        SectionContent(
            'These Terms and Conditions are governed by the laws of the country where '
                'the hostel is located. Any disputes shall be resolved in the courts of that jurisdiction.'
        ),

        SectionTitle('10. Contact Information'),
        SectionContent(
            'For questions about these Terms and Conditions, please contact us at: '
                'support@hostelbookingapp.com'
        ),

        SizedBox(height: 80), // Space for the fixed button
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style:  TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: CustomColors.primary,
        ),
      ),
    );
  }
}

class SectionContent extends StatelessWidget {
  final String content;

  const SectionContent(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        content,
        style: const TextStyle(
          fontSize: 16,
          height: 1.5,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

