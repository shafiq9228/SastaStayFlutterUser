import 'package:flutter/material.dart';
import 'package:pg_hostel/utils/custom_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/secondary_heading_component.dart';
import '../utils/app_styles.dart';

class HelpSupportPage extends StatefulWidget {
  const HelpSupportPage({Key? key}) : super(key: key);

  @override
  State<HelpSupportPage> createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends State<HelpSupportPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _faqData = [
    {
      "category": "Curfew Hours",
      "items": [
        {
          "question": "How do I book a hostel?",
          "answer":
          "You can search for hostels by entering a location or college name, apply filters, and click on 'Book Now' to confirm your stay."
        },
        {
          "question": "How can I cancel a booking?",
          "answer": "Go to your bookings and click on cancel to request a cancellation."
        },
        {
          "question": "Will I get a refund if I cancel?",
          "answer": "Refund eligibility depends on the hostel's cancellation policy."
        }
      ]
    },
    {
      "category": "Coupons & Referrals",
      "items": [
        {
          "question": "Where can I apply a coupon code?",
          "answer": "You can apply a coupon code on the checkout page."
        },
        {
          "question": "How do referrals work?",
          "answer": "Refer a friend using your unique referral code and earn rewards."
        },
        {
          "question": "Is there a limit to how many people I can refer?",
          "answer": "No, you can refer as many people as you want."
        }
      ]
    },
    {
      "category": "Payments & Wallet",
      "items": [
        {
          "question": "What payment methods are accepted?",
          "answer": "We accept credit/debit cards, UPI, and net banking."
        },
        {
          "question": "How do I add money to my wallet?",
          "answer": "Go to Wallet in the app and click 'Add Money'."
        }
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            const SecondaryHeadingComponent(buttonTxt: "Help & Support"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: "Search FAQs",
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {}); // Refresh search results
                        },
                      ),
                    ),
                    // FAQ List
                    Expanded(
                      child: ListView.builder(
                        itemCount: _faqData.length,
                        itemBuilder: (context, index) {
                          final category = _faqData[index];
                          final items = category["items"] as List;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Category Title
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                                child: Text(
                                  category["category"],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              // Questions
                              ...items.map((item) {
                                // Search filter
                                if (_searchController.text.isNotEmpty &&
                                    !item["question"]
                                        .toLowerCase()
                                        .contains(_searchController.text.toLowerCase())) {
                                  return const SizedBox.shrink();
                                }

                                return ExpansionTile(
                                  title: Text(
                                    item["question"],
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        item["answer"],
                                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                                      ),
                                    )
                                  ],
                                );
                              }).toList(),
                            ],
                          );
                        },
                      ),
                    ),

                    // Bottom Buttons
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                openEmailSupport(email:"sastastaysupport@gmil.com");
                              },
                              child: const Text("Email Us"),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                openWhatsAppChat(phoneNumber: "9515486032");
                              },
                              child: Container(
                                height: 40,
                                decoration: AppStyles.primaryContainerStyle,
                                child: Center(child: Text("Chat With Us",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> openEmailSupport({
    required String email,
    String subject = '',
    String body = '',
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: Uri.encodeFull(
        'subject=$subject&body=$body',
      ),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch Email';
    }
  }

  /// Function to navigate to WhatsApp Chat
  Future<void> openWhatsAppChat({
    required String phoneNumber, // in international format without '+'
    String message = '',
  }) async {
    final Uri whatsappUri = Uri.parse(
      "https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}",
    );

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }

}
