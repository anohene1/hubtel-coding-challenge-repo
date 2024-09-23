import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hubtel/colors.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({
    super.key,
    required this.isSuccessful,
  });

  final bool isSuccessful;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        // If the transaction was successful, set the background color to a subtle green, otherwise a subtle red
        color: isSuccessful ? AppColors.successGreenBg : AppColors.failedRedBg,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          // If the transaction was successful, use the Check svg, otherwise use the Close svg
          SvgPicture.asset(
              'assets/icons/${isSuccessful ? 'Check.svg' : 'Close.svg'}'),
          const SizedBox(
            width: 5,
          ),
          Text(
            // If the transaction was successful, set the text to Success, otherwise Failed
            isSuccessful ? 'Success' : 'Failed',
            style: TextStyle(
              // If the transaction was successful, set the text color to green, otherwise red
            color: isSuccessful ? AppColors.textGreen : AppColors.textRed,
              fontWeight: FontWeight.w800,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
