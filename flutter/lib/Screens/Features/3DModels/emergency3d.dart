import  "package:flutter/material.dart";
import "package:model_viewer_plus/model_viewer_plus.dart";
import "package:provista/constants.dart";


class Emergency3D extends StatefulWidget {
  const Emergency3D({super.key});

  @override
  State<Emergency3D> createState() => _Emergency3DState();
}

class _Emergency3DState extends State<Emergency3D> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kPrimaryColor.withOpacity(0.007),
      body: const Center( 
        child: ModelViewer(src: "assets/model/tunnel.glb",autoRotate: true,disableZoom: true,)
      ),
    );
  }
}