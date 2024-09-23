import 'package:flutter/material.dart';
import 'package:hubtel/colors.dart';


class DateChip extends StatelessWidget {
  const DateChip({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Chip(
        backgroundColor: AppColors.backgroundGray,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        label: Text(
          label,
          style: const TextStyle(
              color: AppColors.textGray, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
