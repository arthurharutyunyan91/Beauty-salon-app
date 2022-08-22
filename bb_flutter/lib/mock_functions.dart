import 'package:flutter_app/model/appointment.dart';
import 'package:flutter_app/model/business_sale.dart';
import 'package:flutter_app/model/review.dart';
import 'package:flutter_app/model/staffer.dart';
import 'package:flutter_app/model/user.dart';
import 'package:flutter_app/util/strings.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'model/business.dart';
import 'model/service.dart';
import 'model/working_hour.dart';

createSalonAddList() => [
      BusinessSale(
        imageUrl:
            'http://auniquesalon.co.uk/wp-content/uploads/2014/01/cottingham-salon.jpg',
        name: 'A&G Salon',
        address: 'Address 1',
        cutName: 'Clipper Cut',
        oldPrice: 45,
        newPrice: 30,
      ),
      BusinessSale(
        imageUrl: 'https://mova.co.uk/files/2016/09/Mova.jpg',
        name: 'Central',
        address: 'Address 2',
        cutName: 'cut',
        oldPrice: 25,
        newPrice: 17,
      ),
      BusinessSale(
          imageUrl:
              'https://media-cdn.tripadvisor.com/media/photo-s/12/d9/4e/0f/salon.jpg',
          name: 'Salon 3',
          address: 'Address 3',
          cutName: 'Cid\'s Cut',
          oldPrice: 35,
          newPrice: 23)
    ];

createProfessionalList() => [
      Staffer(
        imageUrl:
            'https://www.couturehairdesign.com/uploads/2/6/5/2/26524431/5186700_orig.jpg',
        name: 'John',
        salon: 'A&D salon',
        profession: 'Hairdresser',
        info:
            'I let the clippers and razors do the talking,  as my cutting skills do the best job of helping me earn respect in the eyes of my customers and colleagues. ',
        portfolio: <String>[
          'https://www.menshairstylesnow.com/wp-content/uploads/2018/01/Best-New-Mens-Haircuts.jpg',
          'https://www.menshairstylestoday.com/wp-content/uploads/2016/09/Barbershop-Haircuts-Bald-Fade-with-Long-Slick-Back.jpg',
          'https://menhairstylesworld.com/wp-content/uploads/2019/04/16.-French-Crop-Haircut.jpg',
          'https://media.haircutinspiration.com/photos/20181204024137/Undercut-brush-Up-e1549945157897.jpg',
        ],
      ),
      Staffer(
        imageUrl:
            'https://image.shutterstock.com/image-photo/portrait-pretty-cheerful-casual-african-260nw-1422533438.jpg',
        name: 'Julia',
        salon: 'Central',
        profession: 'Neil master',
        info: null,
        portfolio: <String>[
          'https://brownshair.com/wp-content/uploads/2016/05/womans_hair.jpg',
          'https://i.pinimg.com/originals/34/e9/b5/34e9b519a7220d5d4640c728c7003a91.jpg',
          'https://img5.goodfon.com/wallpaper/nbig/8/ae/devushka-briunetka-kudriashki-profil-vzgliad.jpg'
        ],
      ),
      Staffer(
        imageUrl:
            'https://youthincmag.com/wp-content/uploads/2019/05/hone.style_.jpg',
        name: 'Adam',
        salon: 'Ten',
        profession: 'Designer',
        info: 'I let the clippers and razors do the talking',
        portfolio: <String>[
          'https://thenewmensstyle.com/wp-content/uploads/2019/02/Straight-hair.jpg',
          'https://myblogika.com/wp-content/uploads/2019/03/2019-Trending-hair-colors-and-styles-pin-now-read-now_23-1.jpg',
          'https://www.hushhair.com/wp-content/blogs.dir/162/files/Gents-Hair-Cuts%2C-Styles-Colours-at-HUSH-Hair-in-Birmingham/thumbs/thumbs_Barbering-at-Hush-Hair-Beauty-Salon-in-Birmingham.jpg',
        ],
      ),
      Staffer(
        imageUrl:
            'https://image.shutterstock.com/image-photo/portrait-cheerful-young-man-casual-260nw-1221463249.jpg',
        name: 'Bill',
        salon: 'USA Barber',
        profession: 'Hairdresser',
        info:
            'I let the clippers and razors do the talking,  as my cutting skills do the best ',
        portfolio: <String>[
          'https://i.pinimg.com/originals/11/46/22/114622a2f8dece8f0b2f5765fb614d76.jpg',
          'https://americancrew-assets1.netlify.com/images/00tallcollection/shavebeard1.jpg',
          'https://i.pinimg.com/originals/48/d2/b9/48d2b9fdae082ad42f39b09d0f8110bb.jpg',
        ],
      ),
      Staffer(
        imageUrl:
            'https://image.shutterstock.com/image-photo/portrait-pretty-cheerful-casual-african-260nw-1422533438.jpg',
        name: 'Anna',
        salon: 'Salon #1',
        profession: 'Make Up master',
        info: '',
        portfolio: <String>[
          'https://avalon.edu/wp-content/uploads/2013/05/shutterstock_118614265-e1513010930950.jpg',
          'https://philliprosado.com/wp-content/uploads/2018/10/Phillip-rosado-hair-stylist-portfolio-25.jpg',
          'http://beautylaunchpad.com/sites/default/files/migrated/20120528-Annemarie_Graf_02-073.jpg'
        ],
      ),
      Staffer(
        imageUrl:
            'https://www.beardsgaardbarbers.com/wp-content/uploads/2018/02/Portfolio-TA-20170909-Alls-Well-That-Ends-Well-01-1-400x400.jpg',
        name: 'Phillip',
        salon: 'Fill Barber',
        profession: 'Hairdresser',
        info:
            'I let the clippers and razors do the talking,  as my cutting skills do the best job of helping me earn respect in the eyes of my customers and colleagues. ',
        portfolio: <String>[
          'https://hairstylecamp.com/wp-content/uploads/bald-fade-with-beard-1.jpg',
          'http://www.rohitguglanii.com/wp-content/uploads/2019/04/50-creative-hair-designs-for-men-hairstyles-world-pleasant-pics-lovely-0.jpg',
          'https://www.tribecasalon.com/wp-content/uploads/2016/08/tribeca-portfolio-mens-7.jpg',
        ],
      ),
      Staffer(
        imageUrl:
            'https://www.midlandsderm.com/wp-content/uploads/2019/04/Rachel-R.-Person-760x760.jpg',
        name: 'Serenea',
        salon: 'A&D salon',
        profession: 'Make Up master',
        info:
            'I let the clippers and razors do the talking,  as my cutting skills do the best job of helping me earn respect in the eyes of my customers and colleagues. ',
        portfolio: <String>[
          'https://www.skysalonlincoln.com/wp-content/uploads/2016/10/portfolio-fi-2.jpg',
          'https://www.tribecasalon.com/wp-content/uploads/2016/08/tribeca-portfolio-womens-24.jpg',
          'https://www.cheveuxaventura.com/wp-content/uploads/2019/02/Modern-Hairstyle-on-Young-Woman-by-Mirela-Cheveux-Aventura-768x1024.jpeg'
        ],
      ),
    ];

