import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return Row(
              children: [
                Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 94, 169, 240),
                        borderRadius: BorderRadius.circular(100)),
                    margin: EdgeInsets.all(10),
                    child: Text(
                      data['question_index'].toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['Question'].toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 13),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['Your answer'].toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(125, 255, 255, 255),
                        ),
                      ),
                      Text(
                        data['Correct Answer'].toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 94, 169, 240)),
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
