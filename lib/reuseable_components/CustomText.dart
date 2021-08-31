import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/webview/web_screen.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double fontSize;

  final FontWeight fontWeight;

  final Color? color;
  final int maxLines;

  CustomText(
      {this.maxLines = 3,
      this.text,
      this.fontSize = 25.0,
      this.fontWeight = FontWeight.w700,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}

class CustomTextDate extends StatelessWidget {
  final String? text;
  final double fontSize;

  final FontWeight fontWeight;

  final Color? color;
  final int maxLines;

  CustomTextDate(
      {this.maxLines = 3,
      this.text,
      this.fontSize = 25.0,
      this.fontWeight = FontWeight.w700,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}

Widget listBuilder(api, {context}) => InkWell(
      onTap: () {
       navigateTo(context, WebScreen(api['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('${api['urlToImage']}'))),
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: '${api['title']}',
                      ),
                    ),
                    CustomTextDate(
                      text: '${api['publishedAt']}',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget customDivider() => Divider(
      height: 3,
      thickness: 3,
      indent: 10,
      endIndent: 10,
    );

Future<dynamic> navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