getHairSalonList() => [
      'http://www.spabene.com/wp-content/uploads/2014/04/2.jpg',
      'https://d2zdpiztbgorvt.cloudfront.net/us/images/179472/logo_155594550987.jpeg',
      'https://upload.wikimedia.org/wikipedia/commons/b/b2/Hair_Salon_Stations.jpg',
      'https://www.eve-and-adam.com/wp-content/uploads/2019/06/IMG_3151-e1563446077822.jpg',
      'https://ae01.alicdn.com/kf/HTB1MuW.fCzqK1RjSZFLq6An2XXaP.jpg',
      'https://i.pinimg.com/originals/30/d8/93/30d8933f9c8886de201723a607c95952.jpg',
      'https://i.pinimg.com/originals/83/df/82/83df823817794a673b0c02120461787a.jpg',
      'https://www.americanbarber.com/pictures/nbanner11.jpg',
      'https://www.eve-and-adam.com/wp-content/uploads/2019/06/IMG_3151-e1563446077822.jpg',
      'https://www.headcurve.com/wp-content/uploads/2019/08/hair-salon-aug202019-min.jpg',
      'https://i.ytimg.com/vi/3u8TzC8Z87M/maxresdefault.jpg',
      'https://dcassetcdn.com/design_img/1266067/516204/516204_6584107_1266067_56d7ab3c_image.jpg',
      'https://dcassetcdn.com/design_img/1266067/516204/516204_6584107_1266067_56d7ab3c_image.jpg',
    ];

