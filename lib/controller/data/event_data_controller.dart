import 'package:get/get.dart';
import 'package:radio_station/model/event_data_model.dart';

/// THIS CLASS CONTAINS DATA OF EVENT SCREEN...
class EventDataController extends GetxController {
  /// THIS LIST CONTEINS DATA OF EVENTS SCREEN...
  final List<EventDataModel> eventDataList = [
    EventDataModel(
      eventName: "Disco Night",
      eventDescription:
          "DISCO FOR GROWN UPS is coming back to Leicester! Get ready to boogie the night away at the beautiful Devonshire place ballroom All your favourite 70s 80s and 90s disco soul and feel good pop classics.",
      eventImage:
          "https://tul.imgix.net/content/article/Hero_25.jpg?auto=format,compress&w=1200&h=630&fit=crop",
    ),
    EventDataModel(
      eventName: "Bachelour Party",
      eventDescription:
          "A bachelor party, also known as a stag weekend, stag do or stag party, or a buck's night is a party held for a man who is shortly to enter marriage. A stag night is usually planned by the groom's friend or brother, occasionally with the assistance of a bachelor party planning company.",
      eventImage:
          "https://i.pinimg.com/originals/e4/24/98/e424985a78dddfe33705c7faaa8c6af0.jpg",
    ),
    EventDataModel(
      eventName: "Birthday Party",
      eventDescription:
          "Ever since we were little, you’ve always been there for me. I’m so glad we’re still friends, and I bet that one day we’ll be sitting side-by-side in our rocking chairs at the nursing home laughing at all of our crazy times together.",
      eventImage:
          "https://www.bookmyballoons.in/wp-content/uploads/2019/03/birthday-party-organisers-in-bangalore.jpg",
    ),
    EventDataModel(
      eventName: "Hotel Opening Ceremony",
      eventDescription:
          "Announcing that you’re opening a new hotel presents a great opportunity for you to introduce yourself not only to the local community you’ll be doing business in, but also to your potential customers. Thus, you want the opening to be grand. That's where these hotel grand opening ideas come in.",
      eventImage:
          "https://bloximages.newyork1.vip.townnews.com/kdhnews.com/content/tncms/assets/v3/editorial/8/f3/8f3a7264-1ff6-11e8-8497-d7b26e419078/5a9c6afe059a9.image.jpg?resize=1200%2C828",
    ),
  ];

  /// THIS LIST CONTAINS DETAILS FOR ART EVENTS...
  static final List<EventDataModel> eventArtList = [
    EventDataModel(
      eventName: "ART Disco Night",
      eventDescription:
          "DISCO FOR GROWN UPS is coming back to Leicester! Get ready to boogie the night away at the beautiful Devonshire place ballroom All your favourite 70s 80s and 90s disco soul and feel good pop classics.",
      eventImage:
          "https://tul.imgix.net/content/article/Hero_25.jpg?auto=format,compress&w=1200&h=630&fit=crop",
    ),
    EventDataModel(
      eventName: "ART Bachelour Party",
      eventDescription:
          "A bachelor party, also known as a stag weekend, stag do or stag party, or a buck's night is a party held for a man who is shortly to enter marriage. A stag night is usually planned by the groom's friend or brother, occasionally with the assistance of a bachelor party planning company.",
      eventImage:
          "https://i.pinimg.com/originals/e4/24/98/e424985a78dddfe33705c7faaa8c6af0.jpg",
    ),
    EventDataModel(
      eventName: "ART Birthday Party",
      eventDescription:
          "Ever since we were little, you’ve always been there for me. I’m so glad we’re still friends, and I bet that one day we’ll be sitting side-by-side in our rocking chairs at the nursing home laughing at all of our crazy times together.",
      eventImage:
          "https://www.bookmyballoons.in/wp-content/uploads/2019/03/birthday-party-organisers-in-bangalore.jpg",
    ),
    EventDataModel(
      eventName: "ART Hotel Opening Ceremony",
      eventDescription:
          "Announcing that you’re opening a new hotel presents a great opportunity for you to introduce yourself not only to the local community you’ll be doing business in, but also to your potential customers. Thus, you want the opening to be grand. That's where these hotel grand opening ideas come in.",
      eventImage:
          "https://bloximages.newyork1.vip.townnews.com/kdhnews.com/content/tncms/assets/v3/editorial/8/f3/8f3a7264-1ff6-11e8-8497-d7b26e419078/5a9c6afe059a9.image.jpg?resize=1200%2C828",
    ),
  ];

