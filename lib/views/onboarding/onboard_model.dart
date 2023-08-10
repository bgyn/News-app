class Onboard {
  final String image;
  final String title;
  final String description;
  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demoData = [
  Onboard(
    image: 'assets/images/onboard-1.png',
    title: 'Lorem Ipsum is simply dummy',
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
  Onboard(
    image: 'assets/images/onboard-2.png',
    title: 'Lorem Ipsum is simply dummy',
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
  Onboard(
    image: 'assets/images/onboard-3.png',
    title: 'Lorem Ipsum is simply dummy',
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
];
