categories = []
20.times do
  category = Category.create(name: Faker::Verb.base.capitalize)
  categories << category
end
users = []

# create admin user
admin =
  User.create(
    username: "Jogn Doe",
    email: "john.doe@example.com",
    password: "password",
    image: Faker::Avatar.image,
    admin: true
  )

users << admin

10.times do
  user =
    User.create(
      username: Faker::Name.neutral_first_name,
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      image: Faker::Avatar.image
    )
  users << user
end

users.each do |u|
  10.times do
    articleCategories = []
    rand(2..6).times do
      articleCategories << categories[rand(categories.length)].id
    end
    Article.create(
      title: Faker::Lorem.unique.sentence,
      description:
        Faker::Lorem.paragraphs(
          number: rand(100..200),
          supplemental: false,
          exclude_words: nil
        ).join('\n'),
      category_ids: articleCategories,
      user_id: users[rand(users.length)].id
    )
  end
end
