import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            SvgPicture.asset(
              'assets/ic_instagram.svg',
              height: 64,
              color: primaryColor,
            ),
            const SizedBox(
              height: 25,
            ),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 65,
                  backgroundImage: NetworkImage(
                    'https://www.postoast.com/wp-content/uploads/2020/04/Money-Heist-Professor-%C3%81lvaro-Morte-6.jpg',
                  ),
                ),
                Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_a_photo),
                      iconSize: 18,
                    ))
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            TextFieldInput(
              hintText: 'Enter your username',
              textEditingController: _usernameController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(
              height: 25,
            ),
            TextFieldInput(
              hintText: 'Enter your email',
              textEditingController: _emailController,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 25,
            ),
            TextFieldInput(
              hintText: 'Enter your password',
              textEditingController: _passwordController,
              textInputType: TextInputType.text,
              isPass: true,
            ),
            const SizedBox(
              height: 25,
            ),
            TextFieldInput(
              hintText: 'Enter your bio',
              textEditingController: _bioController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () async {
                String res = await AuthMethods().signUpUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                  username: _usernameController.text,
                  bio: _bioController.text,
                );
                print(res);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 16),
                ),
                alignment: Alignment.center,
                decoration: const ShapeDecoration(
                  color: blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                Container(
                  child: const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: const Text(
                      "Login.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: blueColor),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
