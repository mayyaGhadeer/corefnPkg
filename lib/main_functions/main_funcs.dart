import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void logg(String logVal) {
  log(logVal);
}

void logRequestedUrl(String logText) {
  ///  commented 'log to disable'
  log(logText);

  ///  commented 'log to disable'
}

Future<void> navigateTo(BuildContext context, page) async {
  logg('navigateTo');
  Navigator.push(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: page,
      duration: const Duration(milliseconds: 400),
    ),
  );
}


Future<void> navigateToAndFinish(BuildContext context, page) async {
  Navigator.pushReplacement(
    context,
    PageTransition(
      type: PageTransitionType.bottomToTop,
      child: page,
      duration: const Duration(milliseconds: 0),
    ),
  );
}

Future<void> navigateToAndFinishUntil(BuildContext context, page) async {
  logg('navigateToAndFinishUntil');
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      ModalRoute.withName("/Home"));
}

// Future<void> navigateToWithNavBar(
//     BuildContext context, Widget page, routeName) async {
//   pushNewScreenWithRouteSettings(
//     context,
//     settings: RouteSettings(name: routeName),
//     screen: page,
//     withNavBar: true,
//     pageTransitionAnimation: PageTransitionAnimation.fade,
//   );
// }

// Future<void> navigateToWithoutNavBar(
//     BuildContext context, Widget page, routeName) async {
//   pushNewScreenWithRouteSettings(
//     context,
//     settings: RouteSettings(name: routeName),
//     screen: page,
//     withNavBar: false,
//     pageTransitionAnimation: PageTransitionAnimation.fade,
//   );
// }

// Future<void> navigateToWithoutNavBarAndFinishUntil(
//     BuildContext context, Widget page, routeName) async {
//   pushNewScreenWithRouteSettingsAndFinishUntil(
//     context,
//     settings: RouteSettings(name: routeName),
//     screen: page,
//     withNavBar: false,
//
//     pageTransitionAnimation: PageTransitionAnimation.fade,
//   );
// }

