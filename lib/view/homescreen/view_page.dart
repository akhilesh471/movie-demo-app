import 'package:demo_app/model/character_model.dart';
import 'package:demo_app/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewPage extends StatelessWidget {
  ViewPage({
    Key? key,
    required this.model,
  }) : super(key: key);
  final Character model;
  
  final formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title:const Text("View Image",),centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: [
                      Container(
                        height: size.height * 0.65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amber,
                            image: DecorationImage(
                                image: AssetImage(
                                  model.img,
                                ),
                                fit: BoxFit.fill)),
                      ),
                      SizedBox(height: size.height*0.007,),
                      Text(
                        model.name,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.rubik(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                      ),
                          SizedBox(height: size.height*0.007,),
                      Text(
                        "Ratings and Review",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.rubik(
                          fontSize: 18,
                           color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                            SizedBox(height: size.height*0.007,),

                      Rating()
                    
                    ]),
              ),
            ),
          ),
        ));
  }
}
