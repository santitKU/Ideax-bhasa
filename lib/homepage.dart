import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:signbloom/bbox.dart';
import 'package:signbloom/cultural_detail.dart';
import 'package:signbloom/hometry.dart';
import 'package:signbloom/try_home.dart';
// import 'package:signbloom/learn_page.dart';
// import 'package:signbloom/try_home.dart';
// import 'package:signbloom/tryhome1.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
              haptic: true, //
              //backgroundColor: Colors.pin.shade100,
              color: Colors.red.shade900,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.redAccent.shade700, // haptic feedback
              padding: const EdgeInsets.all(16),
              gap: 8,
              tabs: [
                const GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.chat,
                  text: "Chat",
                  onPressed: () {},
                ),
                GButton(
                  icon: Icons.class_,
                  text: 'Learn',
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                    }));
                  },
                ),
                GButton(
                  icon: Icons.sign_language,
                  text: "Try",
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return HomePage2();
                    }));
                  },
                ),
                GButton(
                  icon: Icons.logout,
                  text: 'Log Out',
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                ),
              ]),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(48, 8, 8, 8),
                    child: Image.asset(
                      "assets/logo1.png",
                      // color: Colors.red,
                      width: size.width * 0.35,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Welcome to Bhasa",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () {
                            //Navigator.of(context).push(
                            //  MaterialPageRoute(builder: (context){
                            //  return SpeechScreen();
                            //}));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: null,
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/chat2.png",
                                  width: size.width * 0.4,
                                ),
                                const Text(
                                  "Chat",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Through the conversion of speech to text, deaf people can understand what others are saying and respond via text.",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(builder: (context){
                            //   return const LearnPage();
                            //}));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: null,
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/learn.png",
                                  width: size.width * 0.4,
                                ),
                                const Text(
                                  "Learn",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Through the use of Flip Cards, deaf people can learn the symbols and their meanings.",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () {
                            //Navigator.of(context).push(
                            //  MaterialPageRoute(builder: (context){
                            //return const RealTimePage();
                            //}));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: null,
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/try2.png",
                                  width: size.width * 0.35,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Try for yourself",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "You can test your knowledge through our 'Real Time Sign Language Recognition' machine learning model.",
                                  style: TextStyle(color: Colors.black54),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Text('Signed in as: ${user?.email}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
