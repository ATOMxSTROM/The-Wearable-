import "package:flutter/material.dart";
import "package:model_viewer_plus/model_viewer_plus.dart";
import "package:provista/constants.dart";


class Animation3d extends StatefulWidget {
  const Animation3d({super.key});

  @override
  State<Animation3d> createState() => _Animation3dState();
}

class _Animation3dState extends State<Animation3d> {
 
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: kPrimaryColor.withOpacity(0.007),
      body: const Center( 
        child: ModelViewer(src: "assets/model/sriram.glb",autoRotate: true,disableZoom: true,)
      ),
    );
  }
}
