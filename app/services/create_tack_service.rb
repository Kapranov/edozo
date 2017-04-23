class CreateTackService
  def call
    #Tack.create!(tick_id: 1, title: "An Example of a Post", body: "This is a perfect example of a blog post.  Feel free to reference this example in your other applications.  Note that the author of this blog post does not accept responsibility for the contents of this blog post.")
    #Tack.create!(tick_id: 1, title: "Another Example of a Post", body: "This is yet another example of a blog post.  This one is less perfect than the first one.")
    #Tack.create!(tick_id: 2, title: "An Utterly Awesome Post", body: "This is a super awesome example of a really good blog post.  You should...like...totally copy this!")
    #Tack.create!(tick_id: 2, title: "Yet Another Utterly Post", body: "This is yet ANOTHER example of a super awesome blog post.  You should totally copy this one as well!")
    25.times do
      Tack.create!(tick_id: rand(1..10), title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
    end
  end
end
