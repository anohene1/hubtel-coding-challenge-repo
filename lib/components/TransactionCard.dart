import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hubtel/colors.dart';
import 'package:hubtel/model/transaction.dart';

import 'StatusChip.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard(
      {super.key,
        required this.transaction
      });

  final Transaction transaction;

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
            transaction.time,
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
                    'assets/images/${transaction.isMoMo ? 'momo.png' : 'absa.png'}'),
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
                            transaction.name,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        StatusChip(isSuccessful: transaction.isSuccessful),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          transaction.phone.replaceAllMapped(
                              RegExp(r'^(\d{3})(\d{3})(\d{4})$'), (match) {
                            return '${match[1]} ${match[2]} ${match[3]}';
                          }),
                          style: const TextStyle(color: AppColors.textGray),
                        ),
                        Text(
                          transaction.amount,
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
              Text(transaction.category),
              Container(
                height: 4,
                width: 4,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: AppColors.backgroundGray,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Expanded(child: Text(transaction.reference)),
              if (transaction.isFavorite)
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
