import 'dart:io';

import 'package:dory/components/dory_constants.dart';
import 'package:dory/components/dory_page_route.dart';
import 'package:dory/main.dart';
import 'package:dory/models/medicine_alarm.dart';
import 'package:dory/pages/today/after_medicine.dart';
import 'package:dory/pages/today/today_empty_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/medicine.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodayPage extends StatelessWidget {
  TodayPage({Key? key}) : super(key: key);
  final medicineAfter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '오늘 복용할 약은?',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: regularSpace,
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: medicineRepository.medicineBox.listenable(),
            builder: _builderMedicineListView,
          ),
        ),
      ],
    );
  }

  Widget _builderMedicineListView(context, Box<Medicine> box, _) {
    final medicines = box.values.toList();
    final medicineAlarms = <MedicineAlarm>[];

    if (medicines.isEmpty) {
      return TodayEmpty();
    }

    for (var medicine in medicines) {
      for (var alarm in medicine.alarms) {
        medicineAlarms.add(
          MedicineAlarm(
            medicine.id,
            medicine.name,
            medicine.imagePath,
            alarm,
            medicine.key,
          ),
        );
      }
    }

    return Column(
      children: [
        const Divider(height: 1, thickness: 1.0),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: smallSpage),
            itemCount: medicineAlarms.length,
            itemBuilder: (context, index) {
              return MedicineListTile(medicineAlarm: medicineAlarms[index]);
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: regularSpace,
              );
            },
          ),
        ),
        const Divider(height: 1, thickness: 1.0),
      ],
    );
  }
}

class MedicineListTile extends StatefulWidget {
  const MedicineListTile({
    Key? key,
    required this.medicineAlarm,
  }) : super(key: key);

  final MedicineAlarm medicineAlarm;

  @override
  State<MedicineListTile> createState() => _MedicineListTileState();
}

class _MedicineListTileState extends State<MedicineListTile> {
  final medicineAfter = TextEditingController();

  //추가
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText2;
    return Row(
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: widget.medicineAlarm.imagePath == null
              ? null
              : () {
                  Navigator.push(
                      context,
                      FadePageRoute(
                          page: Scaffold(
                        resizeToAvoidBottomInset: false,
                        appBar: AppBar(
                          leading: const CloseButton(),
                          actions: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(context,
                                    FadePageRoute(page: const AfterMedicine()));
                              },
                              icon: const Icon(CupertinoIcons.arrow_right),
                            ),
                          ],
                        ),
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: SizedBox(
                                  width: 300,
                                  height: 200,
                                  // decoration: BoxDecoration(
                                  //     border: Border.all(width: 0.1),
                                  //     borderRadius: const BorderRadius.all(
                                  //       Radius.circular(30.0),
                                  //     )),
                                  child: Image.file(
                                    File(widget.medicineAlarm.imagePath!),
                                  )),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            // 추가

                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                  controller: medicineAfter,
                                  maxLength: 50,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromARGB(
                                              255, 153, 198, 240)),
                                    ),
                                    hintText: '복용 후 약의 경과를 기록해보세요',
                                    hintStyle:
                                        Theme.of(context).textTheme.bodyText2,
                                    contentPadding: textFieldContentPadding,
                                  )),
                            ),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        // shape : 버튼의 모양을 디자인 하는 기능
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    primary: Colors.blue),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const AfterMedicine()));
                                },
                                child: const Text('경과저장'),
                              ),
                            ),
                          ],
                        ),
                      )));
                },
          child: CircleAvatar(
              radius: 40,
              foregroundImage: widget.medicineAlarm.imagePath == null
                  ? null
                  : FileImage(File(widget.medicineAlarm.imagePath!))),
        ),
        const SizedBox(width: smallSpage),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('🕑 ${widget.medicineAlarm.alarmTime}', style: textStyle),
              const SizedBox(
                height: 6,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    '${widget.medicineAlarm.name},',
                    style: textStyle,
                  ),
                  TileActionButton(
                    onTap: () {},
                    title: '지금',
                  ),
                  Text('|', style: textStyle),
                  TileActionButton(
                    onTap: () {},
                    title: '아까',
                  ),
                  Text('먹었어요', style: textStyle),
                ],
              ),
            ],
          ),
        ),
        CupertinoButton(
          onPressed: () {
            medicineRepository.deleteMedicine(widget.medicineAlarm.key);
          },
          child: const Icon(CupertinoIcons.ellipsis_vertical),
        ),
      ],
    );
  }
}

class TileActionButton extends StatelessWidget {
  const TileActionButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = Theme.of(context)
        .textTheme
        .bodyText2
        ?.copyWith(fontWeight: FontWeight.w500);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: buttonTextStyle,
        ),
      ),
    );
  }
}
