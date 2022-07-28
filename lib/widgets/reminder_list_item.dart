import 'package:flutter/material.dart';

import '../core/core.dart';
import 'widgets.dart';

class ReminderListItem extends StatelessWidget {
  const ReminderListItem({
    Key? key,
    required this.amount,
    required this.reminderTitle,
    required this.timeLeft,
    required this.onReschedulePressed,
  }) : super(key: key);

  final String amount;
  final String reminderTitle;
  final String timeLeft;
  final VoidCallback onReschedulePressed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      padding: const EdgeInsets.all(
        16.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.darkGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 8),
              Text(
                reminderTitle,
                style: const TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                timeLeft,
                style: const TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                maxLines: null,
              ),
              const SizedBox(height: 5),
              CustomOutlinedButton(
                onPressed: () {},
                buttonText: 'Reschedule',
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
