import 'package:flutter/material.dart';


// HALAMAN KALKULATOR BMI
class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  // Controller untuk membaca input pengguna
  final TextEditingController _bbController =
      TextEditingController();

  final TextEditingController _tbController =
      TextEditingController();

  // Variabel untuk menyimpan hasil perhitungan
  double? _hasilBMI;

  String _keterangan = 'Masukkan data Anda';
  String? _jenisKelamin;
  bool _sudahDihitung = false;


  // FUNGSI MENGHITUNG BMI
  void _hitungBMI() {
    final double? bb =
        double.tryParse(_bbController.text.replaceAll(',', '.'));

    final double? tbCm =
        double.tryParse(_tbController.text.replaceAll(',', '.'));

    // Validasi input
    if (bb == null ||
        tbCm == null ||
        bb <= 0 ||
        tbCm <= 0 ||
        _jenisKelamin == null) {
      setState(() {
        _hasilBMI = null;
        _sudahDihitung = true;

        if (_jenisKelamin == null) {
          _keterangan = 'Pilih jenis kelamin terlebih dahulu';
        } else {
          _keterangan = 'Masukkan berat dan tinggi yang valid';
        }
      });
      return;
    }

    // Konversi tinggi badan dari cm ke meter
    final double tbM = tbCm / 100;

    // Rumus BMI = berat badan / (tinggi badan x tinggi badan)
    final double hasil = bb / (tbM * tbM);

    String keterangan;

    // Menentukan kategori BMI
    if (hasil < 18.5) {
      keterangan = 'Berat badan kurang';
    } else if (hasil < 25) {
      keterangan = 'Berat badan normal';
    } else if (hasil < 30) {
      keterangan = 'Berat badan berlebih';
    } else {
      keterangan = 'Obesitas';
    }

    setState(() {
      _hasilBMI = hasil;
      _keterangan = keterangan;
      _sudahDihitung = true;
    });
  }


  // FUNGSI RESET
  void _resetBMI() {
    setState(() {
      // Mengosongkan semua input
      _bbController.clear();
      _tbController.clear();

      // Menghapus hasil perhitungan
      _hasilBMI = null;
      _jenisKelamin = null;
      _keterangan = 'Masukkan data Anda';
      _sudahDihitung = false;
    });
  }


  // MEMBERSIHKAN CONTROLLER
  @override
  void dispose() {
    _bbController.dispose();
    _tbController.dispose();
    super.dispose();
  }


  // KOMPONEN INPUT TEXTFIELD
  Widget _inputAngka({
    required String label,
    required String satuan,
    required IconData ikon,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Masukkan $label',
        suffixText: satuan,
        prefixIcon: Icon(ikon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFFE0E7F0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFF1565C0),
            width: 2,
          ),
        ),
      ),
    );
  }


  // TAMPILAN UTAMA
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kalkulator BMI',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              // HEADER
              
              const Text(
                'Cek Indeks Massa Tubuh',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF17324D),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Masukkan data diri untuk mengetahui kategori BMI Anda.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey,
                ),
              ),

              const SizedBox(height: 24),

              // KARTU HASIL BMI
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF1565C0),
                      Color(0xFF42A5F5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withValues(alpha: 0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    const Icon(
                      Icons.monitor_heart_outlined,
                      size: 42,
                      color: Colors.white,
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Hasil BMI Anda',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      _hasilBMI?.toStringAsFixed(1) ?? '--',
                      style: const TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      _keterangan,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),

                    if (_hasilBMI != null) ...[
                      const SizedBox(height: 10),
                      Text(
                        'Jenis kelamin: $_jenisKelamin',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 28),

              
              // PILIH JENIS KELAMIN
              const Text(
                'Jenis Kelamin',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF17324D),
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _kartuGender(
                      label: 'Laki-laki',
                      ikon: Icons.male,
                      nilai: 'Laki-laki',
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _kartuGender(
                      label: 'Perempuan',
                      ikon: Icons.female,
                      nilai: 'Perempuan',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              
              // INPUT BERAT BADAN
              _inputAngka(
                label: 'Berat badan',
                satuan: 'kg',
                ikon: Icons.monitor_weight_outlined,
                controller: _bbController,
              ),

              const SizedBox(height: 16),

              
              // INPUT TINGGI BADAN
              _inputAngka(
                label: 'Tinggi badan',
                satuan: 'cm',
                ikon: Icons.height,
                controller: _tbController,
              ),

              const SizedBox(height: 24),

              
              // TOMBOL HITUNG
              SizedBox(
                height: 54,
                child: ElevatedButton.icon(
                  onPressed: _hitungBMI,
                  icon: const Icon(Icons.calculate_outlined),
                  label: const Text(
                    'Hitung BMI',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              
              // TOMBOL RESET
              SizedBox(
                height: 54,
                child: OutlinedButton.icon(
                  onPressed: _resetBMI,
                  icon: const Icon(Icons.refresh),
                  label: const Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF1565C0),
                    side: const BorderSide(
                      color: Color(0xFF1565C0),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              
              // INFORMASI KATEGORI BMI             
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kategori BMI Dewasa',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF17324D),
                      ),
                    ),

                    SizedBox(height: 12),

                    Text('• Kurang dari 18,5: Berat badan kurang'),
                    Text('• 18,5 sampai kurang dari 25: Normal'),
                    Text('• 25 sampai kurang dari 30: Berat berlebih'),
                    Text('• 30 atau lebih: Obesitas'),
                  ],
                ),
              ),

              if (_sudahDihitung && _hasilBMI == null) ...[
                const SizedBox(height: 12),
                const Text(
                  'Periksa kembali data dan pilihan jenis kelamin Anda.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 13,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }


  // KARTU PILIHAN JENIS KELAMIN
  Widget _kartuGender({
    required String label,
    required IconData ikon,
    required String nilai,
  }) {
    final bool dipilih = _jenisKelamin == nilai;

    return InkWell(
      onTap: () {
        setState(() {
          _jenisKelamin = nilai;
        });
      },

      borderRadius: BorderRadius.circular(16),

      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 8,
        ),

        decoration: BoxDecoration(
          color: dipilih
              ? const Color(0xFFE3F2FD)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: dipilih
                ? const Color(0xFF1565C0)
                : const Color(0xFFE0E7F0),
            width: dipilih ? 2 : 1,
          ),
        ),

        child: Column(
          children: [
            Icon(
              ikon,
              size: 34,
              color: const Color(0xFF1565C0),
            ),

            const SizedBox(height: 8),

            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: dipilih
                    ? const Color(0xFF1565C0)
                    : const Color(0xFF17324D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
