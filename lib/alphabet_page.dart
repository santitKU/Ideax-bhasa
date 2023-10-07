import 'package:flutter/material.dart';
import 'package:signbloom/alphabet.dart';

class LearnAlphabet extends StatelessWidget {
  const LearnAlphabet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Learn Alphabet",
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Button(
            text: "A",
            image: Image.asset("assets/alphabet/a.png"),
          ),
          Button(
            text: "B",
            image: Image.asset("assets/alphabet/b.png"),
          ),
          Button(
            text: "C",
            image: Image.asset("assets/alphabet/c.png"),
          ),
          Button(
            text: "D",
            image: Image.asset("assets/alphabet/d.png"),
          ),
          Button(
            text: "E",
            image: Image.asset("assets/alphabet/e.png"),
          ),
          Button(
            text: "F",
            image: Image.asset("assets/alphabet/f.png"),
          ),
          Button(
            text: "G",
            image: Image.asset("assets/alphabet/g.png"),
          ),
          Button(
            text: "H",
            image: Image.asset("assets/alphabet/h.png"),
          ),
          Button(
            text: "I",
            image: Image.asset("assets/alphabet/i.png"),
          ),
          Button(
            text: "J",
            image: Image.asset("assets/alphabet/j.png"),
          ),
          Button(
            text: "K",
            image: Image.asset("assets/alphabet/k.png"),
          ),
          Button(
            text: "L",
            image: Image.asset("assets/alphabet/l.png"),
          ),
          Button(
            text: "M",
            image: Image.asset("assets/alphabet/m.png"),
          ),
          Button(
            text: "N",
            image: Image.asset("assets/alphabet/n.png"),
          ),
          Button(
            text: "O",
            image: Image.asset("assets/alphabet/o.png"),
          ),
          Button(
            text: "P",
            image: Image.asset("assets/alphabet/p.png"),
          ),
          Button(
            text: "Q",
            image: Image.asset("assets/alphabet/q.png"),
          ),
          Button(
            text: "R",
            image: Image.asset("assets/alphabet/r.png"),
          ),
          Button(
            text: "S",
            image: Image.asset("assets/alphabet/s.png"),
          ),
          Button(
            text: "T",
            image: Image.asset("assets/alphabet/t.png"),
          ),
          Button(
            text: "U",
            image: Image.asset("assets/alphabet/u.png"),
          ),
          Button(
            text: "V",
            image: Image.asset("assets/alphabet/v.png"),
          ),
          Button(
            text: "W",
            image: Image.asset("assets/alphabet/w.png"),
          ),
          Button(
            text: "X",
            image: Image.asset("assets/alphabet/x.png"),
          ),
          Button(
            text: "Y",
            image: Image.asset("assets/alphabet/y.png"),
          ),
          Button(
            text: "Z",
            image: Image.asset("assets/alphabet/z.png"),
          ),
        ],
      ),
    );
  }
}
