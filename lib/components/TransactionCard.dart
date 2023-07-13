import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';
import 'StatusChip.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard(
      {super.key,
      required this.time,
      required this.name,
      this.reference,
      required this.phone,
      required this.amount,
      required this.isSuccessful,
      required this.isMoMo,
      this.isFavorite = false,
      required this.category});

  final String time, name, phone, amount, category;
  final String? reference;
  final bool isSuccessful, isMoMo, isFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderGray),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: const TextStyle(color: AppColors.textGray),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25,
                child: Image.asset(
                    'assets/images/${isMoMo ? 'momo.png' : 'absa.png'}'),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        StatusChip(isSuccessful: isSuccessful),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          phone.replaceAllMapped(
                              RegExp(r'^(\d{3})(\d{3})(\d{4})$'), (match) {
                            return '${match[1]} ${match[2]} ${match[3]}';
                          }),
                          style: const TextStyle(color: AppColors.textGray),
                        ),
                        Text(
                          amount,
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1,
            color: AppColors.borderGray,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SvgPicture.asset('assets/icons/Person.svg'),
              const SizedBox(
                width: 8,
              ),
              Text(category),
              if (reference != null)
                Container(
                  height: 4,
                  width: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: AppColors.backgroundGray,
                      borderRadius: BorderRadius.circular(10)),
                ),
              if (reference != null) Expanded(child: Text(reference!)),
              if (isFavorite)
                Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  child: SvgPicture.asset('assets/icons/Star.svg'),
                ),
            ],
          )
        ],
      ),
    );
  }
}
