// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grabify/Models/cart_model.dart';
import 'package:grabify/Screens/home.dart';
//import 'package:grabify/Screens/home.dart';
//import 'package:grabify/Models/footer.dart';
import 'package:grabify/Screens/welcome.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  runApp(Grabify());
}

class Grabify extends StatelessWidget {
  Grabify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cartmodel(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: const Center(
            child: DummyPage(),
          ),
        ),
      ),
    );
  }
}

class DummyPage extends StatefulWidget {
  const DummyPage({super.key});

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  final userdata = GetStorage();
  @override
  void initState() {
    super.initState();
    userdata.writeIfNull('isLoggedIn', false);
    Future.delayed(Duration.zero, () async {
      checkiflogged();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void checkiflogged() {
    userdata.read('isLoggedIn')
        ? Get.offAll(MyHome())
        : Get.offAll(WelcomePage());
  }
}


// @override
//   void initState() {
//     super.initState();
//     userdata.writeIfNull('isLoggedIn', false);

//     Future.delayed(Duration.zero, () async {
//       checkIfLoggedIn();
//     });
//   }

//   void checkIfLoggedIn() {
    // userdata.read('isLoggedIn')
    //     ? Get.offAll(MyHome())
    //     : Get.offAll(WelcomePage());
//   }
