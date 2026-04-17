import 'package:ar_flutter_plugin_engine/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin_engine/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin_engine/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin_engine/datatypes/node_types.dart';
import 'package:ar_flutter_plugin_engine/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin_engine/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin_engine/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin_engine/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin_engine/models/ar_anchor.dart';
import 'package:ar_flutter_plugin_engine/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin_engine/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vectorMath64;

class ArviewFor3dObjects extends StatefulWidget {

  String name;
  String model3dUrl;

  ArviewFor3dObjects({super.key, required this.name, required this.model3dUrl,});

  @override
  State<ArviewFor3dObjects> createState() => _ArviewFor3dObjectsState();
}

class _ArviewFor3dObjectsState extends State<ArviewFor3dObjects> {

  //LLAMA OBJETOS DE AR
  ARSessionManager? sessionManagerAR;
  ARObjectManager? objectManagerAR;
  ARAnchorManager? anchorManagerAR;
  List<ARNode> allNodesList = [];
  List<ARAnchor> allAnchors = [];

//CREA LOS OBJETOS
  createARView(ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager locationManagerAR)
  {
    sessionManagerAR = arSessionManager;
    objectManagerAR = arObjectManager;
    anchorManagerAR = arAnchorManager;

    sessionManagerAR!.onInitialize(
      handleRotation: true,
      handlePans: true,
      showWorldOrigin:true,
      showFeaturePoints: false, //true?
      showPlanes: true,
    );
    objectManagerAR!.onInitialize();

    //CREA EL PLANO CUANDO SE HACE CLICK EN LA PANTALLA
    sessionManagerAR!.onPlaneOrPointTap = detectPlaneAndLetUserTap;

  }
  //DETECTAR PISO Y EL CLICK
  Future<void> detectPlaneAndLetUserTap(List<ARHitTestResult> hitTapResultsList) async
  {
    var userHitTapResults = hitTapResultsList.firstWhere((ARHitTestResult userHitPoint)=> userHitPoint.type == ARHitTestResultType.plane);

  //SI EL CLICK NO ES NULO... SE CREA EL MODELO EN LA CAMARA
  var planeARAnchor = ARPlaneAnchor(
      transformation: userHitTapResults.worldTransform);
  bool? anchorAdded = await anchorManagerAR!.addAnchor(planeARAnchor);

  //CUANDO SE AGREGA EL MODELO ESTE MISMO TOMA ESTAS CARACTERISTICAS
  if(anchorAdded!){
    allAnchors.add(planeARAnchor);
    var object3DNewNode = ARNode(
      type: NodeType.webGLB,
      uri: widget.model3dUrl,
      scale: vectorMath64.Vector3(0.62,0.62,0.62),
      position: vectorMath64.Vector3(0, 0, 0),
      rotation: vectorMath64.Vector4(1, 0, 0,0),
    );

    //agregar el node al anchor
    bool? addARNodeToAnchor = await objectManagerAR!.addNode(object3DNewNode, planeAnchor: planeARAnchor);
    if( addARNodeToAnchor!){
      allNodesList.add(object3DNewNode);
    }
    else{
      sessionManagerAR!.onError("Error.");
    }
  }
  }

  //Funcion para borrar objeto 3d de la camara
  Future<void>removeEvery3DObject() async{
    for (var each3dObject in allAnchors) {
      anchorManagerAR!.removeAnchor(each3dObject);
    }
    allAnchors = [];
  }
  @override
  void dispose(){
    super.dispose();
    sessionManagerAR!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('${widget.name} Modelo 3D'),
          centerTitle: true,
        ),
        body: Stack(
          children: [

            ARView(
              planeDetectionConfig:PlaneDetectionConfig.horizontalAndVertical,
              onARViewCreated: createARView,),
            Padding(
              padding: const EdgeInsets.all(17),
              child: Align(
                alignment: Alignment.bottomRight,
                child: MaterialButton(
                    onPressed:(){

                      removeEvery3DObject();
                    },
                    color:Colors.white,
                    height: 35,
                    minWidth: 41,
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child:const Icon(Icons.cleaning_services_rounded, color: Colors.black,)
                ),
              ),
            )
          ],
        )
    );
  }
}
