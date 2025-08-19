import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pg_hostel/utils/auth_utils.dart';

class BookingSuccessPage extends StatelessWidget {
  final String? hostelName;
  final DateTime? checkInDate;
  final DateTime? checkOutDate;
  final String? roomType;
  final int? numberOfGuests;
  final double? totalPrice;
  final String? bookingId;

  const BookingSuccessPage({
    super.key,
    required this.hostelName,
    required this.checkInDate,
    required this.checkOutDate,
    required this.roomType,
    required this.numberOfGuests,
    required this.totalPrice,
    required this.bookingId,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    final currencyFormat = NumberFormat.currency(symbol: '\$');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmed'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 80,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Booking Successful!',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your booking at $hostelName has been confirmed',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Booking Details',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(
                      context,
                      icon: Icons.home,
                      label: 'Hostel',
                      value: hostelName ?? "",
                    ),
                    const Divider(height: 30),
                    _buildDetailRow(
                      context,
                      icon: Icons.calendar_today,
                      label: 'Check-in',
                      value: AuthUtils.formatDateToLong(checkInDate),
                    ),
                    const SizedBox(height: 8),
                    _buildDetailRow(
                      context,
                      icon: Icons.calendar_today,
                      label: 'Check-out',
                      value: AuthUtils.formatDateToLong(checkOutDate),
                    ),
                    const Divider(height: 30),
                    _buildDetailRow(
                      context,
                      icon: Icons.king_bed,
                      label: 'Room Type',
                      value: roomType ?? "",
                    ),
                    const SizedBox(height: 8),
                    _buildDetailRow(
                      context,
                      icon: Icons.people,
                      label: 'Guests',
                      value: '$numberOfGuests',
                    ),
                    const Divider(height: 30),
                    _buildDetailRow(
                      context,
                      icon: Icons.confirmation_number,
                      label: 'Booking ID',
                      value: bookingId ?? "",
                    ),
                    const SizedBox(height: 8),
                    _buildDetailRow(
                      context,
                      icon: Icons.attach_money,
                      label: 'Total Price',
                      value: currencyFormat.format(totalPrice),
                      isPrice: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to home or bookings list
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Back to Home'),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // TODO: Implement view booking details
              },
              child: const Text('View Booking Details'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
      BuildContext context, {
        required IconData icon,
        required String label,
        required String value,
        bool isPrice = false,
      }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 12),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey[600],
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: isPrice ? FontWeight.bold : FontWeight.normal,
            color: isPrice ? Theme.of(context).primaryColor : null,
          ),
        ),
      ],
    );
  }
}