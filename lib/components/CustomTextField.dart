import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hubtel/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: AppColors.backgroundGray,
        filled: true,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 14),
        hintStyle: const TextStyle(
            color: AppColors.textGray),
        prefixIcon: SvgPicture.asset(
          'assets/icons/Search.svg',
          fit: BoxFit.none,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
      ),
    );
  }
}