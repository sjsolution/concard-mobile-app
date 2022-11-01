import 'package:concard/Constants/colors.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import 'package:concard/Constants/images.dart';
import 'package:flutter_svg/flutter_svg.dart';

loaderWidget(BuildContext? context, Size? size) {
  context!.read<AppProvider>().isLoading!
      ? Loader(
          size: size!,
        )
      // showDialog(
      //         barrierDismissible: false,
      //         context: context,
      //         builder: (context) {
      //           return Container(
      //             alignment: Alignment.center,
      //             height: size!.height * .06,
      //             width: size.width,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               // color:Colors.white
      //             ),
      //             child: SpinKitDualRing(color: primarygreen),
      //           );
      //         })
      : const SizedBox();
}

class Loader extends StatefulWidget {
  const Loader({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<Loader> createState() => _Loader();
}

class _Loader extends State<Loader> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return context.read<AppProvider>().isLoading!
        ? Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );
              },
              child: SvgPicture.asset(
                con_icon,
                height: widget.size.height * 0.08,
              ),
            ),
          )
        : SizedBox();
  }
}

// class _FooPageState with SingleTickerProviderStateMixin {
//   late final AnimationController _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _controller,
//           builder: (_, child) {
//             return Transform.rotate(
//               angle: _controller.value * 2 * math.pi,
//               child: child,
//             );
//           },
//           child: FlutterLogo(size: 200),
//         ),
//       ),
//     );
//   }
// }
