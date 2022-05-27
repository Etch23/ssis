import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprinkler_system/screens/create_user_screen/local_widgets/gender_option_card.dart';
import 'package:sprinkler_system/screens/users_screen/users_screen.dart';
import 'package:sprinkler_system/services/authentication.dart';
import 'package:sprinkler_system/utils/colors_palette.dart';
import 'package:sprinkler_system/utils/gaps.dart';
import 'package:sprinkler_system/widgets/text_input.dart';
import '../../utils/util_values.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUserScreen extends StatefulWidget {
  static const String routeName = '/create-user';

  const CreateUserScreen({Key? key}) : super(key: key);

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final conto = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController landAreaController = TextEditingController();
  final TextEditingController landShapeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  void signUpUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).createAccount(
      emailAddress: emailController.text,
      password: passwordController.text,
      context: context,
      firstName: firstNameController.text,
      landArea: landAreaController.text,
      landShape: landShapeController.text,
      lastName: lastNameController.text,
      phoneNumber: phoneNumberController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: SingleChildScrollView(
          physics: UtilValues.scrollPhysics,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(
                    color: ColorsPalette.primarySwatch,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.gap32,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    GenderOptionCard(gender: Gender.male),
                    Gaps.gap16,
                    GenderOptionCard(gender: Gender.female),
                  ],
                ),
                Gaps.gap32,
                TextInput(
                  hint: 'First Name',
                  inputType: TextInputType.name,
                  conto: firstNameController,
                  onSaved: (value) {
                    firstNameController.text = value!;
                  },
                ),
                Gaps.gap8,
                TextInput(
                  hint: 'Last Name',
                  inputType: TextInputType.name,
                  conto: lastNameController,
                  onSaved: (value) {
                    lastNameController.text = value!;
                  },
                ),
                Gaps.gap8,
                TextInput(
                  hint: 'Phone Number',
                  inputType: TextInputType.phone,
                  conto: phoneNumberController,
                  onSaved: (value) {
                    phoneNumberController.text = value!;
                  },
                ),
                Gaps.gap8,
                TextInput(
                  hint: 'Email',
                  inputType: TextInputType.emailAddress,
                  conto: emailController,
                  onSaved: (value) {
                    emailController.text = value!;
                  },
                ),
                Gaps.gap8,
                TextInput(
                  hint: 'Password',
                  inputType: TextInputType.visiblePassword,
                  conto: passwordController,
                  onSaved: (value) {
                    passwordController.text = value!;
                  },
                ),
                Gaps.gap8,
                TextInput(
                  hint: 'Land Area',
                  inputType: TextInputType.number,
                  conto: landAreaController,
                  onSaved: (value) {
                    landAreaController.text = value!;
                  },
                ),
                Gaps.gap8,
                TextInput(
                  hint: 'Land shape',
                  inputType: TextInputType.name,
                  conto: landShapeController,
                  onSaved: (value) {
                    landShapeController.text = value!;
                  },
                ),
                Gaps.gap8,
                PrimaryButton(
                    label: 'Create User',
                    onPressed: () {
                      signUpUser();
                      Navigator.of(context).pushNamed(UsersScreen.routeName);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
