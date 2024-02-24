class Pet {
  final String name;
  final double price;
  final String image;
  final String description;
  final double height;
  final double weight;
  final String color;
  final String location;
  final int eta;

  Pet({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.height,
    required this.weight,
    required this.color,
    required this.location,
    required this.eta,
  });
}

List<Pet> pets = [
  Pet(
    name: 'American Bully',
    price: 85,
    image: 'assets/american-bully.jpg',
    description:
        'The American Bully is known for its impressive muscular build and a friendly demeanor. It\'s a loyal and affectionate companion, ideal for families.',
    height: 40,
    weight: 30,
    color: 'Brindle',
    location: 'Miami, FL',
    eta: 240,
  ),
  Pet(
    name: 'Bengal Cat',
    price: 60,
    image: 'assets/bengal-cat.webp',
    description:
        'Bengal cats are energetic and playful, with a coat that boasts beautiful leopard-like spots. They are intelligent cats that enjoy interactive toys and games.',
    height: 22,
    weight: 8,
    color: 'Spotted Brown',
    location: 'Austin, TX',
    eta: 180,
  ),
  Pet(
    name: 'King Cobra',
    price: 90,
    image: 'assets/king-cobra.jpg',
    description:
        'The King Cobra is a majestic and powerful snake, known for its hood and the ability to stand upright. It requires an experienced handler due to its venomous nature.',
    height: 500,
    weight: 5,
    color: 'Olive Green',
    location: 'Orlando, FL',
    eta: 300,
  ),
  Pet(
    name: 'Macaw Bird',
    price: 75,
    image: 'assets/macaw-bird.jpg',
    description:
        'Macaws are known for their vivid plumage and long tail feathers. These social birds are highly intelligent and require plenty of interaction and mental stimulation.',
    height: 90.3,
    weight: 1.1,
    color: 'Blue and White',
    location: 'Phoenix, AZ',
    eta: 210,
  ),
  Pet(
    name: 'Maltese Shihtzu',
    price: 75,
    image: 'assets/maltese-shihtzu.jpg',
    description:
        'The Maltese Shihtzu is a charming, small dog known for its friendly and outgoing personality. It has a luxurious coat that requires regular grooming.',
    height: 25.9,
    weight: 3.4,
    color: 'White',
    location: 'Chicago, IL',
    eta: 150,
  ),
  Pet(
    name: 'Persian Cat',
    price: 60,
    image: 'assets/persian-cat.jpg',
    description:
        'Persian cats are cherished for their quiet, gentle nature and their long, luxurious coats. They make calm, undemanding companions, perfect for cozy homes.',
    height: 22.7,
    weight: 4.2,
    color: 'Cream',
    location: 'New York, NY',
    eta: 60,
  ),
  Pet(
    name: 'Sphynx Cat',
    price: 60,
    image: 'assets/sphynx-cat.jpg',
    description:
        'The Sphynx cat, with its hairless appearance, is known for its extroverted behavior and high energy levels. These cats seek human attention and make affectionate pets.',
    height: 25.8,
    weight: 6.7,
    color: 'Gray',
    location: 'Los Angeles, CA',
    eta: 45,
  ),
  Pet(
    name: 'Yorkshire Terrier',
    price: 60,
    image: 'assets/yorkshire-terrier.jpg',
    description:
        'Yorkshire Terriers are tiny in size but big in personality, carrying themselves in a very confident manner. Their beautiful coats and vivacious spirit make them popular pets.',
    height: 23.4,
    weight: 5.5,
    color: 'Black and Brown',
    location: 'Los Angeles, CA',
    eta: 15,
  )
];
