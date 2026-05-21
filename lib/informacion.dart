import 'package:flutter/material.dart';
import 'package:mitos_paraguay/quiz_screen.dart';

class Informacion extends StatefulWidget{
  const Informacion({super.key});

  @override
  State<Informacion> createState() => _InformacionState();
}


class _InformacionState extends State<Informacion> {

  final List<Item> items =[
    Item(header: 'Taú y Keraná', body:
    '➤ Taú era un espíritu maléfico que se enamoró de Keraná.'
        '\n➤ Keraná era una niña que pasaba los días durmiendo. Por esta razón le pusieron el nombre Keraná (dormilona).'
        '\n➤ Taú raptó a Keraná y, por ello, Tupã lo maldijo. Taú y Keraná tuvieron siete hijos con apariencia de monstruos o fenómenos: los siete mitos (Moñái, Luisón, Ao Ao, Teju Jaguá, Mbói Tu’i, Jasy Jateré y Kurupí).'),

    Item(header: 'Teju Jaguá', body:
    '➤ Se dice que Teju Jaguá es un gran lagarto con cabeza de perro; de allí deriva su nombre: teju = lagarto y jagua = perro.'
        '\n➤ Es considerado guardián de las riquezas de la tierra guaraní.'),

    Item(header: 'Mbói Tu’i', body:
    '➤ Posee el cuerpo de una víbora y la cabeza de un loro.'
        '\n➤ Es considerado la deidad de los cursos de agua y de las criaturas acuáticas.'),

    Item(header: 'Moñái', body:
    '➤ Es una criatura con forma de serpiente gigante con cuernos.'
        '\n➤ Se le considera el guardián de los campos.'
        '\n➤ Algunos afirman que ver al Moñái produce la muerte.'),

    Item(header: 'Jasy Jateré', body:
    '➤ Su nombre significa “fragmento de luna”.'
        '\n➤ Se dice que Jasy Jateré rapta a los niños, los alimenta con frutas, miel y gusanos, y luego los deja libres; '
        'pero éstos regresan a sus casas ya atontados.'),

    Item(header: 'Kurupí', body:
    '➤ El Kurupí es considerado dios de la sexualidad.'
        '\n➤ Posee su miembro viril como una extremidad sumamente larga.'
        '\n➤ Se lo considera protector de los animales de la selva, especialmente de los sementales.'),

    Item(header: 'Ao Ao', body:
    '➤ Es considerado dios de la fecundidad y deidad de los montes y montañas.'
        '\n➤ Posee el cuerpo de oveja y la cabeza de lobo.'
        '\n➤ Si alguien llega a encontrarse con el Ao Ao, la única manera de salvarse es trepando una palmera.'),

    Item(header: 'Luisón', body:
    '➤ Es un hombre lobo y es considerado el más temible de los siete hijos.'
        '\n➤ Sobre él cayó la mayor maldición de los progenitores.'
        '\n➤ Es considerado señor de la muerte por rondar cementerios y alimentarse de la carne de los cadáveres.'),
  ];


  @override
  Widget build(BuildContext context) {
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
        iconTheme: const IconThemeData(
          color: Colors.white, // Changes the back button color
        ),
        centerTitle: true,
      ),

        backgroundColor:const Color.fromRGBO(204, 255, 204, 1),
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
                          //
                          //
                          image: NetworkImage("https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/bienvenidos2.jpg"),
                          fit: BoxFit.cover,
                        )
                    ),


                ),
                const SizedBox(
                    height: 10
                ),
                Container(

                  child:const Text(

                    "⬇Compruebe su conocimiento!⬇",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),

                ),

                const SizedBox(
                    height: 5
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizScreen()),
                    );
                  }
                  ,

                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(
                        color: const Color.fromRGBO(51, 51, 255, 0.9),
                        // Sets the border color to blue
                        width: 5.0,
                      ),
                      image: const DecorationImage(
                        //
                        //
                        //
                        image: NetworkImage("https://lkrqrmogealqcljivxpu.supabase.co/storage/v1/object/public/images/trivia.jpg"),
                        fit: BoxFit.cover,
                      )
                  ), ),




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

                      backgroundColor: const Color.fromRGBO(25, 25, 255, 0.3),
                      canTapOnHeader:true,
                      value: item.header,
                      headerBuilder: (context, isExpanded)=>ListTile(
                        title: Text(
                          item.header,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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