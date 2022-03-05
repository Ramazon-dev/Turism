import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/models/restaurant_model.dart';
import 'package:mobileapp/services/git_service.dart';
import 'package:mobileapp/services/restaurant_service.dart';

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
            city: 'tashkent',
            informEn: 'Enlish',
            informRu: 'Russian',
            informUz: 'Uzbek',
            price: '150',
            reyting: 4,
            // username: 'newgit',
            users: 5,
            image: ImageChooser.imageList[0],
            languages: ['uz, en, tr'],
            tell: ['+ 998 99 999 99 99', '1345678'],
          );
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
          child: const Text('restaurant register'),
          onPressed: () {
            if (ImageChooser.imageList.isNotEmpty) {
              RestaurantService.createNewRestaurant(
                Restaurant(
                    name: 'restaurant test',
                    city: 'toshkent',
                    tell: ['+9989777777', '7777'],
                    informUz: 'inform uz',
                    informEn: 'inform en',
                    informRu: 'inform ru',
                    karta: 'http://google.maps/tashkent',
                    site: 'http://site.uz',
                    category: '1991edea-7d4a-49fb-b627-79b777cf54ae',
                    medias: ImageChooser.imageList,
                    ),
              );
            } else {
              print(ImageChooser.imageList.toString());
            }
          },
        ),
        TextButton(
          onPressed: () async {
            await RestaurantService()
                .deleteRestaurant(restaurantId: "b98742f2-552b-4b7a-b910-235d0d3ad2a2");
          },
          child: const Text('delete restaurant'),
        ),
         TextButton(
          onPressed: () async {
            await RestaurantService()
                .fetchRestaurantByCity( "toshkent");
          },
          child: const Text('fetch restaurant by city'),
        ),
        TextButton(
          onPressed: () async {
            await GitService.updateGitData(
              Git(
                image: ImageChooser.imageList[0],
                languages: ['eu', 'kz'],
                tell: ['111', '222'],
                id: 'a04b86bc-a19c-4d8e-91c5-b01a902b0276',
                city: 'toshkent',
                informEn: 'edited',
                informRu: 'edited',
                informUz: 'edited',
                price: '5000',                
              ),
            );
          },
          child: const Text('update git data'),
        ),

        TextButton(
          onPressed: () async {
            await GitService.updateGitImage(
              gitId: "a04b86bc-a19c-4d8e-91c5-b01a902b0276",
                gitImage: ImageChooser.imageList.first,
            );
          },
          child: const Text('update git image'),
        ),
        TextButton(
          onPressed: () async {
            GitService.fetchGitComments(
                gitId: '7a04881a-d759-4b16-8008-8cab1c9881bd');
          },
          child: Text('fetch gits comments'),
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
            height: 300,
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
