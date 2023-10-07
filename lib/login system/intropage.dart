import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signbloom/login%20system/mainpage.dart';

class Intropage extends StatelessWidget {
  const Intropage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 130,
              ),
              Center(
                child: Text("Bhasa",
                    style: GoogleFonts.getFont("DM Sans",
                        textStyle: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w400,
                            fontSize: 35))),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(48, 8, 8, 8),
                child: Image.asset(
                  "assets/BHASA4.png",
                  color: Colors.red,
                  width: size.width * 0.4,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "Welcome to",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'A JOURNEY OF....',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'UNDERSTANDING',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "E-learning language platform",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            )),
                        child: const Text(
                          "LEARN MORE",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 0,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return const MainPage();
                      }));
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        )),
                    child: const Text(
                      "GET STARTED",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              /*Row(
                children: [
                  SizedBox(
                    width: 70,
                  ),

                   GestureDetector(
                       onTap: (){},
                       child: Text("Our Services")),

                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                      onTap: (){},
                      child: Text("About Us")),

                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                      onTap: (){},
                      child: Text("Contact Us")),


                ],
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
