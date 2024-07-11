// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:recipie_app/presentation/blocs/Auht/bloc/auth_bloc.dart';
// import 'package:recipie_app/presentation/constants.dart';
// import 'package:recipie_app/presentation/core/bootom_navigation.dart';
// import 'package:sign_in_button/sign_in_button.dart';

// class SigninWrapper extends StatelessWidget {
//   const SigninWrapper({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AuthBloc(),
//       child: const SignInPage(),
//     );
//   }
// }

// class SignInPage extends StatelessWidget {
//   const SignInPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Builder(
//         builder: (context) {
//           return BlocBuilder<AuthBloc, AuthState>(
//             builder: (context, state) {
//               if (state is AuthInitial) {
//                 return _buildInitialUI(size, context);
//               } else if (state is AuthLoading) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (state is AuthLoaded) {
//                 WidgetsBinding.instance.addPostFrameCallback((_) {
//                   _navigateToHome(context);
//                 });
//                 return const Center();
//               } else if (state is AuthError) {
//                 return _buildErrorUI(state.errorMessage);
//               } else {
//                 return Container();
//               }
//             },
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildInitialUI(Size size, BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: size.width,
//           height: size.height / 1.6,
//           decoration: const BoxDecoration(color: sigInPageBg),
//         ),
//         Container(
//           width: size.width,
//           height: size.height / 1.6,
//           decoration: const BoxDecoration(
//             color: sigInPageBg2,
//             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70)),
//           ),
//           child: Center(
//             child: Image.asset(
//               signInImage,
//               height: size.height / 2.7,
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//             width: size.width,
//             height: size.height / 2.66,
//             decoration: const BoxDecoration(color: sigInPageBg2),
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//             width: size.width,
//             height: size.height / 2.66,
//             decoration: const BoxDecoration(
//               color: sigInPageBg,
//               borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 50),
//               child: Column(
//                 children: [
//                   const Text(
//                     "Let's Cook good food",
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.w700,
//                       wordSpacing: 1,
//                       letterSpacing: 1,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     "Sign in and make your first meal..",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 30, left: 30),
//                     child: SignInButton(
//                       Buttons.google,
//                       onPressed: () {
//                         print('Google sign-in button pressed');
//                         context.read<AuthBloc>().add(SignInReqestEvent());
//                       },
//                       text: "Sign in with Google",
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildErrorUI(String errorMessage) {
//     return Container(
//       height: 100,
//       width: 300,
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: Text(
//             errorMessage,
//             style: const TextStyle(color: Colors.red),
//           ),
//         ),
//       ),
//     );
//   }

//   void _navigateToHome(BuildContext context) {
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (context) => const BottomNavigationPage()),
//       (route) => false,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipie_app/presentation/blocs/Auht/bloc/auth_bloc.dart';
import 'package:recipie_app/presentation/constants.dart';
import 'package:recipie_app/presentation/core/bootom_navigation.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SigninWrapper extends StatefulWidget {
  const SigninWrapper({Key? key}) : super(key: key);

  @override
  _SigninWrapperState createState() => _SigninWrapperState();
}

class _SigninWrapperState extends State<SigninWrapper> {
  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  void _checkAuthentication() async {
    await Future.delayed(
        Duration.zero); // Ensure initState completes before continuing
    if (!mounted) return; // Check if the widget is still mounted

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => AuthBloc(),
              child: const SignInPage(),
            ),
          ),
        );
      });
    } else {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomNavigationPage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthInitial) {
            return _buildInitialUI(size, context);
          } else if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthLoaded) {
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              _navigateToHome(context);
            });
            return const Center();
          } else if (state is AuthError) {
            return _buildErrorUI(state.errorMessage);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildInitialUI(Size size, BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height / 1.6,
          decoration: const BoxDecoration(color: sigInPageBg),
        ),
        Container(
          width: size.width,
          height: size.height / 1.6,
          decoration: const BoxDecoration(
            color: sigInPageBg2,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70)),
          ),
          child: Center(
            child: Image.asset(
              signInImage,
              height: size.height / 2.7,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: size.width,
            height: size.height / 2.66,
            decoration: const BoxDecoration(color: sigInPageBg2),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: size.width,
            height: size.height / 2.66,
            decoration: const BoxDecoration(
              color: sigInPageBg,
              borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  const Text(
                    "Let's Cook Good Food",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      wordSpacing: 1,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Sign in and make your first meal.",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, left: 30),
                    child: SignInButton(
                      Buttons.google,
                      onPressed: () {
                        print('Google sign-in button pressed');
                        context.read<AuthBloc>().add(SignInReqestEvent());
                      },
                      text: "Sign in with Google",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorUI(String errorMessage) {
    return Container(
      height: 100,
      width: 300,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const BottomNavigationPage()),
      (route) => false,
    );
  }
}
