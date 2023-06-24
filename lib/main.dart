import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splash_screen/splash_screen.dart';
import 'package:splash_screen/styles/text_styles.dart';
import 'package:blur/blur.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'fab_demo.dart';
import 'appbar_demo.dart';
import 'trans_appbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Cafe`',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 34, color: Colors.white, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      home: const AppBarEg(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _email = TextEditingController();
  dynamic _isClearEmail = false;
  dynamic _password = TextEditingController();
  dynamic _isPassVisible = false;
  dynamic _formKey = GlobalKey<FormState>();
  Color _color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(alignment: Alignment.center, children: [
          Blur(
              blur: 3,
              // blurColor: Colors.brown,
              child: Hero(
                tag: 'hero',
                child: Image.asset(
                  "assets/images/bg3.gif",
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              )),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: SingleChildScrollView(
                child: Container(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            // height: 300,
                            child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: RichText(
                                  text: TextSpan(
                                      style: Custom_TextStyle.styleWhite34(
                                          textColor: Colors.black),
                                      children: [
                                    const TextSpan(text: "Welcome to\n"),
                                    const TextSpan(text: "Country Cafe`")
                                  ])),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 20, bottom: 10, left: 10, right: 10),
                            child: TextFormField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.white,
                                  )),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.brown)),
                                  errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  )),
                                  errorStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  focusedErrorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  )),
                                  iconColor: Colors.white,
                                  label: const Text(
                                    "Your email",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  hintText: "abc@xyz.com",
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: _email.text.length > 0
                                      ? IconButton(
                                          onPressed: () {
                                            _email.text = '';
                                            setState(() {});
                                          },
                                          icon: const Icon(
                                            Icons.cancel,
                                            color: Colors.white,
                                          ))
                                      : null),
                              onChanged: (value) {
                                setState(() {});
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email is not valid";
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10, right: 10),
                            child: TextFormField(
                              controller: _password,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !_isPassVisible,
                              obscuringCharacter: "*",
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.white,
                                  )),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.white,
                                  )),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.brown)),
                                  errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  )),
                                  errorStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  focusedErrorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  )),
                                  label: const Text(
                                    "Your Password",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: _isPassVisible
                                        ? const Icon(Icons.remove_red_eye)
                                        : const Icon(Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _isPassVisible = !_isPassVisible;
                                      });
                                    },
                                    color: Colors.white,
                                  )),
                              validator: (value) {
                                if (value!.isEmpty || value == null)
                                  return "Password is not valid";
                                else
                                  return null;
                              },
                            ),
                          ),
                          Container(
                            width: 200,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black38,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Invalide inputs")));
                                  }
                                },
                                child: const Text(
                                  "Log in",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                )),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    minRadius: 40,
                                    backgroundColor:
                                        Color.fromARGB(255, 221, 219, 219),
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(
                                          color: Colors.brown,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Forgot Password ?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      print("Google");
                                    },
                                    icon: const Icon(FontAwesomeIcons.google),
                                    label: const Text("Google"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black38,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(FontAwesomeIcons.facebook),
                                    label: const Text("Facebook"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black38,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
