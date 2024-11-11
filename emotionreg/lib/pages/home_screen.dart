import 'dart:typed_data';

import 'package:emotionreg/pages/styles/button_style.dart';
import 'package:emotionreg/pages/widgets/typing_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  static const String homeScreen = "/homeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Uint8List? image;
  String? feel;
  final String motto = """Discover the power of emotion recognition.
Upload your photo and let our AI reveal your true feelings. """;
  List<String> models = ["Reg ex", "Gen Ai"];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: 
            feel ==null?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Image.asset("assets/Innov8.png", height: 100, width: 250),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TypingTextAnimationWithCursor(text: motto),
                ),
                const SizedBox(height: 45),
                if (image != null)
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width > 800 ? 100 : 50),
                    child: Image.memory(
                      image!,
                      fit: BoxFit.cover
                    ),
                  ),
                if (image != null)
                  DropdownButton(
                      value: models.first,
                      items: models
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (_) {}),
                if (image == null)
                  SvgPicture.asset("face.svg", height: 150, width: 150),
                const SizedBox(height: 30),
                ElevatedButton(
                    style: CustomButtonStyle.elevatedButtonStyle,
                    onPressed: () async {
                      if (image == null) {
                        image = await pickImage();
                      } else {}
                      setState(() {});
                    },
                    child:
                        Text(image == null ? "Uplaod Image" : "Detect Emotion"))
              ],
            ):
            Column(
              children: [
                Text( " Based on analysis, you eeem to feel"),
                // Text(data)
              ],
            )
          ),
        ),
      ),
    );
  }

  Future<Uint8List?> pickImage() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image?.readAsBytes();
  }
}

