import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signature/signature.dart';
import '../models/pacijent.dart';

class DonorskaKarticaScreen extends StatelessWidget {
  final Pacijent pacijent;

  DonorskaKarticaScreen({required this.pacijent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donorska kartica'),
        backgroundColor: const Color.fromARGB(255, 190, 36, 25),
      ),
      body: Center(
        child: Card(
          elevation: 8,
          margin: EdgeInsets.all(24),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            padding: EdgeInsets.all(24),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red.shade700, Colors.red.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.favorite, size: 48, color: Colors.white),
                SizedBox(height: 16),
                Text(
                  'Donorska kartica',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Divider(color: Colors.white54, height: 32),
                Text(
                  '${pacijent.ime} ${pacijent.prezime}',
                  style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  'JMBG: ${pacijent.jmbg ?? "N/A"}',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  'Datum rođenja: ${pacijent.datumRodjenja?.toString().split(" ").first ?? "N/A"}',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
                SizedBox(height: 16),
                Text(
                  'Zahvaljujemo što ste donor!',
                  style: GoogleFonts.poppins(
                      fontStyle: FontStyle.italic, color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