  /// THIS LIST CONTAINS DETAILS FOR CONCERTS EVENTS...
  static final List<EventDataModel> eventConcertList = [
    EventDataModel(
      eventName: "CONCERTS Disco Night",
      eventDescription:
          "DISCO FOR GROWN UPS is coming back to Leicester! Get ready to boogie the night away at the beautiful Devonshire place ballroom All your favourite 70s 80s and 90s disco soul and feel good pop classics.",
      eventImage:
          "https://tul.imgix.net/content/article/Hero_25.jpg?auto=format,compress&w=1200&h=630&fit=crop",
    ),
    EventDataModel(
      eventName: "CONCERTS Bachelour Party",
      eventDescription:
          "A bachelor party, also known as a stag weekend, stag do or stag party, or a buck's night is a party held for a man who is shortly to enter marriage. A stag night is usually planned by the groom's friend or brother, occasionally with the assistance of a bachelor party planning company.",
      eventImage:
          "https://i.pinimg.com/originals/e4/24/98/e424985a78dddfe33705c7faaa8c6af0.jpg",
    ),
    EventDataModel(
      eventName: "CONCERTS Birthday Party",
      eventDescription:
          "Ever since we were little, you’ve always been there for me. I’m so glad we’re still friends, and I bet that one day we’ll be sitting side-by-side in our rocking chairs at the nursing home laughing at all of our crazy times together.",
      eventImage:
          "https://www.bookmyballoons.in/wp-content/uploads/2019/03/birthday-party-organisers-in-bangalore.jpg",
    ),
    EventDataModel(
      eventName: "CONCERTS Hotel Opening Ceremony",
      eventDescription:
          "Announcing that you’re opening a new hotel presents a great opportunity for you to introduce yourself not only to the local community you’ll be doing business in, but also to your potential customers. Thus, you want the opening to be grand. That's where these hotel grand opening ideas come in.",
      eventImage:
          "https://bloximages.newyork1.vip.townnews.com/kdhnews.com/content/tncms/assets/v3/editorial/8/f3/8f3a7264-1ff6-11e8-8497-d7b26e419078/5a9c6afe059a9.image.jpg?resize=1200%2C828",
    ),
  ];

  /// THIS LIST CONTAINS DETAILS OF EVENTS...
  static final List<EventDataModel> eventEventsList = [
    EventDataModel(
      eventName: "EVENTS Disco Night",
      eventDescription:
          "DISCO FOR GROWN UPS is coming back to Leicester! Get ready to boogie the night away at the beautiful Devonshire place ballroom All your favourite 70s 80s and 90s disco soul and feel good pop classics.",
      eventImage:
          "https://tul.imgix.net/content/article/Hero_25.jpg?auto=format,compress&w=1200&h=630&fit=crop",
    ),
    EventDataModel(
      eventName: "EVENTS Bachelour Party",
      eventDescription:
          "A bachelor party, also known as a stag weekend, stag do or stag party, or a buck's night is a party held for a man who is shortly to enter marriage. A stag night is usually planned by the groom's friend or brother, occasionally with the assistance of a bachelor party planning company.",
      eventImage:
          "https://i.pinimg.com/originals/e4/24/98/e424985a78dddfe33705c7faaa8c6af0.jpg",
    ),
    EventDataModel(
      eventName: "EVENTS Birthday Party",
      eventDescription:
          "Ever since we were little, you’ve always been there for me. I’m so glad we’re still friends, and I bet that one day we’ll be sitting side-by-side in our rocking chairs at the nursing home laughing at all of our crazy times together.",
      eventImage:
          "https://www.bookmyballoons.in/wp-content/uploads/2019/03/birthday-party-organisers-in-bangalore.jpg",
    ),
    EventDataModel(
      eventName: "EVENTS Hotel Opening Ceremony",
      eventDescription:
          "Announcing that you’re opening a new hotel presents a great opportunity for you to introduce yourself not only to the local community you’ll be doing business in, but also to your potential customers. Thus, you want the opening to be grand. That's where these hotel grand opening ideas come in.",
      eventImage:
          "https://bloximages.newyork1.vip.townnews.com/kdhnews.com/content/tncms/assets/v3/editorial/8/f3/8f3a7264-1ff6-11e8-8497-d7b26e419078/5a9c6afe059a9.image.jpg?resize=1200%2C828",
    ),
  ];

