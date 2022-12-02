import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/drawer.dart';
import '../models/all.dart' as globals;

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _DataBudgetState();
}

class _DataBudgetState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ),
      drawer: const DrawerApp(),
      body: Center(
          child: ListView.builder(
        itemCount: globals.budgets.length,
        itemBuilder: ((context, index) {
          String datetime = DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
              .format(globals.budgets[index].date);
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.circular(5.0),
                shadowColor: Colors.blueGrey,
                child: ListTile(
                  title: Text(globals.budgets[index].judul),
                  subtitle: Text(globals.budgets[index].nominal.toString()),
                  trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(globals.budgets[index].jenisBudget),
                        Text(
                          datetime,
                          style: const TextStyle(color: Colors.grey),
                        )
                      ]),
                )),
          );
        }),
      )),
    );
  }
}