Future<void> myAlertDialog(BuildContext context, String title,
    {Widget? alertDialogContent,
    bool? dismissible,
    Color? alertDialogBackColor}) async {
  await showDialog<String>(
      context: context,
      useRootNavigator: false,
      barrierDismissible: dismissible ?? true,
      barrierColor: Colors.white.withOpacity(0),
      // barrierDismissible: false,
      builder: (BuildContext context) =>
          //     BlocConsumer<MainCubit, MainStates>(
          //   listener: (context, state) {},
          //   builder: (context, state) {
          //     return AlertDialog(
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(18.0.r))),
          //       title: Center(
          //           child: Text(
          //             'Request Item',
          //             style: mainStyle(18.0, FontWeight.w200,),
          //           )),
          //       content: Padding(
          //         padding: EdgeInsets.all(6.0.sp),
          //         child: SingleChildScrollView(
          //           child: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               ConditionalBuilder(
          //                   condition: imageFile != null,
          //                   builder: (ctx) {
          //                     if (state is ImageGotState) {
          //                       imageFile = state.imageFile!;
          //                       kbytes = state.kbytes;
          //                     }
          //                     return Container(
          //                       // color: Colors.red,
          //                       height: 200.h,
          //                       width: 200.h,
          //                       child: Image.file(
          //                         imageFile!,
          //                         width: 200.h,
          //                         height: 200.h,
          //                       ),
          //                     );
          //                   },
          //                   fallback: (ctx) => Container()),
          //               SizedBox(
          //                 height: 7.h,
          //               ),
          //               Form(
          //                 key: formKey,
          //                 child: SingleChildScrollView(
          //                   child: Column(
          //                     mainAxisSize: MainAxisSize.min,
          //                     children: [
          //                       InputItemInAlertDialogItem(
          //                         label: 'Brand name',
          //                         maxLines: 1,
          //                         controller: brandNameCont,
          //                         validate: (String? val) {
          //                           if (val!.isEmpty) {
          //                             return 'Please enter Brand name';
          //                           }
          //                         },
          //                       ),
          //                       SizedBox(
          //                         height: 10.h,
          //                       ),
          //                       InputItemInAlertDialogItem(
          //                         label: 'Shoes name',
          //                         maxLines: 1,
          //                         controller: shoesNameCont,
          //                         validate: (String? val) {
          //                           if (val!.isEmpty) {
          //                             return 'Please enter shoes name';
          //                           }
          //                         },
          //                       ),
          //                       SizedBox(
          //                         height: 10.h,
          //                       ),
          //                       // InputItemInAlertDialogItem(
          //                       //   label: 'Email',
          //                       //   maxLines: 1,
          //                       //   controller: emailCont,
          //                       //   validate: (String? val) {
          //                       //     if (val!.isEmpty) {
          //                       //       return 'Please enter your email';
          //                       //     }
          //                       //   },
          //                       // ),
          //                       SizedBox(
          //                         height: 10.h,
          //                       ),
          //                       DefaultButtonWithIcon(
          //                           borderRad: 24.0,
          //                           titleSize: 12.0,
          //                           onClick: () {
          //                             pickImage();
          //                           },
          //                           title: 'Upload image',
          //                           iconPath:
          //                           'assets/images/account/Group 263.png'),
          //                       SizedBox(
          //                         height: 15.h,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       actions: <Widget>[
          //         TextButton(
          //           onPressed: () {
          //             logg('after cancel clear cached image');
          //             imageFile = null;
          //             Navigator.pop(context, 'Cancel');
          //           },
          //           child: const Text('Cancel'),
          //         ),
          //         state is SendingFeedbackState?LinearProgressIndicator():
          //         TextButton(
          //           onPressed: () {
          //             if (formKey.currentState!.validate()) {
          //               if (imageFile != null) {
          //                 logg('file size is: ' + kbytes.toString());
          //                 logg('Brand name: ' + brandNameCont.text);
          //                 logg('Shoes name: ' + shoesNameCont.text);
          //                 logg('Email: ' + emailCont.text);
          //
          //                 if (kbytes! < 20480) {
          //                   logg('image size ok');
          //
          //                   String imageExtension = imageFile!.path
          //                       .substring((imageFile!.path.length) - 4);
          //                   logg('image extension:' + imageExtension);
          //
          //                   if (imageExtension == '.jpg' ||
          //                       imageExtension == '.png' ||
          //                       imageExtension == '.gif' ||
          //                       imageExtension == 'jpeg' ||
          //                       imageExtension == '.svg') {
          //                     logg('image extension accepted');
          //                     logg('sending file now');
          //
          //
          //                     ///////////////////////////////need modify
          //
          //                     requestItemPst(
          //                       brandName: brandNameCont.text,
          //                       shoeName: shoesNameCont.text,
          //                       imageFile: imageFile!,
          //                       context: context,
          //                     );
          //
          //
          //                   }
          //                   logg('after sending file');
          //                   imageFile = null;
          //                 }
          //               }
          //             }
          //           },
          //           //add Send logic
          //           child: const Text('Send'),
          //         ),
          //       ],
          //     );
          //   },
          // ))
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: AlertDialog(
              backgroundColor: alertDialogBackColor ?? null,
              title: Center(
                  child: Text(
                title,
                style: mainStyle(
                  18.0,
                  FontWeight.w200,
                ),
              )),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18.0))),
              content: alertDialogContent,
            ),
          ));
  // emit(MainChangeBottomNavState());
}

String replaceFlutterColorWithHexValue(Color color) {
  return color.value
      .toRadixString(16)
      .padLeft(6, '0')
      .toUpperCase()
      .toString()
      .replaceRange(0, 2, '#');
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

String? getErrorMessageFromErrorJsonResponse(dynamic error) {
  if (error.response == null) {
    return 'Check your internet connection';
  } else {
    return (json.decode(error.response.toString())["message"]).toString();
  }
}

// void showErrorStateSnackBar(BuildContext context, state, {String? text}) {
//   viewMySnackBar(
//       context,
//       state.error != null ? state.error.toString() : text ?? 'unknown error',
//       '',
//       () {});
// }
//
// void handleResourceType(BuildContext context, String? resourceType,
//     String? resourceId, String? url) {
//   if (resourceType == 'category') {
//     navigateToWithNavBar(
//         context,
//         CategoryDetailedLayout(
//           categoryId: resourceId!,
//         ),
//         CategoryDetailedLayout.routeName);
//   } else if (resourceType == 'product') {
//     ProductDetailsCubit.get(context).changeFirstRunVal(true);
//     navigateToWithNavBar(
//         context,
//         ProductDetailsLayout(
//           productId: resourceId.toString(),
//         ),
//         ProductDetailsLayout.routeName);
//   } else {
//     logg('this resource type not handled');
//   }
// }
//
// void loginRequiredSnackBar(BuildContext context) {
//   var localizationStrings = AppLocalizations.of(context);
//   viewMySnackBar(
//       context,
//       localizationStrings!.loginRequired,
//       localizationStrings.login,
//       () => pushNewScreenLayout(context, SignInScreen(), false));
// }

void viewMySnackBar(
    BuildContext context, String text, String actionLabel,String defaultLabel, Function() action,
    {Color? customColor}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    elevation: 2.0,
    backgroundColor: customColor ?? Colors.black.withOpacity(0.8),
    padding: EdgeInsets.only(bottom: 7),
    content: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Text(
        text,
        style: mainStyle(14.0, FontWeight.w600, color: Colors.white),
      ),
    ),
    action: actionLabel == ''
        ? SnackBarAction(
            label: defaultLabel,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          )
        : SnackBarAction(
            label: actionLabel,
            onPressed: action,
          ),
  ));
}

