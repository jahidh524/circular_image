import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Circular Image demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 45,
              child: Stack(
                children: List.generate(
                  5,
                  (imageIndex) {
                    double leftPosition = imageIndex * 35.0;
                    // String profileImageUrl = '';
                    // for (var user in communityController.users.value) {
                    //   if (user['userId'] == listDetails[imageIndex]) {
                    //     profileImageUrl = user['profileImage'] ?? '';
                    //     break;
                    //   }
                    // }

                    return Positioned(
                      left: leftPosition,
                      child: imageIndex < 3
                          ? Container(
                              clipBehavior: Clip.antiAlias,
                              width: 45.0,
                              height: 45.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.circular(15.0),
                              ),
                              // child: CachedNetworkImage(
                              //   imageUrl: profileImageUrl,
                              //   placeholder: (context, url) => const Center(
                              //       child: CircularProgressIndicator()),
                              //   errorWidget: (context, url, error) =>
                              child: Image.asset('assets/profileAvater.png'),
                              //   fit: BoxFit.cover,
                              // ),
                            )
                          : imageIndex == 3
                              ? Container(
                                  width: 45.0,
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: const AssetImage(
                                          'assets/profileAvater.png'
                                          // listDetails[imageIndex],
                                          ),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.3),
                                        BlendMode.dstATop,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/threeDot.svg",
                                      height: 45,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
