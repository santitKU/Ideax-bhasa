import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:signbloom/bbox.dart';
import 'package:signbloom/cultural_detail.dart';
// import 'package:signbloom/hometry.dart';
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
              color: Colors.cyan,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.cyan, // haptic feedback
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
                  text: 'Explore',
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
                    padding: const EdgeInsets.fromLTRB(48, 8, 55, 8),
                    child: Image.asset(
                      "assets/BHASA4.png",
                      color: Colors.grey[700],
                      width: size.width * 2,
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
                                  "assets/capture.gif",
                                  width: size.width * 0.7,
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
                                  "Learn language through vision. Know what the object means by capturing it through your camera.",
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
                                  "Test yourself",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Quiz",
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
