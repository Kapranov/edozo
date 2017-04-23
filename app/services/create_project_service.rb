class CreateProjectService
  def call
    wealthy = Project.create(name: 'Wealth Building')
    wealthy.tasks.create(name: 'Get rich quick', completed: true)
    wealthy.tasks.create(name: 'Write a book', completed: true)

    happy = Project.create(name: 'Be Happy')
    happy.tasks.create(name: 'Buy a puppy', completed: true)
    happy.tasks.create(name: 'Dance in the rain', completed: false)
    happy.tasks.create(name: 'Dance in the snow', completed: false)
    happy.tasks.create(name: 'Walk on water', completed: false)
    happy.tasks.create(name: 'Just Blog It', completed: true)
    happy.tasks.create(name: 'Play tennis', completed: true)
    happy.tasks.create(name: 'Make fun of Donald Trump', completed: true)
    happy.tasks.create(name: 'Walk on moon', completed: true)
  end
end
