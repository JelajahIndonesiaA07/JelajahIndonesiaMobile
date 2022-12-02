import 'package:jim/kuliner/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:jim/kuliner/utils/globals.dart' as globals;

class DataBudget extends StatelessWidget {
  const DataBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ),
      drawer: const DrawerApp(
        route: 'data-budget',
      ),
      body: globals.budgets.isNotEmpty
          ? ListView.builder(
              itemCount: globals.budgets.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 165, 224, 167),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        globals.budgets[index].tanggal,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        globals.budgets[index].judul,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp.${globals.budgets[index].nominal}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            globals.budgets[index].jenis,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                'Data Masih Kosong',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
    );
  }
}