import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/services/git_service.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildColumn(context),
      ),
    );
  }

  ElevatedButtonWidget _createGit() => ElevatedButtonWidget(
        onPressed: () {
          Git git = Git(
              image: ImageChooser.imageList[0],
              languages: ['uz, en, tr'],
              tell: ['+ 998 99 999 99 99']);
          GitService.createNewGit(git);
        },
        label: "Create Git",
      );

  Column _buildColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _imageShow(context),
        TextButton(
          child: const Text('hotel register'),
          onPressed: () {
            print('hotel register bosildi');
            if (ImageChooser.imageList.isNotEmpty) {
              HotelService.createNewHotel(
                Hotel(
                    name: 'Hotel test',
                    city: 'tashkent',
                    tell: ['+9989777777'],
                    informUz: 'inform uz',
                    informEn: 'inform en',
                    informRu: 'inform ru',
                    karta: 'http://google.maps/tashkent',
                    site: 'http://site.uz',
                    categoryId: '1991edea-7d4a-49fb-b627-79b777cf54ae',
                    media: ImageChooser.imageList),
              );
            } else {
              print(ImageChooser.imageList.toString());
            }
          },
        ),
        TextButton(
          onPressed: () async {
            await GitService().addRatingToGit(
                gitId: "06d4e2b3-17c1-4ca1-8eb8-92f00e9112f9", rate: 5);
          },
          child: Text('add rate to git'),
        ),
        TextButton(
          onPressed: () async {},
          child: Text('fetch gits by city'),
        ),

        _createGit(),
      ],
    );
  }

  Column _imageShow(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              ImageChooser.chooseImage();
            },
            icon: const Icon(Icons.add_a_photo)),
        if (ImageChooser.imageList.isNotEmpty)
          Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            color: Colors.grey.shade200,
            child: ListView.builder(
              itemCount: ImageChooser.imageList.length,
              itemBuilder: (context, index) {
                var image = ImageChooser.imageList[index];
                print(image);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: Image.file(File(image), fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
