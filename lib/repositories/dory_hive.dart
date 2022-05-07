import 'package:hive_flutter/hive_flutter.dart';

import '../models/medicine.dart';

class DoryHive {
  Future<void> initializeHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter<Medicine>(MedicineAdapter());
    // Hive.registerAdapter<MedicineHistory>(MedicineHistoryAdapter());

    await Hive.openBox<Medicine>(DoryHiveBox.medicine);
    // await Hive.openBox<MedicineHistory>(DoryHiveBox.medicineHistory);
  }
}

class DoryHiveBox {
  static const String medicine = 'medicine';
}
