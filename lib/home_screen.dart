import 'package:mitos_paraguay/arview_for_3dobjects.dart';
import 'package:flutter/material.dart';

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
      "model3dUrl": "",
      "photoUrl":"https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/tauykerana.png",
      "name":"Tau y Kerana",
    },
    //MITO 2
    {
    "model3dUrl": "https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/models3d/monaisincolor.glb",
    "photoUrl":"https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images//monai.png",
    "name":"Moñai",
  },
   // MITO 3
  {
      "model3dUrl": "https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/models3d/LUISONsincolor.glb",
      "photoUrl":"https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images//luison.png",
      "name":"Luison",
    },
    //MITO 3
    {
      "model3dUrl": "https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/models3d//aoao.glb",
      "photoUrl":"https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images//AOAO.png",
      "name":"Ao Ao",
    },
    //MITO 4
    {
      "model3dUrl": "https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/models3d/tejujaguasincolor.glb",
      "photoUrl":"https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/tejujagua.png",
      "name":"Teju Jagua",
    },
    //MITO 5
    {
      "model3dUrl": "",
      "photoUrl":"https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/mboitui.png",
      "name":"Mboi Tui",
    },
    //MITO 6
    {
      "model3dUrl": "",
      "photoUrl":"https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/Yasy_Yatere.png",
      "name":"Jasy Jatere",
    },
    //MITO 7
    {
      "model3dUrl": "",
      "photoUrl":"https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/Kurupi.png",
      "name":"Kurupi",
    },

  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(179, 255, 151, 0.5019607843137255),
        title: const Text(
            "Mitos de Yaguaron",
            style: TextStyle(
              height: 5,
              color: Color.fromRGBO(41, 82, 38, 0.8),
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              fontSize: 27,
            )
        ),
        centerTitle: true,
      ),
      body:SafeArea(child: Container(

        color: Color.fromRGBO(75, 87, 63, 0.9019607843137255),
        padding: const EdgeInsets.all(21),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height:253,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(
                    color: Color.fromRGBO(41, 82, 38, 0.9), // Sets the border color to blue
                    width: 5.0,
                  ),
                  image: const DecorationImage(
                    //
                    //CAMBIAR FOTO PARA UNA IMAGEN LOCAL vvv
                    //
                    image: NetworkImage("https://www.abc.com.py/resizer/v2/6XWERAYPDBG37LDY5MDEBTW5FM.jpg?auth=62ef20731a6ec3264685d03e46992d071623d02a7bd1bec930b0d20b806db324&width=770&smart=true"),
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
                    //Navigator.push(
                      //context,
                      //MaterialPageRoute(builder: (context) => informacion.dart()),
                    //);
                  },
                  //alignment: Alignment.bottomCenter,
                  child: Padding(
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
                        color: Color.fromRGBO(151, 205, 17, 10),
                          elevation: 0,
                          child:Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(41, 82, 38, 0.8), // Sets the border color to blue
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