  /// THIS LIST CONTAINS DATA OF FESTIVALS EVENTS...
  static final List<EventDataModel> eventFestivalsList = [
    EventDataModel(
      eventName: "FESTIVALS Disco Night",
      eventDescription:
          "DISCO FOR GROWN UPS is coming back to Leicester! Get ready to boogie the night away at the beautiful Devonshire place ballroom All your favourite 70s 80s and 90s disco soul and feel good pop classics.",
      eventImage:
          "https://tul.imgix.net/content/article/Hero_25.jpg?auto=format,compress&w=1200&h=630&fit=crop",
    ),
    EventDataModel(
      eventName: "FESTIVALS Bachelour Party",
      eventDescription:
          "A bachelor party, also known as a stag weekend, stag do or stag party, or a buck's night is a party held for a man who is shortly to enter marriage. A stag night is usually planned by the groom's friend or brother, occasionally with the assistance of a bachelor party planning company.",
      eventImage:
          "https://i.pinimg.com/originals/e4/24/98/e424985a78dddfe33705c7faaa8c6af0.jpg",
    ),
    EventDataModel(
      eventName: "FESTIVALS Birthday Party",
      eventDescription:
          "Ever since we were little, you’ve always been there for me. I’m so glad we’re still friends, and I bet that one day we’ll be sitting side-by-side in our rocking chairs at the nursing home laughing at all of our crazy times together.",
      eventImage:
          "https://www.bookmyballoons.in/wp-content/uploads/2019/03/birthday-party-organisers-in-bangalore.jpg",
    ),
    EventDataModel(
      eventName: "FESTIVALS Hotel Opening Ceremony",
      eventDescription:
          "Announcing that you’re opening a new hotel presents a great opportunity for you to introduce yourself not only to the local community you’ll be doing business in, but also to your potential customers. Thus, you want the opening to be grand. That's where these hotel grand opening ideas come in.",
      eventImage:
          "https://bloximages.newyork1.vip.townnews.com/kdhnews.com/content/tncms/assets/v3/editorial/8/f3/8f3a7264-1ff6-11e8-8497-d7b26e419078/5a9c6afe059a9.image.jpg?resize=1200%2C828",
    ),
  ];

  /// THIS LIST CONTAINS DETAILS OF KIDS EVENTS...
  static final List<EventDataModel> eventKidsList = [
    EventDataModel(
      eventName: "KIDS Disco Night",
      eventDescription:
          "DISCO FOR GROWN UPS is coming back to Leicester! Get ready to boogie the night away at the beautiful Devonshire place ballroom All your favourite 70s 80s and 90s disco soul and feel good pop classics.",
      eventImage:
          "https://tul.imgix.net/content/article/Hero_25.jpg?auto=format,compress&w=1200&h=630&fit=crop",
    ),
    EventDataModel(
      eventName: "KIDS Bachelour Party",
      eventDescription:
          "A bachelor party, also known as a stag weekend, stag do or stag party, or a buck's night is a party held for a man who is shortly to enter marriage. A stag night is usually planned by the groom's friend or brother, occasionally with the assistance of a bachelor party planning company.",
      eventImage:
          "https://i.pinimg.com/originals/e4/24/98/e424985a78dddfe33705c7faaa8c6af0.jpg",
    ),
    EventDataModel(
      eventName: "KIDS Birthday Party",
      eventDescription:
          "Ever since we were little, you’ve always been there for me. I’m so glad we’re still friends, and I bet that one day we’ll be sitting side-by-side in our rocking chairs at the nursing home laughing at all of our crazy times together.",
      eventImage:
          "https://www.bookmyballoons.in/wp-content/uploads/2019/03/birthday-party-organisers-in-bangalore.jpg",
    ),
    EventDataModel(
      eventName: "KIDS Hotel Opening Ceremony",
      eventDescription:
          "Announcing that you’re opening a new hotel presents a great opportunity for you to introduce yourself not only to the local community you’ll be doing business in, but also to your potential customers. Thus, you want the opening to be grand. That's where these hotel grand opening ideas come in.",
      eventImage:
          "https://bloximages.newyork1.vip.townnews.com/kdhnews.com/content/tncms/assets/v3/editorial/8/f3/8f3a7264-1ff6-11e8-8497-d7b26e419078/5a9c6afe059a9.image.jpg?resize=1200%2C828",
    ),
  ];

  /// THIS LIST CONTAINS DATA TO SHOW AVAILABLE EVENTS CATEGORY...
  static final List<String> eventCategoryList = [
    "All",
    "Art",
    "Concerts",
    "Events",
    "Festivals",
    "Kids",
  ];

  /// THIS LIST CONTAINS DATA OF ALL EVENTS MIX...
  static final List<EventDataModel> eventAllList =
      EventDataController.eventArtList +
          EventDataController.eventConcertList +
          EventDataController.eventEventsList +
          EventDataController.eventFestivalsList +
          EventDataController.eventKidsList;

  /// THIS LIST CONTAINS DATA OF ALL AVAILABLE CATEGORY DATA...
  static final List eventsList = [
    EventDataController.eventAllList,
    EventDataController.eventArtList,
    EventDataController.eventConcertList,
    EventDataController.eventEventsList,
    EventDataController.eventFestivalsList,
    EventDataController.eventKidsList
  ];

  /// THIS VARIABLE IS USED TO MANAGE SELECTED EVENT CATEGORY AND SHOW DATA REGARDING SELECTED EVENT CATEGORY
  int selectedEventCategoryIndex = 0;
  selectedEventCategoryIndexUpdate(int value, {bool reInit = false}) {
    selectedEventCategoryIndex = value;
    if (!reInit) update();
  }
}
