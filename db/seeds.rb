# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Photographer.create(name: "Andrew Torpp", website: "https://www.torppphotos.com", years_of_experience: "5", city: "Chicago", state: "Illinois", image: "https://www.tennisworldusa.org/imgb/91139/stefanos-tsitsipas-i-can-imitate-players-doing-interviews-but-i-m-too-shy-for-that-.jpg", user_id: 1)
Photographer.create(name: "Flores Kan", website: "www.https://flkanphotos.com", years_of_experience: "8", city: "Miami", state: "Florida", image: "https://images.indianexpress.com/2020/07/simona-halep-fb.jpg", user_id: 1)
Photographer.create(name: "Anne Klauss", website: "www.https://aklausphotos.com", years_of_experience: "7", city: "Atlanta", state: "Georgia", image: "https://www.tennisworldusa.org/imgb/80471/anna-kournikova-comments-on-how-her-life-has-changed-after-tennis-career.jpg", user_id: 1 )
Review.create(content: "We really enjoyed working with Anne! She captured big beautiful moments of the wedding day and the quieter and genuine looks between the bride and groom. She'd be a great addition to your wedding team!", photographer_id: 3, user_id: 1)
Review.create(content: "Flores is very professional, she makes sure you feel comfortable and confident, she is fun to work with! So ladies if you are still debating either to do Boudoir session or not, GO FOR IT!  Its totally worth it!", photographer_id: 2, user_id: 1)
Review.create(content: "Andrew is the best!The pictures are incredible and we are so excited to have these amazing photos to cherish forever.", photographer_id: 1, user_id: 1)
Review.create(content: "Anne is so talented, kind, and fun to work with. We had a wonderful experience and absolutely love all of the photos!", photographer_id: 3, user_id: 1)