getNailSalonList() => [
      'https://ae01.alicdn.com/kf/HTB1iHI7lEUIL1JjSZFrq6z3xFXaM/Beibehang.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/51RXdQbPpSL.jpg',
      'http://www.spabene.com/wp-content/uploads/2014/04/2.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSMqmdEzHCeRi6jGSedVOi-B19c4dDpVj9p3Oe-9G-lGn6DVpg0',
      'https://cdn-img.instyle.com/sites/default/files/styles/684xflex/public/1449063149/120215-manicure-van-lead.jpg?itok=Ni4ti7Ka',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS9ITVCkdz7gSFiRSS-2cvGTqsKQEKC0QtAtyANDNsjpenFPsWi',
      'http://static-27.sinclairstoryline.com/resources/media/0b93efb0-75dd-4dbf-8a46-e437d9f7d1f3-large16x9_coatroom2.jpg?1490371489198',
      'https://i.pinimg.com/originals/30/d8/93/30d8933f9c8886de201723a607c95952.jpg',
      'https://www.mykioskey.com/wp-content/uploads/2017/11/3_%E5%89%AF%E6%9C%AC-720x360.jpg',
      'http://demo.koipy.com/images/upload/20150603/1465200373556e9b90e15e4.png',
      'https://s3-media4.fl.yelpcdn.com/bphoto/w0_6jBRYlRpc4OVRN5fxsA/o.jpg',
      'https://lh3.googleusercontent.com/CNROVxgegoN0gBXrFJNYyR2qlshPRCjJjeKypRLOYFCw0P1pWLNb93fbocQ-DBGTRYgwEPfAIA=w1080-h608-p-no-v0',
      'https://cdn1.thr.com/sites/default/files/imagecache/landscape_928x523/2012/06/nails_a.jpg',
    ];

getMakeUpSalonList() => [
      'https://ae01.alicdn.com/kf/HTB19y31fv2H8KJjy1zkq6xr7pXaY/beibehang-Custom-3d-wallpaper-murals-nostalgia-vintage-make-up-beauty-salon-hair-salon-background-Barbershop-Wall.jpg',
      'http://cdn.shopify.com/s/files/1/2303/2711/articles/spectrum-aurora-ring-light-for-make-up-hair-salons-beauty_600x.jpg?v=1538459627',
      'https://i.pinimg.com/originals/26/73/b1/2673b1bde9470cd7ee3512ef864694e2.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQvMFmxr2OI4QNkB4SKoaUngRqvufDbBc8vIPbTIpTcudArgUsw',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSbfmLd-mmS3i4GHgjTKpeiqjOMsexbFZhtl15Mq7VDXG6BGycF',
      'https://www.tayloredforyou.co.uk/wp-content/uploads/2018/03/4.png',
      'https://cdn1.vectorstock.com/i/1000x1000/53/50/beauty-salon-logo-make-up-original-logo-design-vector-18225350.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSHPzAd_2kfUDhUEjNNChii6x7eQ6JskFR4D3oI4FKrDd8B2zG6',
      'https://ak1.picdn.net/shutterstock/videos/15946861/thumb/11.jpg',
      'https://www.tayloredforyou.co.uk/wp-content/uploads/2018/03/4.png',
      'https://ae01.alicdn.com/kf/HTB1Gp6njsUrBKNjSZPxq6x00pXaY/New-Beauty-Salon-Quote-Wall-Decal-Stickers-Make-Up-Store-Wall-Decor-Eye-Eyelashes-Lashes-Extensions.jpg',
      'https://lh3.googleusercontent.com/CNROVxgegoN0gBXrFJNYyR2qlshPRCjJjeKypRLOYFCw0P1pWLNb93fbocQ-DBGTRYgwEPfAIA=w1080-h608-p-no-v0',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTUFrExHogSTqgfP7e2c1Lqp6f1Sy_-RuDM-XSbZuKtk3E8cBgK'
    ];

salonsImages() => []
  ..addAll(getMakeUpSalonList())
  ..addAll(getNailSalonList())
  ..addAll(getHairSalonList());

salonsPositions() => []
  ..addAll(getHairPositions())
  ..addAll(getNailPositions())
  ..addAll(getMakeUpPositions());

getHairPositions() => [
      LatLng(40.2969, 44.48018999999999),
      LatLng(40.19597332607166, 44.47677478194237),
      LatLng(40.20090815075844, 44.473579935729504),
      LatLng(40.19993734777292, 44.470076970756054),
      LatLng(40.19337260322138, 44.46648884564638),
      LatLng(40.20294010831604, 44.461387284100056),
      LatLng(40.19723638857069, 44.486592002213),
      LatLng(40.195394286513576, 44.48694169521332),
      LatLng(40.19615515525334, 44.49091739952564),
      LatLng(40.19327707501773, 44.48525257408619),
      LatLng(40.20277827095444, 44.49240803718567),
      LatLng(40.20456050920618, 44.495986104011536),
      LatLng(40.20278031953104, 44.498100355267525),
    ];

