import 'package:get/get.dart';
import 'package:radio_station/model/music_data_model.dart';

/// THIS CLASS CONTAINS DATA OF MUSIC TO DISPLAY IN MANY PAGE...
class MusicDataController extends GetxController {
  /// THIS LIST IS USED TO STORE ALL DATA OF MUSIC...
  final List<MusicDataModel> popularBroadcastListData = [
    MusicDataModel(
      albumName: "Techno Music",
      albumMaker: "Celeste Headlee",
      musicPortfolioImage:
          "https://assets-2.placeit.net/smart_templates/9f870c075d9319fe7e7d5164fab55da9/assets/il0loty38e7eentb819nmxe8vk692alb.jpg",
      musicArtistName: "Dyno Jems",
      musicName: "Shade",
      musicSubTitle: "Techno DJ Album Cover",
      isFavorite: true,
    ),
    MusicDataModel(
      albumName: "Record Labels",
      albumMaker: "XYZ Studio Label",
      musicPortfolioImage:
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/artistic-album-cover-design-template-d12ef0296af80b58363dc0deef077ecc_screen.jpg?ts=1561488440",
      musicArtistName: "Ryan Jems",
      musicName: "Pain",
      musicSubTitle: "Techno DJ Album Cover",
      isFavorite: true,
    ),
    MusicDataModel(
      albumName: "Awake Ap",
      albumMaker: "Angus Macrae",
      musicPortfolioImage:
          "https://i.pinimg.com/originals/41/a0/59/41a0593ec5c6562e838f349aba5ae9ef.jpg",
      musicArtistName: "Ryan Jems",
      musicName: "Awake",
      musicSubTitle: "Angus DJ",
      isFavorite: false,
    ),
    MusicDataModel(
      albumName: "Techno Music",
      albumMaker: "Celeste Headlee",
      musicPortfolioImage:
          "https://assets-2.placeit.net/smart_templates/9f870c075d9319fe7e7d5164fab55da9/assets/il0loty38e7eentb819nmxe8vk692alb.jpg",
      musicArtistName: "Dyno Jems",
      musicName: "Shade",
      musicSubTitle: "Techno DJ Album Cover",
      isFavorite: false,
    ),
    MusicDataModel(
      albumName: "Record Labels",
      albumMaker: "XYZ Studio Label",
      musicPortfolioImage:
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/artistic-album-cover-design-template-d12ef0296af80b58363dc0deef077ecc_screen.jpg?ts=1561488440",
      musicArtistName: "Ryan Jems",
      musicName: "Pain",
      musicSubTitle: "Techno DJ Album Cover",
      isFavorite: false,
    ),
    MusicDataModel(
      albumName: "Awake Ap",
      albumMaker: "Angus Macrae",
      musicPortfolioImage:
          "https://i.pinimg.com/originals/41/a0/59/41a0593ec5c6562e838f349aba5ae9ef.jpg",
      musicArtistName: "Ryan Jems",
      musicName: "Awake",
      musicSubTitle: "Angus DJ",
      isFavorite: true,
    ),
    MusicDataModel(
      albumName: "Techno Music",
      albumMaker: "Celeste Headlee",
      musicPortfolioImage:
          "https://assets-2.placeit.net/smart_templates/9f870c075d9319fe7e7d5164fab55da9/assets/il0loty38e7eentb819nmxe8vk692alb.jpg",
      musicArtistName: "Dyno Jems",
      musicName: "Shade",
      musicSubTitle: "Techno DJ Album Cover",
      isFavorite: true,
    ),
    MusicDataModel(
      albumName: "Record Labels",
      albumMaker: "XYZ Studio Label",
      musicPortfolioImage:
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/artistic-album-cover-design-template-d12ef0296af80b58363dc0deef077ecc_screen.jpg?ts=1561488440",
      musicArtistName: "Ryan Jems",
      musicName: "Pain",
      musicSubTitle: "Techno DJ Album Cover",
      isFavorite: true,
    ),
    MusicDataModel(
      albumName: "Awake Ap",
      albumMaker: "Angus Macrae",
      musicPortfolioImage:
          "https://i.pinimg.com/originals/41/a0/59/41a0593ec5c6562e838f349aba5ae9ef.jpg",
      musicArtistName: "Ryan Jems",
      musicName: "Awake",
      musicSubTitle: "Angus DJ",
      isFavorite: false,
    ),
    MusicDataModel(
      albumName: "Techno Music",
      albumMaker: "Celeste Headlee",
      musicPortfolioImage:
          "https://assets-2.placeit.net/smart_templates/9f870c075d9319fe7e7d5164fab55da9/assets/il0loty38e7eentb819nmxe8vk692alb.jpg",
      musicArtistName: "Dyno Jems",
      musicName: "Shade",
      musicSubTitle: "Techno DJ Album Cover",
      isFavorite: false,
    ),
    MusicDataModel(
      albumName: "Record Labels",
      albumMaker: "XYZ Studio Label",
      musicPortfolioImage:
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/artistic-album-cover-design-template-d12ef0296af80b58363dc0deef077ecc_screen.jpg?ts=1561488440",
      musicArtistName: "Ryan Jems",
      musicName: "Pain",
      musicSubTitle: "Techno DJ Album Cover",
      isFavorite: false,
    ),
    MusicDataModel(
      albumName: "Awake Ap",
      albumMaker: "Angus Macrae",
      musicPortfolioImage:
          "https://i.pinimg.com/originals/41/a0/59/41a0593ec5c6562e838f349aba5ae9ef.jpg",
      musicArtistName: "Ryan Jems",
      musicName: "Awake",
      musicSubTitle: "Angus DJ",
      isFavorite: true,
    ),
    MusicDataModel(
      albumName: "Techno Music",
      albumMaker: "Celeste Headlee",
      musicPortfolioImage:
          "https://assets-2.placeit.net/smart_templates/9f870c075d9319fe7e7d5164fab55da9/assets/il0loty38e7eentb819nmxe8vk692alb.jpg",
      musicArtistName: "Dyno Jems",
      musicName: "Shade",
      musicSubTitle: "Techno DJ Album Cover",
      isFavorite: true,
    ),
    MusicDataModel(
      albumName: "Record Labels",
      albumMaker: "XYZ Studio Label",
      musicPortfolioImage:
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/artistic-album-cover-design-template-d12ef0296af80b58363dc0deef077ecc_screen.jpg?ts=1561488440",
      musicArtistName: "Ryan Jems",
      musicName: "Pain",
      musicSubTitle: "Techno DJ Album Cover",
      isFavorite: true,
    ),
    MusicDataModel(
      albumName: "Awake Ap",
      albumMaker: "Angus Macrae",
      musicPortfolioImage:
          "https://i.pinimg.com/originals/41/a0/59/41a0593ec5c6562e838f349aba5ae9ef.jpg",
      musicArtistName: "Ryan Jems",
      musicName: "Awake",
      musicSubTitle: "Angus DJ",
      isFavorite: false,
    ),
    MusicDataModel(
      albumName: "Techno Music",
      albumMaker: "Celeste Headlee",
      musicPortfolioImage:
          "https://assets-2.placeit.net/smart_templates/9f870c075d9319fe7e7d5164fab55da9/assets/il0loty38e7eentb819nmxe8vk692alb.jpg",
      musicArtistName: "Dyno Jems",
      musicName: "Shade",
      musicSubTitle: "Techno DJ Album Cover",
      isFavorite: false,
    ),
    MusicDataModel(
      albumName: "Record Labels",
      albumMaker: "XYZ Studio Label",
      musicPortfolioImage:
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/artistic-album-cover-design-template-d12ef0296af80b58363dc0deef077ecc_screen.jpg?ts=1561488440",
      musicArtistName: "Ryan Jems",
      musicName: "Pain",
      musicSubTitle: "Techno DJ Album Cover",
      isFavorite: false,
    ),
    MusicDataModel(
      albumName: "Awake Ap",
      albumMaker: "Angus Macrae",
      musicPortfolioImage:
          "https://i.pinimg.com/originals/41/a0/59/41a0593ec5c6562e838f349aba5ae9ef.jpg",
      musicArtistName: "Ryan Jems",
      musicName: "Awake",
      musicSubTitle: "Angus DJ",
      isFavorite: true,
    ),
  ];
}
