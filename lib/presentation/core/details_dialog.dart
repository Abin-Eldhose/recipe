import 'package:flutter/material.dart';
import 'package:recipie_app/presentation/constants.dart';

class ShowUnitChart {
  static Future showChart(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1)),
            backgroundColor: sigInPageBg2,
            title: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: h * 0.02),
                child: Text(
                  "Unit Conversion Chart",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.05),
                ),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Table(
                  border: TableBorder.all(
                      color: Colors.white, style: BorderStyle.solid, width: 1),
                  children: const [
                    TableRow(children: [
                      TabelCellWidget(
                        text1: 'CUP',
                        text2: '(cup)',
                      ),
                      TabelCellWidget(
                        text1: 'OUNCE',
                        text2: '(oz)',
                      ),
                      TabelCellWidget(
                        text1: 'TABLE',
                        text2: "SPOON",
                        text3: '(tbsp)',
                      ),
                      TabelCellWidget(
                        text1: 'TEA',
                        text2: "SPOON",
                        text3: '(tsp)',
                      ),
                      TabelCellWidget(
                        text1: 'MILLI',
                        text2: "LITRE",
                        text3: '(ml)',
                      ),
                    ]),
                    TableRow(children: [
                      TabelCellWidget(
                        text1: '1',
                        text2: '(cup)',
                      ),
                      TabelCellWidget(
                        text1: '8',
                        text2: '(oz)',
                      ),
                      TabelCellWidget(
                        text1: '16',
                        text2: "tbsp",
                      ),
                      TabelCellWidget(
                        text1: '48',
                        text2: "tsp",
                      ),
                      TabelCellWidget(
                        text1: '237',
                        text2: "ml",
                      ),
                    ]),
                    TableRow(children: [
                      TabelCellWidget(
                        text1: '1/8',
                        text2: '(cup)',
                      ),
                      TabelCellWidget(
                        text1: '1',
                        text2: '(oz)',
                      ),
                      TabelCellWidget(
                        text1: '2',
                        text2: "tbsp",
                      ),
                      TabelCellWidget(
                        text1: '6',
                        text2: "tsp",
                      ),
                      TabelCellWidget(
                        text1: '30',
                        text2: "ml",
                      ),
                    ]),
                    TableRow(children: [
                      TabelCellWidget(
                        text1: '1/16',
                        text2: '(cup)',
                      ),
                      TabelCellWidget(
                        text1: '0.5',
                        text2: '(oz)',
                      ),
                      TabelCellWidget(
                        text1: '1',
                        text2: "tbsp",
                      ),
                      TabelCellWidget(
                        text1: '3',
                        text2: "tsp",
                      ),
                      TabelCellWidget(
                        text1: '15',
                        text2: "ml",
                      ),
                    ]),
                    TableRow(children: [
                      TabelCellWidget(
                        text1: '1/48',
                        text2: '(cup)',
                      ),
                      TabelCellWidget(
                        text1: '0.16',
                        text2: '(oz)',
                      ),
                      TabelCellWidget(
                        text1: '1/3',
                        text2: "tbsp",
                      ),
                      TabelCellWidget(
                        text1: '1',
                        text2: "tsp",
                      ),
                      TabelCellWidget(
                        text1: '5',
                        text2: "ml",
                      ),
                    ]),
                  ],
                )
              ],
            ),
          );
        });
  }
}

class TabelCellWidget extends StatelessWidget {
  final String text1, text2;
  final String? text3;
  const TabelCellWidget(
      {super.key, required this.text1, required this.text2, this.text3});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return TableCell(
      child: Container(
        color: sigInPageBg,
        width: w * 0.4,
        height: h * 0.1,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              text2,
              style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            if (text3 != null)
              Text(
                text3!,
                style: const TextStyle(
                    fontSize: 8,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