getNailPositions() => [
      LatLng(40.1969, 44.48018999999999),
      LatLng(40.19597332607166, 44.47677478194237),
      LatLng(40.20090815075844, 44.473579935729504),
      LatLng(40.19993734777292, 44.470076970756054),
      LatLng(40.19337260322138, 44.46648884564638),
      LatLng(40.20294010831604, 44.461387284100056),
      LatLng(40.19723638857069, 44.486592002213),
      LatLng(40.195394286513576, 44.48694169521332),
      LatLng(40.19615515525334, 44.49091739952564),
      LatLng(40.19327707501773, 44.48525257408619),
      LatLng(40.20277827095444, 44.49240803718567),
      LatLng(40.20456050920618, 44.495986104011536),
      LatLng(40.20278031953104, 44.498100355267525),
    ];

getMakeUpPositions() => [
      LatLng(40.1806692448311, 44.49967514723539),
      LatLng(40.18618097652833, 44.502081759274006),
      LatLng(40.19106657114738, 44.52848341315985),
      LatLng(40.18770214381913, 44.537776596844196),
      LatLng(40.20517301475216, 44.524437971413136),
      LatLng(40.20431366176096, 44.53046288341284),
      LatLng(40.20587872080222, 44.53999578952789),
      LatLng(40.212262005216374, 44.540442042052746),
      LatLng(40.199069221486475, 44.556443095207214),
      LatLng(40.204080128910704, 44.56903003156185),
      LatLng(40.20804137217793, 44.56615101546049),
      LatLng(40.223010578808825, 44.56869374960661),
      LatLng(40.16536401661853, 44.51509349048138),
    ];

generateReviewsList() => [
      Review(
          User("Emma",
              'http://livedoor.blogimg.jp/matometemitatta/imgs/9/4/94ae0fe9.png'),
          1555837118261,
          5,
          'The appointment started promptly and ran the scheduled amount of time. Clean, friendly atmosphere. Easy access and parking is very good. I advise this everyone'),
      Review(
          User("George",
              'https://www.couturehairdesign.com/uploads/2/6/5/2/26524431/5186700_orig.jpg'),
          1555137718211,
          5,
          'Excellent Skills & Highly Professional!! I wouldnt go to anyone else! Excellent Skills & Highly Professional!! I wouldnt go to anyone else, the staff was amasing. Also I announce very important thing` it was very clean.'),
      Review(
          User("John",
              'https://fsr.eui.eu/wp-content/uploads/BorghesiSimone_5995websiteX.jpg'),
          1553897118231,
          2,
          'Very very bad service!'),
      Review(
          User("Liza",
              'https://res.cloudinary.com/allamerican/image/fetch/t_face_s270/https://speakerdata2.s3.amazonaws.com/photo/image/785431/Doutzen-Kroes.jpg'),
          1545837018231,
          4,
          'Highly recommend anyone looking to add some style to their look to set up an appointment with Christy and give her a try. Thank you Sofie. She is awsooooome'),
      Review(
          User("Anna",
              'https://image.shutterstock.com/image-photo/headshot-portrait-happy-ginger-girl-260nw-623804987.jpg'),
          1541837018231,
          5,
          'I wouldnt go to anyone else! Excellent Skills & Highly Professional!! I wouldnt go to anyone else, the staff was amasing.'),
      Review(
          User("David",
              'https://youthincmag.com/wp-content/uploads/2019/05/hone.style_.jpg'),
          1538837318231,
          5,
          "Good Job!"),
    ];