// auth functions
// Future<void> userAuthAndSaveAndNavigatee(
//     Response<dynamic> value, BuildContext context) async {
//   //add navigate
//   UserModel userSignUpModel;
//   userSignUpModel = UserModel.fromJson(value.data);
//   saveCacheToken(userSignUpModel.data!.token);
//   saveCacheName(userSignUpModel.data!.user!.fName! +
//       ' ' +
//       userSignUpModel.data!.user!.lName!);
//   saveCacheEmail(userSignUpModel.data!.user!.email);
//   // CacheHelper.saveData(key: 'name', value: userSignUpModel.data!.user!.fName!+' '+userSignUpModel.data!.user!.lName!);
//   // CacheHelper.saveData(key: 'email', value: userSignUpModel.data!.user!.email);
//   // logg(userSignUpModel.data!.user!.name.toString() + ' LoggedIn');
//   logg(CacheHelper.getData(key: 'token') + '\n Saved to cache');
//
//   isUserAuth(userSignUpModel.data!.token.toString());
//
//   //
//   // SplashCubit.get(context).getConfig();
//   // SplashCubit.get(context).getAddresses();
//
//   navigateToWithoutNavBar(
//       context, const MainAppMaterialApp(), MainLayout.routeName);
//
//   //should navigate to MainLayout
// }

// Future<bool> isUserAuthh(String token) async {
//   bool isAuth = false;
//   UserInfoModel? userInfoModel;
//
//   await MainDioHelper.getData(url: userInfoEnd, token: token).then((value) {
//     logg('Saving userInfo to model');
//
//     logg(value.data['data']['email'].toString());
//     try {
//       userInfoModel = UserInfoModel.fromJson(value.data);
//       logg('userInfo Saved to model: ' + userInfoModel.toString());
//     } catch (error) {
//       logg('error is: #@' + error.toString());
//     }
//     // try {
//     //   userInfoAllDetails = UserInfoModel.fromJson(value.data);
//     //   logg('userInfo Saved to model');
//     // } catch (error) {
//     //   logg('error is: #@' + error.toString());
//     // }
//
//     if (userInfoModel != null) {
//       if (userInfoModel!.data!.email!.length > 2) {
//         logg('token is authorized');
//         // if (userInfoAllDetails != null) {
//         //   savePayoutCachedValues(
//         //       [userInfoAllDetails.data!.payoutInfo!.bankName.toString(),
//         //         userInfoAllDetails.data!.payoutInfo!.holderName.toString(),
//         //         userInfoAllDetails.data!.payoutInfo!.iban.toString(),
//         //         userInfoAllDetails.data!.payoutInfo!.accountNumber.toString(),
//         //       ]
//         //   );
//         //   // [0]: bank name
//         //   // [1]: holder name
//         //   // [2]: iban
//         //   // [3]: account Number
//         // }
//         isAuth = true;
//       }
//     }
//   }).catchError((error) {
//     logg('an error occured');
//     logg(error.toString());
//   });
//
//   return isAuth;
// }

bool isUserSignedIn(String? token) {
  if (token != null) {
    return true;
  }
  return false;
}
TextStyle mainStyle(double size, weight,
    {Color? color,TextDecoration? decoration, FontStyle? fontStyle, String? fontFamily,double? textHeight}) {
  return TextStyle(
    fontFamily: fontFamily ?? 'Tajawal',
    fontSize: size,
    fontWeight: weight,
    color: color??Colors.black,
    decoration: decoration,
    fontStyle: fontStyle,
    height:textHeight?? 1.2,
    // wordSpacing: 4.0

  );


}