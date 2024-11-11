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
  final String motto = """Discover the power of emotion recognition.
Upload your photo and let our AI reveal your true feelings. """;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
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
                    width: width - (width / 5),
                    height: height - (height / 5),
                    margin: EdgeInsets.symmetric(
                        horizontal: width > 800 ? 100 : 50),
                    child: Image.memory(image!),
                  ),
                SvgPicture.asset("face.svg", height: 150, width: 150),
                const SizedBox(height: 30),
                ElevatedButton(
                    style: CustomButtonStyle.elevatedButtonStyle,
                    onPressed: () async {
                      image = await pickImage();
                      setState(() {});
                    },
                    child: const Text("Uplaod Image"))
              ],
            ),
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
