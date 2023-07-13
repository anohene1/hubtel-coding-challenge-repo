import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hubtel_coding_challenge/utils/colors.dart';

import 'components/DateChip.dart';
import 'components/TransactionCard.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _selectedTabIndex = 0;
  bool _showFab = true;
  Duration duration = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 200),
          child: SafeArea(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.05),
                    blurRadius: 1,
                    offset: Offset(0, 2))
              ]),
              padding: const EdgeInsets.all(18.0),
              child: CupertinoSlidingSegmentedControl(
                  groupValue: _selectedTabIndex,
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
                                : Colors.black.withOpacity(0.2)),
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
                                : Colors.black.withOpacity(0.2)),
                      ),
                    ),
                  }),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AnimatedSlide(
          offset: _showFab ? Offset.zero : const Offset(0, 2),
          duration: duration,
          child: AnimatedOpacity(
            opacity: _showFab ? 1 : 0,
            duration: duration,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                    color: AppColors.teal,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                          offset: Offset(0, 10),
                          blurRadius: 30)
                    ]),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'SEND NEW',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundColor: AppColors.lightTeal,
                  radius: 22,
                  child: SvgPicture.asset('assets/icons/Home.svg'),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/MoMo.svg',
                  fit: BoxFit.none,
                  width: 25,
                  height: 35,
                ),
                label: 'Send'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/History.svg',
                  fit: BoxFit.none,
                  height: 35,
                ),
                label: 'History'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/Schedule.svg',
                  fit: BoxFit.none,
                  width: 25,
                  height: 35,
                ),
                label: 'Scheduled'),
          ],
        ),
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            setState(() {
              if (direction == ScrollDirection.reverse) {
                _showFab = false;
              } else if (direction == ScrollDirection.forward) {
                _showFab = true;
              }
            });
            return true;
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              fillColor: AppColors.backgroundGray,
                              filled: true,
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 14),
                              hintStyle:
                                  const TextStyle(color: AppColors.textGray),
                              prefixIcon: SvgPicture.asset(
                                'assets/icons/Search.svg',
                                fit: BoxFit.none,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/icons/Filter.svg',
                              fit: BoxFit.none, height: 30),
                        )
                      ],
                    ),
                    const DateChip(
                      label: 'May 24, 2022',
                    ),
                    const TransactionCard(
                      time: '12:45 PM',
                      name: 'Emmanuel Rockson Kwabena Uncle Ebo',
                      phone: '0241234567',
                      isMoMo: true,
                      isSuccessful: true,
                      reference: 'Cool your heart wai',
                      amount: 'GHS 500',
                      isFavorite: true,
                      category: 'Personal',
                    ),
                    const TransactionCard(
                      time: '12:45 PM',
                      name: 'Absa Bank',
                      phone: '0241234567',
                      isMoMo: false,
                      isSuccessful: false,
                      reference: 'Cool your heart wai',
                      amount: 'GHS 500',
                      isFavorite: true,
                      category: 'Personal',
                    ),
                    const DateChip(
                      label: 'May 24, 2022',
                    ),
                    const TransactionCard(
                      time: '12:45 PM',
                      name: 'Emmanuel Rockson',
                      phone: '0241234567',
                      isMoMo: true,
                      isSuccessful: true,
                      reference: 'Cool your heart wai',
                      amount: 'GHS 500',
                      isFavorite: false,
                      category: 'Personal',
                    ),
                    const TransactionCard(
                      time: '12:45 PM',
                      name: 'Absa Bank',
                      phone: '0241234567',
                      isMoMo: false,
                      isSuccessful: false,
                      // reference: 'Cool your heart wai',
                      amount: 'GHS 500',
                      isFavorite: true,
                      category: 'Other',
                    ),
                  ]),
            ),
          ),
        ));
  }
}
