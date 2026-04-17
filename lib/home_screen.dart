import 'package:mitos_paraguay/arview_for_3dobjects.dart';
import 'package:flutter/material.dart';

import 'informacion.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}
//supabase   BASE DE DATOS UTILIZADA
class _HomeScreenState extends State<HomeScreen> {


  List<Map<String, dynamic>> models3dList=[
    //MITO 1
    {
      "model3dUrl": "https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/models3d/tauykerana.glb",
      "photoUrl":"https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/tauykerana.jpg",
      "name":"Taú y Kerana",
    },
    //MITO 2
    {
    "model3dUrl": "https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/models3d/monaisincolor.glb",
    "photoUrl":"https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/monai.jpg",
    "name":"Moñái",
  },
   // MITO 3
  {
      "model3dUrl": "https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/models3d/LUISONsincolor.glb",
      "photoUrl":"https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/luison.jpg",
      "name":"Luisón",
    },
    //MITO 3
    {
      "model3dUrl": "https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/models3d//aoao.glb",
      "photoUrl":"https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/aoao.jpg",
      "name":"Ao Ao",
    },
    //MITO 4
    {
      "model3dUrl": "https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/models3d/tejujaguasincolor.glb",
      "photoUrl":"https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/tejujagua.jpg",
      "name":"Teju Jaguá",
    },
    //MITO 5
    {
      "model3dUrl": "https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/models3d/mboitui.glb",
      "photoUrl":"https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/mboitui.jpg",
      "name":"Mbói Tu’i",
    },
    //MITO 6
    {
      "model3dUrl": "https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/models3d/jasyjatere.glb",
      "photoUrl":"https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/jasyjatere.jpg",
      "name":"Jasy Jateré",
    },
    //MITO 7
    {
      "model3dUrl": "https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/models3d/kurupi.glb",
      "photoUrl":"https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/kurupi.jpg",
      "name":"Kurupí",
    },

  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 50, 0.9),
        title: const Text(
            "Mitos de Yaguarón",
            style: TextStyle(
              height: 5,
              color: Color.fromRGBO(179, 255, 151, 0.8),
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              fontSize: 27,
            )
        ),
        centerTitle: true,
      ),
      body:SafeArea(child: Container(

        color: const Color.fromRGBO(204, 255, 204, 0.4),
        padding: const EdgeInsets.all(21),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height:253,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(
                    color: const Color.fromRGBO(0, 240, 0, 0.7), // Sets the border color to blue
                    width: 5.0,
                  ),
                  image: const DecorationImage(

                    image: NetworkImage("https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/mitos1.jpg"),
                    fit: BoxFit.cover,
                  )
              ),

//
            //
              //
              //ARREGLAR EL ON TAP
              child: InkWell(
                  borderRadius: BorderRadius.circular(19), // Matches your container's border
                   onTap: () {
                     Navigator.push(
                       context,
                        MaterialPageRoute(builder: (context) => const Informacion()),
                      );
                   },
                    child: const Padding(
                    padding: EdgeInsets.only(bottom: 16, top: 200, left: 12),
                    child: Text(

                      "Haga click para aprender mas.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  )
              ),


            ),
            const SizedBox(height:19),
            Expanded(
                child:GridView.count(
                    crossAxisCount:2,
                    crossAxisSpacing:9,
                    mainAxisSpacing:9,
                    children:models3dList.map((each3dItem){
                      return Card(
                        color: const Color.fromRGBO(0, 200, 0, 0.8),
                          elevation: 0,
                          child:Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromRGBO(0, 0, 102, 0.8), // Sets the border color to blue
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(19),
                                  image: DecorationImage(
                                    image: NetworkImage(each3dItem["photoUrl"]),
                                    fit:BoxFit.cover,
                                  )
                              ),
                              child: Transform.translate(
                                  offset: const Offset(0,60),
                                  child:Padding(
                                      padding: const EdgeInsets.all(9),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                              width:50,

                                              child:Center(
                                                  child: ElevatedButton(
                                                      onPressed: (){

                                                        Navigator.push(context, MaterialPageRoute(builder: (c)=> ArviewFor3dObjects(
                                                            name: each3dItem["name"],
                                                            model3dUrl: each3dItem["model3dUrl"])));
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        padding: const EdgeInsets.all(0),

                                                        backgroundColor: Colors.white,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(17),
                                                        ),
                                                      ),
                                                      child: const Icon(
                                                        Icons.phone_android_sharp,
                                                        color: Colors.black,
                                                      ))
                                              )

                                          )
                                        ],
                                      )
                                  )
                              )
                          )
                      );
                    }).toList()
                )
            )
            ],
        ),
      ),
      ),
    );
  }
}
