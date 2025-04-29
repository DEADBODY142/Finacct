import 'package:finacct/common/commonforall.dart';
import 'package:finacct/common/bottom.dart';
import 'package:finacct/pages/login.dart';
import 'package:finacct/pages/menu.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var name = 'RAM BAHADUR SHRESTHA';
    var url = 'https://internal.infobraintechs.com/api/collector';
    var client = 'Demo';
    final containerHeight = screenHeight * 0.3;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Commonforall(),
            SizedBox(height: screenHeight * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Column(
                children: [
                  // First Container
                  Container(
                    height: containerHeight,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.04,
                      right: screenWidth * 0.04,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffC2DDFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        // First Row with ID and Logout
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: _buildImageWithText(
                                'assets/profile/id.png',
                                'ID',
                                name,
                                screenWidth,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              child: Container(
                                width: screenWidth * 0.30,
                                height: screenWidth * 0.12,
                                decoration: BoxDecoration(
                                  color: const Color(0xffC2DDFF),
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/profile/logout.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        _buildImageWithTextRow(
                          'assets/profile/URL.png',
                          'URL',
                          url,
                          screenWidth,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        _buildImageWithTextRow(
                          'assets/profile/client.png',
                          'Client Alies',
                          client,
                          screenWidth,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.02),
                      child: Text(
                        'Data Sync Options',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Second Container
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Menu()),
                      );
                    },
                    child: Container(
                      height: screenHeight * 0.12,
                      margin: EdgeInsets.only(top: screenHeight * 0.02),
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: const Color(0xffC2DDFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: _buildImageWithTextRow(
                        'assets/profile/fetch.png',
                        'Fetch New Records Only',
                        'Only download new customer records from the server',
                        screenWidth,
                      ),
                    ),
                  ),

                  // Third Container
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Menu()),
                      );
                    },
                    child: Container(
                      height: screenHeight * 0.12,
                      margin: EdgeInsets.only(top: screenHeight * 0.02),
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: const Color(0xffC2DDFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: _buildImageWithTextRow(
                        'assets/profile/fetchall.png',
                        'Fetch All Data',
                        'Replace all existing records with fresh data',
                        screenWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }

  // Helper method for the ID row
  Widget _buildImageWithText(
    String imagePath,
    String title,
    String subtitle,
    double screenWidth,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: screenWidth * 0.06,
          height: screenWidth * 0.14,
          decoration: BoxDecoration(
            color: const Color(0xffC2DDFF),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.04),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.04,
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(subtitle, style: TextStyle(fontSize: screenWidth * 0.03)),
            ],
          ),
        ),
      ],
    );
  }

  // Helper method for other rows
  Widget _buildImageWithTextRow(
    String imagePath,
    String title,
    String subtitle,
    double screenWidth,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: screenWidth * 0.06,
          height: screenWidth * 0.14,
          decoration: BoxDecoration(
            color: const Color(0xffC2DDFF),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.04),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.04,
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(subtitle, style: TextStyle(fontSize: screenWidth * 0.03)),
            ],
          ),
        ),
      ],
    );
  }
}
