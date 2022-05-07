import 'dart:io';
import 'package:dory/components/dory_constants.dart';
import 'package:dory/components/dory_page_route.dart';
import 'package:dory/components/dory_widgets.dart';
import 'package:dory/pages/add_medicine/add_alarm_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'components/add_page_widget.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({Key? key}) : super(key: key);

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final _nameController = TextEditingController();
  File? medicineImage;
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
        ),
        body: SingleChildScrollView(
          child: AddPageBody(
            children: [
              Text(
                '어떤 약이에요?',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: largeSpage,
              ),
              Center(
                child: MedicineImageButton(
                  changeImageFile: (File? value) {
                    medicineImage = value;
                  },
                ),
              ),
              const SizedBox(
                height: largeSpage + regularSpace,
              ),
              Text(
                '약 이름',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              TextFormField(
                controller: _nameController,
                maxLength: 20,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                style: Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration(
                  hintText: '복용할 약의 이름을 기입해 주세요',
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                  contentPadding: textFieldContentPadding,
                ),
                onChanged: (_) {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomSubmitButton(
          onPressed: _nameController.text.isEmpty ? null : _onAddAlarmPage,
          text: '다음',
        ));
  }

  void _onAddAlarmPage() {
    Navigator.push(
      context,
      FadePageRoute(
        page: AddAlarmPage(
          medicineImage: medicineImage,
          medicineName: _nameController.text,
        ),
      ),
    );
  }
}

//  약 추가 창에 대한 일련의 과정을 class 로 빼서 관리
class MedicineImageButton extends StatefulWidget {
  const MedicineImageButton({Key? key, required this.changeImageFile})
      : super(key: key);

  final ValueChanged<File?> changeImageFile;
  @override
  State<MedicineImageButton> createState() => _MedicineImageButtonState();
}

class _MedicineImageButtonState extends State<MedicineImageButton> {
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      child: CupertinoButton(
        padding: _pickedImage == null ? null : EdgeInsets.zero,
        onPressed: _showBottomSheet,
        child: _pickedImage == null
            ? const Icon(
                CupertinoIcons.photo_camera_solid,
                size: 30,
                color: Colors.white,
              )
            : CircleAvatar(
                foregroundImage: FileImage(_pickedImage!),
                radius: 40,
              ),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return PickImageBottomSheet(
          onPressedCamera: () => _onPressed(ImageSource.camera),
          onPressedGallery: () => _onPressed(ImageSource.gallery),
        );
      },
    );
  }

  void _onPressed(ImageSource source) {
    ImagePicker().pickImage(source: source).then(
      (xfile) {
        if (xfile != null) {
          setState(() {
            _pickedImage = File(xfile.path);
            widget.changeImageFile(_pickedImage);
          });
        }
        Navigator.maybePop(context);
      },
    ).onError((error, stackTrace) {
      Navigator.pop(context);
      showPermissonDenide(context, permission: "카메라 및 갤러리 접근");
    });
  }
}

class PickImageBottomSheet extends StatelessWidget {
  const PickImageBottomSheet(
      {Key? key, required this.onPressedCamera, required this.onPressedGallery})
      : super(key: key);

  final VoidCallback onPressedCamera;
  final VoidCallback onPressedGallery;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBody(children: [
      TextButton(
        onPressed: onPressedCamera,
        child: const Text(
          '카메라로 촬영',
          style: TextStyle(fontSize: 16),
        ),
      ),
      TextButton(
        onPressed: onPressedGallery,
        child: const Text(
          '엘범에서 가져오기',
          style: TextStyle(fontSize: 16),
        ),
      ),
    ]);
  }
}