generateSalonList(int tabIndex, bool fromFavorites, String sortBy) {
  List<Business> salonsList = [];
  var images;
  var posList;
  // switch (tabIndex) {
  //   case SearchBloc.hairIndex:
  //     images = getHairSalonList();
  //     posList = getHairPositions();
  //     break;
  //   case SearchBloc.nailIndex:
  //     images = getNailSalonList();
  //     posList = getNailPositions();
  //     break;
  //   case SearchBloc.makeUpIndex:
  //     images = getMakeUpSalonList();
  //     posList = getMakeUpPositions();
  //     break;
  // }

  images = salonsImages();
  posList = salonsPositions();
  var categories = <String>[];
  for (int i = 0; i < 39; i++) {
    switch (i % 4) {
      case 0:
        categories = [hairCategory];
        break;
      case 1:
        categories = [nailCategory];
        break;
      case 2:
        categories = [makeUpCategory];
        break;
      case 3:
        categories = [makeUpCategory, hairCategory];
    }

    salonsList.add(Business(
      imageUrl: images[i],
      name: 'salon ${tabIndex + i + 1} ',
      address: 'salon ${tabIndex + i + 1} address',
      distance: i * 2,
      starCount: i + 2.toDouble(),
      reviewCount: i * 3,
      serviceList: generatePriceList(),
      latLng: posList[i],
      phoneNumbersList: <int>[37496880077, 37455666000],
      staffers: createProfessionalList(),
      workingHourList: generateWorkingHourData(),
      reviews: generateReviewsList(),
      favorite: (i + 2) % 4 == 0 || fromFavorites ? true : false,
      categories: categories,
    ));
  }
  switch (sortBy) {
    case 'Name':
      salonsList.sort((a, b) => a.name.compareTo(b.name));
      break;
    case 'Rating':
      salonsList.sort((a, b) => a.reviewCount.compareTo(b.reviewCount));
      break;
    case 'Distance':
      salonsList.sort((a, b) => a.distance.compareTo(b.distance));
      break;
  }
  return salonsList;
}

generateWorkingHourData() {
  List<WorkingHour> list = [];
  for (int i = 0; i < 7; i++) {
    if (i == 5) {
      list.add(WorkingHour(openHour: '11:00', closeHour: '19:00'));
    } else if (i == 6) {
      list.add(WorkingHour(openHour: null, closeHour: null));
    } else {
      list.add(WorkingHour(openHour: '10:00', closeHour: '20:00'));
    }
  }
  return list;
}

generatePriceList() {
  List<Service> list = [];
  for (int i = 1; i < 16; i++) {
    list.add(Service(
        serviceName: 'Service $i',
        servicePrice: i < 5 ? (i + 2) * 5 : (i + 1) * 4,
        serviceDurationMinutes: i < 5 ? i * 15 : i * 10));
  }
  return list;
}

createAppointmentsList() {
  List<Business> salons = generateSalonList(0, true, 'Name');
  List<Appointment> list = [];
  createAppointmentsLists(salons, list);
  list.sort((a, b) => b.bookDate.compareTo(a.bookDate));
  return list;
}

createAppointmentsLists(List<Business> plist, List<Appointment> list) {
  list.add(Appointment(
      status: 'Done',
      business: plist[3],
      staffer: createProfessionalList()[0],
      service: Service(
          serviceName: 'Service 2',
          servicePrice: 15,
          serviceDurationMinutes: 30),
      bookDate: 1540548000000));
  list.add(Appointment(
      status: 'Done',
      business: plist[5],
      staffer: createProfessionalList()[1],
      service: Service(
          serviceName: 'Service 1',
          servicePrice: 10,
          serviceDurationMinutes: 30),
      bookDate: 1536674420000));
  list.add(Appointment(
      status: 'Done',
      staffer: createProfessionalList()[2],
      business: plist[1],
      service: Service(
          serviceName: 'Service 5',
          servicePrice: 25,
          serviceDurationMinutes: 60),
      bookDate: 1541667600000));
  list.add(Appointment(
      status: 'Canceled',
      business: plist[2],
      staffer: createProfessionalList()[3],
      service: Service(
          serviceName: 'Service 2',
          servicePrice: 20,
          serviceDurationMinutes: 30),
      bookDate: 1540116000000));
  list.add(Appointment(
      status: 'Upcoming',
      business: plist[2],
      staffer: createProfessionalList()[4],
      service: Service(
          serviceName: 'Service 5',
          servicePrice: 25,
          serviceDurationMinutes: 60),
      bookDate: 1653762400000));
}

generateFreeHoursList(Business business) {
  DateFormat dateFormat = new DateFormat.Hm();
  DateTime now = DateTime.now();
  DateTime open = dateFormat.parse(business.workingHourList[0].openHour);
  open = new DateTime(now.year, now.month, now.day, open.hour, open.minute);
  List<DateTime> list = [];
  for (int i = 0; i < 15; i++) {
    list.add(open.add(Duration(minutes: i * 30)));
  }
  return list;
}
