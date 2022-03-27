import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/data/app_data.dart';
import 'package:mobileapp/models/obekt_model.dart';
import 'package:mobileapp/widgets/images_page_view.dart';
import 'package:mobileapp/widgets/rating_bar_widget.dart';
import 'package:share_plus/share_plus.dart';

class ObjectDetailsPage extends StatefulWidget {
  final Obekt place;

  const ObjectDetailsPage({Key? key, required this.place}) : super(key: key);

  @override
  State<ObjectDetailsPage> createState() => _ObjectDetailsPageState();
}

class _ObjectDetailsPageState extends State<ObjectDetailsPage> {
  late Obekt _place;

  @override
  initState() {
    super.initState();
    _place = widget.place;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: _onShareButtonPressed,
              icon: const Icon(CupertinoIcons.share)),
        ],
      ),
      floatingActionButton: _commentButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getHeight(410),
              width: getWidth(375),
              child: ImagesPageView(imageList: _place.media!),
            ),
            Padding(
              padding: MyEdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBarWidget(
                    rating: _place.reyting!.toDouble(),
                    users: _place.users!,
                  ),
                  MySizedBox(height: 4.0),
                  Text(
                    widget.place.showInfo(context.locale.languageCode),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTextStyle.medium(size: 18.0),
                  ),
                  MySizedBox(height: 17.0),
                  _buildLink(AppIcons.call, widget.place.tell ?? '',
                      'tel:${widget.place.tell.toString().replaceAll('-', '')}',
                      labelColor: AppColors.black),
                  MySizedBox(height: 10.0),
                  _buildLink(
                    AppIcons.location,
                    'Расположение на карте',
                    widget.place.karta!,
                    iconColor: AppColors.red,
                  ),
                  MySizedBox(height: 10.0),
                  _buildLink(AppIcons.link, _place.site.toString(),
                      _place.site.toString()),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getHeight(9.5)),
                    child: Divider(
                      thickness: getWidth(1),
                    ),
                  ),
                  Text(
                    widget.place.showInfo(context.locale.languageCode),
                    style: AppTextStyle.regular(height: 2.1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onShareButtonPressed() async {
    String name = widget.place.nameEn!;
    String phone = widget.place.tell!;
    String text =
        '🗺 $name \n📞 $phone \n📱 Install App: ${AppData.playStoreLink}';
    await Share.share(text);
  }

  Row _buildLink(
    String assetIcon,
    String label,
    String link, {
    Color iconColor = AppColors.black,
    Color labelColor = AppColors.linkColor,
  }) {
    return Row(
      children: [
        SvgPicture.asset(assetIcon, height: getHeight(15.0), color: iconColor),
        MySizedBox(width: 15.0),
        UrlTextWidget(text: label, url: link, color: labelColor)
      ],
    );
  }

  FloatingActionButton _commentButton() => FloatingActionButton(
        onPressed: _onCommentButtonPressed,
        backgroundColor: AppColors.black,
        child: SvgPicture.asset(AppIcons.comment),
      );

  void _onCommentButtonPressed() {
    showModalBottomSheet(
      context: context,
      builder: (_) => CommentListDialog(headers: {'object_id': _place.id!}),
    );
  }
}
