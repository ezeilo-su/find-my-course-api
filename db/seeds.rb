# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

courses = Course.create([
  {
    title: "The Complete Ruby on Rails Developer Course",
    description: "Learn to make innovative web apps with Ruby on Rails and unleash your creativity",
    duration: "48 total hours",
    image_url: "https://img-a.udemycdn.com/course/240x135/519442_63fe_2.jpg?Y_5WVyRzhIfIkW9rlCF2d1g1WpsFIBBWuocUDHsozDF6PqYPV_XClsA12U5LZx4bFDFZUU_o5HggAjao2e1LYNVKvRnfRTv6bYY5T5aumOwmkuk4Rdb2uogjSH_FukI"
  },
  {
    title: "REST API with Ruby on Rails: The Complete Guide",
    description: "Create complete REST API application using Ruby on Rails and Test Driven Development!",
    duration: "7 total hours",
    image_url: "https://img-b.udemycdn.com/course/240x135/1652728_5c0f.jpg?secure=9azrLnDnLe-XH7h3iAKPYA%3D%3D%2C1619806272",
  },
  {
    title: "Ruby on Rails 6: Learn 25+ gems and build a Startup MVP 2021",
    description: "Code-Along & build an advanced e-learning platform. Biggest, Most complete Ruby on Rails 6 course. Always updated.",
    duration: "7 total hours",
    image_url: "https://img-a.udemycdn.com/course/240x135/2519558_7fdc_10.jpg?cfF9DhWCym99kSIC7G8ClzTZWfpaVxiIiJfF5cICluomwsvF2Es_EBW0DCN1zLnRK2kUie3QG2R02KXH5lUafnc01l7krkLgLycGPIWdoNWM2NdUviFu1qo5EnmnNFmocQ",
  },
  {
    title: "Basics of GraphQL with Ruby on Rails",
    description: "Learn to use GraphQL in a Rails app to talk to your front-end clients.",
    duration: "2 total hours",
    image_url: "https://img-a.udemycdn.com/course/240x135/1435568_3126_3.jpg?aO-NFVDYRLMqHMr0y0zjk8lnshG7RdP0QwCyV6lMuvAGjBHUluaT3EoToF2VPnDRQnEx9S2ZjyXYdj_py4tZ5YIT6O0CFEKHNbFkZoB-TpBjusps0U4auUB8ka9dcY4O",
  },

  {
    title: "MERN Stack Front To Back: Full Stack React, Redux & Node.js",
    description: "Build and deploy a social network with Node.js, Express, React, Redux & MongoDB. Fully updated April 2019",
    duration: "12 total hours",
    image_url: "https://img-b.udemycdn.com/course/240x135/1646980_23f7_2.jpg?secure=ph15_1omEYdwJ5SnrHIptQ%3D%3D%2C1619799611",
  },
  {
    title: "React Front To Back",
    description: "Learn Modern React 16.8+ Including Hooks, Context API, Full Stack MERN & Redux By Building Real Life Projects",
    duration: "14 total hours",
    image_url: "https://img-b.udemycdn.com/course/240x135/2395488_bd78_2.jpg?secure=wO19iqZvInF6O3fT-N7E4Q%3D%3D%2C1619785401",
  },
  {
    title: "MERN eCommerce From Scratch",
    description: "Build an eCommerce platform from the ground up with React, Redux, Express & MongoDB",
    duration: "15 total hours",
    image_url: "https://img-b.udemycdn.com/course/240x135/3533422_867d.jpg?secure=rgNQ8Awqow1IcoGUw6lYTA%3D%3D%2C1619800154",
  },

  {
    title: "React, NodeJS, Express & MongoDB - The MERN Fullstack Guide",
    description: "Build fullstack React.js applications with Node.js, Express.js & MongoDB (MERN) with this project-focused course.",
    duration: "19 total hours",
    image_url: "https://img-a.udemycdn.com/course/240x135/2640372_5b44_5.jpg?tsdsjz5YOl1OqrC_HS2mnM4J9SENRjMujeeTd5rXOadQOvP5K0s7Br5glS04Ve2BzmP_Mg6j33XqSVQRY6CZ0meRsgyJ9fKSRHTVG-hvdLPcYASmZZoRIl9_DgOQWPCg",
  },
  {
    title: "MERN Stack Full Ecommerce Site - Using React, Redux, Node.js",
    description: "Build Powerful MERN Stack Ecommerce Project using React, Redux, Node.js, Express, MongoDB, Stripe from DEV to DEPLOYMENT",
    duration: "20 total hours",
    image_url: "https://img-a.udemycdn.com/course/240x135/3678044_4cd0.jpg?7YDlvLPzRsaT-BTxP2hoTPLEVYA71ltApzk8gUP0LVREfQ53rZmDveZ-7rfg25JEPO3N80KZZ58II0O3-SBaP8tk5Ict1TDIaKzQUTGkliBeFD0zR28m4X4q2voNKw",
  }
])

courses.each { |course| course.update_attribute(:slug, course.title.parameterize) }