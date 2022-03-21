


String imageFilter(String imageLink) {
  if (imageLink[0] == 'k') {
    return imageLink.replaceAll('k__image__', '');
  } else {
    return imageLink =
        "https://ucharteam-tourism.herokuapp.com/v1/media/" + imageLink;
  }
}
