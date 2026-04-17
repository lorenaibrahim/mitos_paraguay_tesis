import 'package:flutter/material.dart';

class Informacion extends StatefulWidget{
  const Informacion({super.key});

  @override
  State<Informacion> createState() => _InformacionState();
}


class _InformacionState extends State<Informacion> {

  final List<Item> items =[
    Item(header: 'Taú y Kerana', body:'>Taú era un espíritu maléfico que se enamoro de Keraná.'
        '\n>Keraná era una niña que se pasaba los días durmiendo. Por esta razón le pusieron por nombre Keraná (dormilona).'
        '\n>Tau raptó a Keraná y por esto Tupã lo maldice. Tau y Keraná tuvieron 7 hijos con apariencia de monstruos o fenómenos: los 7 mitos.'),

    Item(header: 'Moñái', body:'Bomdia'),

    Item(header: 'Luisón', body:'Bomdia'),

    Item(header: 'Ao Ao', body:'Bomdia'),

    Item(header: 'Teju Jaguá', body: '>Teju Jaguá se dice que es un gran lagarto con cabeza de perro, de allí deriva su nombre: teju: lagarto, jagua: perro.'
        '\n>Es considerado guardián de las riquezas de la tierra guaraní.'),

    Item(header: 'Mbói Tu’i', body:'Bomdia'),

    Item(header: 'Jasy Jateré', body:'Bomdia'),

    Item(header: 'Kurupí', body:'Bomdia'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(179, 255, 151, 0.5019607843137255),
        title: const Text(
            "Mitos de Yaguarón",
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

        backgroundColor:const Color.fromRGBO(75, 87, 63, 0.9019607843137255),
        body:SafeArea(child: SingleChildScrollView(

          //color: const Color.fromRGBO(75, 87, 63, 0.9019607843137255),
            padding: const EdgeInsets.all(21),
            child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //
              children: [
                Container(
                    width: double.infinity,
                    height: 253,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(
                          color: const Color.fromRGBO(41, 82, 38, 0.9),
                          // Sets the border color to blue
                          width: 5.0,
                        ),
                        image: const DecorationImage(
                          //
                          //CAMBIAR FOTO A UN VIDEO vvv
                          //
                          image: NetworkImage("https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/bienvenidos2.jpg"),
                          fit: BoxFit.cover,
                        )
                    )

                ),
                const SizedBox(
                    height: 10
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ExpansionPanelList.radio(
                      initialOpenPanelValue: 3,
                      expandedHeaderPadding: const EdgeInsets.all(0.0),
                    children: items.map((item)=>ExpansionPanelRadio(

                      backgroundColor: const Color.fromRGBO(179, 255, 151, 0.5019607843137255),
                      canTapOnHeader:true,
                      value: item.header,
                      headerBuilder: (context, isExpanded)=>ListTile(
                        title: Text(
                          item.header,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      body: ListTile(
                        title: Text(item.body, style: TextStyle(fontSize: 12),),
                      ),)).toList(),
                  ),
                )


            ]


)
    )));
  }


}

class Item {
  final String header;
  final String body;
  //bool isExpanded;
  Item({
  required this.header,
    required this.body,
    //this.isExpanded=false,
});
}