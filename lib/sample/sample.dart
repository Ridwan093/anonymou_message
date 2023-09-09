// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

import 'package:social_share/social_share.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String facebookId = "333042952235420";

  var imageBackground = "images.jpg";
  var videoBackground = "video-background.mp4";
  String imageBackgroundPath = "";
  String videoBackgroundPath = "";

  @override
  void initState() {
    super.initState();
    copyBundleAssets();
  }

  Future<void> copyBundleAssets() async {
    imageBackgroundPath = await copyImage(imageBackground);
    videoBackgroundPath = await copyImage(videoBackground);
  }

  Future<String> copyImage(String filename) async {
    final tempDir = await getTemporaryDirectory();
    ByteData bytes = await rootBundle.load("assets/$filename");
    final assetPath = '${tempDir.path}/$filename';
    File file = await File(assetPath).create();
    await file.writeAsBytes(bytes.buffer.asUint8List());
    return file.path;
  }

  Future<String?> pickImage() async {
    final file = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    var path = file?.path;
    if (path == null) {
      return null;
    }
    return file?.path;
  }

  // Future<String?> screenshot() async {
  //   var data = await screenshotController.capture();
  //   if (data == null) {
  //     return null;
  //   }
  //   final tempDir = await getTemporaryDirectory();
  //   final assetPath = '${tempDir.path}/temp.png';
  //   File file = await File(assetPath).create();
  //   await file.writeAsBytes(data);
  //   return file.path;
  // }

  // ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Social Share'),
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Instagram",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 40),
                  ElevatedButton(
                    child: const Icon(Icons.gradient),
                    onPressed: () async {
                      var path = await pickImage();
                      if (path == null) {
                        return;
                      }
                      SocialShare.shareInstagramStory(
                        appId: facebookId,
                        imagePath: path,
                        backgroundTopColor: "#ffffff",
                        backgroundBottomColor: "#000000",
                      ).then((data) {
                     
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    child: const Icon(Icons.image),
                    onPressed: () async {
                      var path = await pickImage();
                      if (path == null) {
                        return;
                      }
                      SocialShare.shareInstagramStory(
                        appId: facebookId,
                        imagePath: path,
                        backgroundResourcePath: imageBackgroundPath,
                      ).then((data) {
                     
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    child: const Icon(Icons.videocam),
                    onPressed: () async {
                      // var path = await screenshot();
                      // if (path == null) {
                      //   return;
                      // }
                      SocialShare.shareInstagramStory(
                        appId: facebookId,
                        imagePath: "path",
                        backgroundResourcePath: videoBackgroundPath,
                      ).then((data) {
                    
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Facebook",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 40),
                  ElevatedButton(
                    child: const Icon(Icons.gradient),
                    onPressed: () async {
                      SocialShare.shareFacebookStory(
                        appId: facebookId,
                        imagePath:
                            'data:image/jpeg;base64,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ß',
                        backgroundTopColor: "#ffffff",
                        backgroundBottomColor: "#000000",
                      ).then((data) {
                    
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    child: const Icon(Icons.image),
                    onPressed: () async {
                      var path = await pickImage();
                      if (path == null) {
                        return;
                      }
                      SocialShare.shareFacebookStory(
                        appId: facebookId,
                        imagePath: path,
                        backgroundResourcePath: imageBackgroundPath,
                      ).then((data) {
                      
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    child: const Icon(Icons.videocam),
                    onPressed: () async {
                      // var path = await screenshot();
                      // if (path == null) {
                      //   return;
                      // }
                      await SocialShare.shareFacebookStory(
                        appId: facebookId,
                        // imagePath: path,
                        backgroundResourcePath: videoBackgroundPath,
                      ).then((data) {
               
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Twitter",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 40),
                  ElevatedButton(
                    child: const Icon(Icons.text_fields),
                    onPressed: () async {
                      SocialShare.shareTwitter(
                        "This is Social Share twitter example with link.  ",
                        hashtags: ["SocialSharePlugin", "world", "foo", "bar"],
                        url: "https://google.com/hello",
                        trailingText: "cool!!",
                      ).then((data) {
                      
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Clipboard",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 40),
                  ElevatedButton(
                    child: const Icon(Icons.image),
                    onPressed: () async {
                      // SocialShare.copyToClipboard(
                      //   image: await screenshot(),
                      // ).then((data) {
                      //   print(data);
                      // });
                    },
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    child: const Icon(Icons.text_fields),
                    onPressed: () async {
                      SocialShare.copyToClipboard(
                        text: "This is Social Share plugin",
                      ).then((data) {
                        
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "SMS",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                const  SizedBox(width: 40),
                  ElevatedButton(
                    child:const Icon(Icons.text_fields),
                    onPressed: () async {
                      SocialShare.shareSms(
                        "This is Social Share Sms example",
                        url: "https://google.com/",
                        trailingText: "\nhello",
                      ).then((data) {
                        log(data!);
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Share Options",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
               const   SizedBox(width: 40),
                  ElevatedButton(
                    child:const Icon(Icons.text_fields),
                    onPressed: () async {
                      SocialShare.shareOptions("Hello world").then((data) {
                        log(data.toString());
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Whatsapp",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                 const SizedBox(width: 40),
                  ElevatedButton(
                    onPressed: () async {
                      SocialShare.shareWhatsapp(
                        "Hello World \n https://google.com",
                      ).then((data) {
                   
                      });
                    },
                    child:const Icon(Icons.text_fields),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Telegram",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 40),
                  ElevatedButton(
                    onPressed: () async {
                      SocialShare.shareTelegram(
                        "Hello World \n https://google.com",
                      ).then((data) {
                        log(data!);
                      });
                    },
                    child: const Icon(Icons.text_fields),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Get all Apps",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 40),
                  ElevatedButton(
                    child: const Icon(Icons.text_fields),
                    onPressed: () async {
                      SocialShare.checkInstalledAppsForShare().then((data) {
                        log(data.toString());
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
