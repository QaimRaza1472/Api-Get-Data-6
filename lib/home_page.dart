import 'package:api_get_data_6/Models/models.dart';
import 'package:api_get_data_6/Services/api_manger.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<AlbumModel>?  fetchAlbum;
  bool isLoaded=false;
  
  
  
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();


  }
  void getData()async{
    fetchAlbum = await Api_Manger().getData();
    if(fetchAlbum!=null){
      setState(() {
        isLoaded=true;



      });
    }

  }
  
  

 int? selected;










  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: fetchAlbum?.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(

                  onDoubleTap: (){
                    Future.delayed(const Duration(milliseconds: 500), () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard(
                          id:fetchAlbum![index].id,
                          title: fetchAlbum![index].title,
                          thumbNail:fetchAlbum![index].thumbnailUrl,
                        ),
                        ),
                        );
                      }
                      );
                    }
                    );
                  },

                  onTap: (){
                    setState(() {
                      selected=index;
                    });
                  },

                  child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                       // color: Colors.yellow,
                        color: selected==index ?Colors.green.withOpacity(0.7):Colors.white,
                          boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0,0)


                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                image: DecorationImage(
                                    image: NetworkImage(fetchAlbum![index].thumbnailUrl,
                                    )),

                              ),
                            ),
                            Column(
                              children: [
                                Text(fetchAlbum![index].id.toString(),
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                                Container(
                                  width: 270,
                                  //color: Colors.red,
                                  child: Text(fetchAlbum![index].title,


                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ),
                ),
              );
            },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
