import 'package:flutter/material.dart';
import 'dart:math';
import '../styles.dart';

class CagrCalculator extends StatefulWidget {
  const CagrCalculator({super.key});

  @override
  State<CagrCalculator> createState() {
    return _CagrCalculatorState();
  }
}

class _CagrCalculatorState extends State<CagrCalculator> {
  final _formKey = GlobalKey<FormState>();
  final v0Controller = TextEditingController();
  final v1Controller = TextEditingController();
  final nController = TextEditingController();
  num v0 = 0;
  num v1 = 0;
  num n = 0;
  num cagr = 0;

  @override
  void dispose() {
    // TODO: cleanup
    v0Controller.dispose();
    v1Controller.dispose();
    nController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: Center(
        child: SizedBox(
          width: 400,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Starting value: ", style: Styles.text1),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '100',
                          ),
                          textAlign: TextAlign.center,
                          controller: v0Controller,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            return myValidator(value);
                          },
                          keyboardType: const TextInputType.numberWithOptions(),
                          // V0
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Ending value: ", style: Styles.text1),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '100',
                          ),
                          textAlign: TextAlign.center,
                          controller: v1Controller,
                          // V1
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            return myValidator(value);
                          },
                          keyboardType: const TextInputType.numberWithOptions(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Number of years: ", style: Styles.text1),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          onFieldSubmitted: (_) =>
                              {FocusScope.of(context).unfocus(), calculate()},
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '5',
                          ),
                          textAlign: TextAlign.center,
                          controller: nController,
                          // n_periods
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            return myValidator(value);
                          },
                          keyboardType: const TextInputType.numberWithOptions(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(100, 60)),
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xAAfb8b1e))),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      calculate();
                    },
                    child: const Text('Calculate'),
                  ),
                ),

                Text(
                  "CAGR: \n${cagr.toStringAsPrecision(3)} %",
                  style: Styles.text2,
                )

                // Add TextFormFields and ElevatedButton here.
              ],
            ),
          ),
        ),
      ),
    );
  }

  calculate() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        v0 = double.parse(v0Controller.text);
        v1 = double.parse(v1Controller.text);
        n = double.parse(nController.text);
        cagr = calculateCagr(v0, v1, n);
      });
    }
  }
}

String? myValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Field error';
  }
  return null;
}

num calculateCagr(v0, v1, n) {
  var v0divv1 = (v1 / v0);
  var oneovern = (1 / n);
  var res = pow(v0divv1, oneovern) - 1;
  return res * 100;
}
