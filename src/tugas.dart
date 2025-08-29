import 'dart:io';

void main() {
  List<Map<String, dynamic>> karyawanList = [];

  stdout.write("Masukkan jumlah karyawan: ");
  int jumlahKaryawan = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < jumlahKaryawan; i++) {
    print("\n=== Input Data Karyawan ${i + 1} ===");

    stdout.write("Nama karyawan: ");
    String nama = stdin.readLineSync()!;

    stdout.write("Jumlah jam kerja dalam seminggu: ");
    int jamKerja = int.parse(stdin.readLineSync()!);

    stdout.write("Upah per jam: ");
    double upahPerJam = double.parse(stdin.readLineSync()!);

    stdout.write("Apakah karyawan tetap? (true/false): ");
    bool statusTetap = stdin.readLineSync()!.toLowerCase() == "true";

    karyawanList.add({
      "nama": nama,
      "jamKerja": jamKerja,
      "upahPerJam": upahPerJam,
      "statusTetap": statusTetap,
    });
  }

  for (var karyawan in karyawanList) {
    double gajiKotor = karyawan["jamKerja"] * karyawan["upahPerJam"];
    double pajak = karyawan["statusTetap"]
        ? gajiKotor * 0.10
        : gajiKotor * 0.05;
    double gajiBersih = gajiKotor - pajak;

    print("\n=== Slip Gaji Karyawan ===");
    print("Nama Karyawan : ${karyawan["nama"]}");
    print("Jam Kerja     : ${karyawan["jamKerja"]} jam");
    print("Upah per Jam  : Rp ${karyawan["upahPerJam"]}");
    print("Status        : ${karyawan["statusTetap"] ? "Tetap" : "Kontrak"}");
    print("Gaji Kotor    : Rp ${gajiKotor.toStringAsFixed(2)}");
    print("Pajak         : Rp ${pajak.toStringAsFixed(2)}");
    print("Gaji Bersih   : Rp ${gajiBersih.toStringAsFixed(2)}");
  }
}
