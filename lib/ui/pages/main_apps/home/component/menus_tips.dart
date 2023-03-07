// ignore_for_file: prefer_const_constructors

import 'package:money_qu/utils/my_import.dart';

class MenusTipsPage extends StatelessWidget {
  final String title, imgUrl, url;

  const MenusTipsPage({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(url)) {
          launch(url);
        }  
      },
      child: Container(
        width: 155.w,
        height: 176.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20).r,
          color: MyColors.white,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20).r,
              ),
              child: Image.asset(
                imgUrl,
                fit: BoxFit.cover,
                width: 155.w,
                height: 110.h,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12).r,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontFamily: Font.poppinsMedium,
                  fontSize: 14.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
