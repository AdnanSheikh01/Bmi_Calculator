import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  var result = "";
  var bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: const Text(
            'Bmi Calculator',
            style: TextStyle(color: Colors.white),
          )),
      body: Container(
        color: bgColor,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                    controller: _controller1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.line_weight),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        label: const Text(
                          'Enter weight (in KGs)',
                          style: TextStyle(color: Colors.white),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _controller2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.height),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      label: const Text('Enter height (in FTs)',
                          style: TextStyle(color: Colors.white))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                    controller: _controller3,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.height),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: const Text('Enter height (in Inch)',
                            style: TextStyle(color: Colors.white)))),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.deepPurple)),
                    onPressed: () {
                      var wt = _controller1.text.toString();
                      var ft = _controller2.text.toString();
                      var inch = _controller3.text.toString();
                      if (wt != "" && ft != "" && inch != "") {
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iinch = int.parse(inch);

                        var tinch = (ift * 12) + iinch;

                        var tcm = tinch * 2.54;

                        var tm = tcm / 100;
                        var bmi = iwt / (tm * tm);
                        var msg = '';
                        if (bmi > 25) {
                          msg = "Oops!! You're Overweight";
                          bgColor = Colors.red.shade400;
                        } else if (bmi < 18) {
                          msg = "Oops!! You're Underweight";
                          bgColor = Colors.red.shade400;
                        } else {
                          msg = "Yay!! You're healthy";
                          bgColor = Colors.green.shade400;
                        }

                        result =
                            '$msg\n \tYour bmi is: ${bmi.toStringAsFixed(2)}';
                        setState(() {});
                      } else {
                        result = "Please fill all the required field!!";
                        setState(() {});
                      }
                    },
                    child: Text('Calculate')),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  result,
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
