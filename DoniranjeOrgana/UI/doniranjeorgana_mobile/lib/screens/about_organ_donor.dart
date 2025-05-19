import 'dart:async';
import 'package:doniranjeorgana_mobile/widgets/background_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutOrganDonorScreen extends StatefulWidget {
  @override
  _AboutOrganDonorScreenState createState() => _AboutOrganDonorScreenState();
}

class _AboutOrganDonorScreenState extends State<AboutOrganDonorScreen> {
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Organ4Life",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30),
              _buildFactBox(),
              SizedBox(height: 30),
              _buildTextCard(
                "Transplantation medicine is based on the transplantation of organs and tissues, that is, the transfer of organs from one person to another, which can save the lives of seriously ill patients. It is considered a successful and accepted method of treating patients with organ failure.",
              ),
              _buildImageHeader(),
              SizedBox(height: 24),
              _buildTextCard(
                "One of the most humane acts is considered to be organ donation, which saves or improves the quality of life of people. The process of registering on the donor list is often complex or not clear enough, so the donor registration rate is low. In addition, the lack of information, bureaucratic obstacles, the absence of a digital solution. In most cases, potential donors are not familiar with the legal regulations and registration procedures, which further complicates the process of making a decision to register on the donor list.",
              ),
              _buildTextCard(
                "Transplantation can experimentally study various immune mechanisms within the framework of transplantation immunology, and in clinical application its basic task is to replace diseased tissue with healthy tissue.",
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 111, 43, 38)
                          .withOpacity(0.1),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      textStyle: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    child: Text("BACK", style: TextStyle(color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFactBox() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.60,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 111, 43, 38).withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          'Did you know? Organ donation can save up to 8 lives and improve many others.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildTextCard(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }

  Widget _buildImageHeader() {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerHeight = 300.0;

    return Container(
      height: containerHeight,
      width: screenWidth,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: screenWidth * 0.8,
            child: Image.asset(
              'assets/images/about1.jpg',
              fit: BoxFit.cover,
              width: screenWidth * 0.8,
              height: containerHeight,
            ),
          ),
          Positioned(
            left: 0,
            top: 50,
            width: screenWidth * 0.6,
            height: 200,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              height: 100,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'ABOUT US',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Learn more about organ donation\nand how you can make a difference.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
