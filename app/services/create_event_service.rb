class CreateEventService
  def call
    Event.create! name: "Capture the Joker", starts_at: 2.days.from_now, ends_at: 3.days.from_now, description: "The Joker is at it again. Find his secret lair and capture him to keep him from causing more trouble."
    Event.create! name: "Save the World", starts_at: 2.weeks.from_now, ends_at: 3.weeks.from_now, description: "An astroid is expected to collide with Earth around this time. It's a bird, it's a plain, it's Superman!"
  end
end
