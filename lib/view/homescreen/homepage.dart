import 'package:demo_app/model/character_model.dart';
import 'package:demo_app/services/movie_services.dart';
import 'package:demo_app/view/homescreen/view_page.dart';
import 'package:demo_app/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("Home Page"),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Character>>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return ViewPage(
                            model: snapshot.data![index],
                          );
                        })),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, top: 10),
                          child: Container(
                            height: 190,
                            width: size.width * 0.97,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 190,
                                  width: size.width * 0.36,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            snapshot.data![index].img,
                                          ),
                                          fit: BoxFit.fill),
                                      color: Colors.amber,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20))),
                                ),
                                SizedBox(
                                  width: size.width * 0.1,
                                ),
                                Container(
                                  height: 190,
                                  width: size.width * 0.48,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      googleFontTextWidget(
                                          snapshot.data![index].name,
                                          index,
                                          19,
                                          Colors.white),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      googleFontTextWidget(
                                          snapshot.data![index].profession,
                                          index,
                                          15,
                                          Colors.white),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      googleFontTextWidget("Ratings&Reviews",
                                          index, 15, Colors.white38),
                                      SizedBox(
                                        height: size.height * 0.007,
                                      ),
                                      Rating(),
                                      SizedBox(
                                        height: size.height * 0.007,
                                      ),
                                      googleFontTextWidget(
                                          'Watched by 13 friends',
                                          index,
                                          15,
                                          Colors.white38),
                                      SizedBox(
                                        child: SizedBox(
                                          width: size.width * 0.2,
                                          child: Stack(
                                            alignment: Alignment.topLeft,
                                            children: [
                                              peoples(imagePath: "assets/images/sacred-games/p3.jpg"),
                                              Positioned(
                                                  left: 15, child: peoples(imagePath: "assets/images/sacred-games/p1.jpg")),
                                              Positioned(
                                                  left: 30, child: peoples(imagePath: "assets/images/sacred-games/p2.jpg")),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return const SizedBox();
              }
            }),
      ),
    );
  }

  CircleAvatar peoples({required String imagePath}) {
    return  CircleAvatar(
      backgroundImage: ExactAssetImage(imagePath),
      radius: 12,
    );
  }

  Icon people(Color colur) {
    return Icon(
      Icons.circle,
      color: colur,
    );
  }

  Text googleFontTextWidget(String text, int index, double size, Color colour) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.rubik(
          fontSize: size, fontWeight: FontWeight.w500, color: colour),
    );
  }
}
