import 'package:kuliner/pages/detailpage.dart';
import 'package:kuliner/utils/fetchwatchlist.dart';
import 'package:kuliner/widgets/drawer.dart';
import 'package:flutter/material.dart';

class MywatchlistPage extends StatefulWidget {
  const MywatchlistPage({super.key});

  @override
  State<MywatchlistPage> createState() => _MywatchlistPageState();
}

class _MywatchlistPageState extends State<MywatchlistPage> {
  Future fetchData = fetchMywatchlist();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watchlist'),
      ),
      drawer: const DrawerApp(
        route: 'mywatchlist',
      ),
      body: FutureBuilder(
        future: fetchData,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    'Tidak ada my watch list :(',
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  // isWatched = snapshot.data![index].watched;
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                              data: snapshot.data![index],),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color:
                              snapshot.data![index].watched ? Colors.green : Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 2.0,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${snapshot.data![index].title}',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                snapshot.data![index].watched
                                    ? 'Watched'
                                    : 'Not watched',
                              ),
                            ],
                          ),
                          Checkbox(
                            value: snapshot.data![index].watched,
                            onChanged: (val) {
                              setState(() {
                                snapshot.data![index].watched = !snapshot.data![index].watched;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}