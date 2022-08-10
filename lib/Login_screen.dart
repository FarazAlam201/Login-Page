import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<Login> {
  bool _obscureText = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _nameformKey = GlobalKey<FormState>();
  final _passwordformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/GoBuddy.png',
              height: 200,
              width: 380,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 280,
                child: Form(
                  key: _nameformKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2.5,
                          color: Color.fromARGB(255, 1, 59, 70),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2.5,
                          color: Color.fromARGB(255, 1, 59, 70),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            width: 2.5,
                            color: Colors.red,
                          )),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          width: 2.5,
                          color: Colors.red,
                        ),
                      ),
                      labelText: 'User Name',
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 1, 59, 70)),
                      hintText: 'your name',
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.redAccent,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter User Name";
                      }
                      return null;
                    },
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 280,
              child: Form(
                key: _passwordformKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2.5, color: Color.fromARGB(255, 1, 59, 70)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2.5, color: Color.fromARGB(255, 1, 59, 70)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          width: 2.5,
                          color: Colors.red,
                        )),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        width: 2.5,
                        color: Colors.red,
                      ),
                    ),
                    labelText: 'Password',
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 1, 59, 70)),
                    hintText: 'your password',
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.redAccent,
                    ),
                    suffixIcon: IconButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Password";
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 130,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 1, 59, 70)),
                    ))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        colors: [Colors.red, Color.fromARGB(255, 1, 59, 70)]),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        offset: Offset(0, 5),
                      ),
                    ]),
                child: MaterialButton(
                  onPressed: () {
                    var _username = _nameController.text;
                    var _password = _passwordController.text;
                    print("Name : " + _username);
                    print("Password : " + _password);
                    if (_nameformKey.currentState!.validate() ||
                        _passwordformKey.currentState!.validate()) {
                      print("Validated");
                    } else {
                      print('Not Validated');
                    }
                    if (_nameController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty) {
                      var _userName = _nameController.text;
                      Fluttertoast.showToast(
                          msg: "Welcome " + _userName,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Color.fromARGB(255, 1, 59, 70),
                          textColor: Colors.white,
                          fontSize: 15);
                    } else {
                      return;
                    }
                  },
                  child: const Text(
                    "Log in",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Icon(Icons.fingerprint,
                size: 60, color: Color.fromARGB(255, 1, 59, 70)),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Container(
                width: 190,
                child: const Divider(
                  height: 10,
                  color: Color.fromARGB(255, 8, 82, 97),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an Account?",
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 82, 97),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 1, 59, 70)),
                    ))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
