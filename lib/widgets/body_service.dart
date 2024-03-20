import 'package:flutter/material.dart';
import 'package:rutsproj/utility/app_constant.dart';
import 'package:rutsproj/widgets/widget_image_assets.dart';
import 'package:rutsproj/widgets/widget_text.dart';

class BodyService extends StatefulWidget {
  const BodyService({super.key});

  @override
  State<BodyService> createState() => _BodyServiceState();
}

class _BodyServiceState extends State<BodyService> {
  var items = <Widget>[];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < AppConstant.titles.length; i++) {
      items.add(InkWell(onTap: AppConstant.tapFuncs[i],
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetImageAsset(
                path: AppConstant.paths[i],
              ),
              WidgetText(data: AppConstant.titles[i]),
            ],
          ),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemBuilder: (context, index) => items[index],
    );
  }
}
