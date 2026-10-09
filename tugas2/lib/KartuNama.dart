import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KartuNama extends StatelessWidget {
  const KartuNama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 10, 79),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Foto mobil berbentuk bulat
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/mobil.jpg'),
                  radius: 80.0,
                ),

                // Nama mobil
                Text(
                  'FERRARI F8 SPIDER',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 7,
                  ),
                  textAlign: TextAlign.center,
                ),

                // Harga mobil
                Text(
                  'Harga : 5 Milyar',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 16, 16, 16),
                  ),
                ),

                // Garis pemisah
                const SizedBox(
                  height: 20,
                  width: 400,
                  child: Divider(color: Colors.black),
                ),

                // Card alamat
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black),
                  ),
                  color: const Color.fromARGB(255, 242, 242, 242),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  ),
                  child: ListTile(
                    iconColor: const Color.fromARGB(255, 6, 112, 9),
                    textColor: Colors.black,
                    leading: const Icon(Icons.location_on),
                    title: const Text(
                      'Bandung, Jln. Ahmad Yani No. 812',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                // Card email
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black),
                  ),
                  color: const Color.fromARGB(255, 242, 242, 242),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  ),
                  child: ListTile(
                    iconColor: const Color.fromARGB(255, 230, 19, 0),
                    textColor: Colors.black,
                    leading: const Icon(Icons.email),
                    title: Text(
                      'beliMobilpremium@gmail.com',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.abrilFatface(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                // Card Instagram
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black),
                  ),
                  color: const Color.fromARGB(255, 242, 242, 242),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  ),
                  child: ListTile(
                    iconColor: const Color(0xFFE1306C),
                    textColor: Colors.black,
                    leading: const Icon(Icons.camera_alt),
                    title: Text(
                      '@ferrari.official',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'Instagram',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                // Card TikTok
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black),
                  ),
                  color: const Color.fromARGB(255, 242, 242, 242),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  ),
                  child: ListTile(
                    iconColor: Colors.black,
                    textColor: Colors.black,
                    leading: const Icon(Icons.music_note),
                    title: Text(
                      '@ferrari',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text('TikTok', textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
