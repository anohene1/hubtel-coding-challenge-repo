import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hubtel/colors.dart';
import 'package:hubtel/components/CustomTextField.dart';
import 'package:hubtel/data/transactions_data.dart';

import 'components/DateChip.dart';
import 'components/TransactionCard.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // Current selected tab index for the CupertinoSlidingSegmentedControl
  int _selectedTabIndex = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    // Simulate a delay to show loading indicator
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add a custom app bar
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 100),
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  blurRadius: 1,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(18.0),
            // Cupertino segmented control for tab switching
            child: CupertinoSlidingSegmentedControl(
              groupValue: _selectedTabIndex,
              backgroundColor: AppColors.backgroundGray,
              onValueChanged: (value) {
                setState(() {
                  _selectedTabIndex = value!;
                });
              },
              children: {
                0: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'History',
                    style: TextStyle(
                      fontWeight: _selectedTabIndex == 0
                          ? FontWeight.w800
                          : FontWeight.w400,
                      color: _selectedTabIndex == 0
                          ? Colors.black
                          : Colors.black.withOpacity(0.2),
                    ),
                  ),
                ),
                1: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Transaction Summary',
                    style: TextStyle(
                      fontWeight: _selectedTabIndex == 1
                          ? FontWeight.w800
                          : FontWeight.w400,
                      color: _selectedTabIndex == 1
                          ? Colors.black
                          : Colors.black.withOpacity(0.2),
                    ),
                  ),
                ),
              },
            ),
          ),
        ),
      ),
      // Position FAB at the center
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FilledButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          backgroundColor: WidgetStateProperty.all(AppColors.teal),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          textStyle: WidgetStateProperty.all(
            GoogleFonts.nunitoSans(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add_circle,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              width: 8,
            ),
            Text('SEND NEW'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: _isLoading
            // Show loading spinner if loading
            ? const Center(child: CircularProgressIndicator())
            // If loading is done, display the list of transactions
            : ListView.builder(
                padding: const EdgeInsets.only(bottom: 80, top: 18),
                // +1 for the search bar
                itemCount: transactionsData.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // Display search bar at the top
                    return Flex(
                      direction: Axis.horizontal,
                      children: [
                        const Flexible(
                          flex: 1,
                          child: CustomTextField(),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/Filter.svg',
                            fit: BoxFit.none,
                            height: 30,
                          ),
                        )
                      ],
                    );
                  }
                  final actualIndex = index - 1;
                  var transactions = transactionsData[actualIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display a chip with the transaction date
                      DateChip(label: transactions.date),
                      // Loop through transactions and display a transaction card for each transaction
                      ...transactions.transactions.map(
                        (transaction) {
                          return TransactionCard(transaction: transaction);
                        },
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
