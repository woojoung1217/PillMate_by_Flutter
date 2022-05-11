import 'package:dory/components/dory_constants.dart';
import 'package:dory/components/dory_page_route.dart';
import 'package:dory/main.dart';
import 'package:dory/models/medicine_alarm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/medicine.dart';
import 'dart:io';
import 'today_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AfterMedicine extends StatefulWidget {
  const AfterMedicine({Key? key}) : super(key: key);

  @override
  State<AfterMedicine> createState() => _AfterMedicineState();
}

class _AfterMedicineState extends State<AfterMedicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '작성된 경과',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                  border: Border.all(
                width: 0.7,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
