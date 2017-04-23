class CreateAtomService
  def call
    5.times do
      Atom.create!(title: Faker::Coffee.blend_name, body: Faker::ChuckNorris.fact)
    end
  end
end
