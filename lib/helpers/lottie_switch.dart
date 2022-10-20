String setLottieImage(id) {
  int now = DateTime.now().hour;
  String image = '';

  switch (id) {
    case 200:
      if (now >= 6 && now <= 18) {
        image = 'assets/images/lottie/weather_day_thunderstorm.json';
      } else {
        image = 'assets/images/lottie/weather_night_thunderstorm.json';
      }
      break;
    case 500:
      if (now >= 6 && now <= 18) {
        image = 'assets/images/lottie/day_shower_rains.json';
      } else {
        image = 'assets/images/lottie/night_shower_rains.json';
      }
      break;

    case 800:
      if (now >= 6 && now <= 18) {
        image = 'assets/images/lottie/day_clear_sky.json';
      } else {
        image = 'assets/images/lottie/night_clear_sky.json';
      }
      break;
    case 801:
      if (now >= 6 && now <= 18) {
        image = 'assets/images/lottie/day_few_clouds.json';
      } else {
        image = 'assets/images/lottie/night_few_clouds.json';
      }
      break;
    case 802:
      if (now >= 6 && now <= 18) {
        image = 'assets/images/lottie/day_scattered_clouds.json';
      } else {
        image = 'assets/images/lottie/night_scattered_clouds.json';
      }
      break;
    case 803:
      if (now >= 6 && now <= 18) {
        image = 'assets/images/lottie/day_broken_clouds.json';
      } else {
        image = 'assets/images/lottie/night_broken_clouds.json';
      }
      break;
    case 804:
      if (now >= 6 && now <= 18) {
        image = 'assets/images/lottie/day_broken_clouds.json';
      } else {
        image = 'assets/images/lottie/night_broken_clouds.json';
      }
      break;
    default:
      {
        image = 'assets/images/lottie/day_clear_sky.json';
      }
  }
  return image;
}
