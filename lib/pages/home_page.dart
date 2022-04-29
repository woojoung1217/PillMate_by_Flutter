import 'package:dory/components/dory_colors.dart';
import 'package:dory/pages/add/add_page.dart';
import 'package:dory/pages/history/history.dart';
import 'package:dory/pages/today/today_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _pages = [
    const TodayPage(),
    const HistoryPage(),
    // const Infopage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(),
          body: _pages[_currentIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: _onAddMedicien,
            child: const Icon(CupertinoIcons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
              elevation: 0,
              child: Container(
                color: Colors.white,
                height: kBottomNavigationBarHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CupertinoButton(
                      onPressed: _onTodayPage,
                      child: Icon(
                        CupertinoIcons.checkmark,
                        color: _currentIndex == 0
                            ? DoryColors.primaryColor
                            : Colors.grey[350],
                      ),
                    ),
                    CupertinoButton(
                      onPressed: _onHistoryPage,
                      child: Icon(
                        CupertinoIcons.text_badge_checkmark,
                        color: _currentIndex == 1
                            ? DoryColors.primaryColor
                            : Colors.grey[350],
                      ),
                    ),
                    // CupertinoButton(
                    //   onPressed: () {
                    //     setState(() {
                    //       _currentIndex = 2;
                    //     });
                    //   },
                    //   child: Icon(
                    //     Icons.local_pharmacy,
                    //     color: _currentIndex == 1
                    //         ? DoryColors.primaryColor
                    //         : Colors.grey[350],
                    //   ),
                    // ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void _onHistoryPage() {
    setState(() {
      _currentIndex = 1;
    });
  }

  void _onTodayPage() {
    setState(() {
      _currentIndex = 0;
    });
  }

  void _onAddMedicien() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddPage(),
      ),
    );
  }
}
