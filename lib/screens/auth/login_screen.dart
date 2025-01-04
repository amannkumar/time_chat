import 'package:flutter/material.dart';
import 'package:time_chat/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double opacityLevel = 0.0;

  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    late Size mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Time Chat"),
      ),
      body: Stack(
        children: [
          Positioned(
            top: mq.height * 0.15,
            left: mq.width * 0.25,
            width: mq.width * .5,
            child: AnimatedOpacity(
                duration: Duration(seconds: 2),
                opacity: opacityLevel,
                child: Image.asset("assets/icon.png")),
          ),
          Positioned(
            bottom: mq.height * 0.15,
            left: mq.width * 0.05,
            width: mq.width * .9,
            height: mq.height * .07,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 1,
                  backgroundColor: const Color.fromARGB(255, 223, 255, 187)),
              icon: Image.asset(
                "assets/search.png",
                height: mq.height * 0.03,
              ),
              label: RichText(
                text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(text: 'Sign In with '),
                      TextSpan(
                          text: 'Google',
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
            ),
          )
        ],
      ),
    );
  }
}
