class CreateFantasticService
  def call
    3.times do
      Fantastic.create!(
        title: Faker::Job.title,
        published_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
        body: Faker::Markdown.headers + Faker::Markdown.emphasis + Faker::Markdown.ordered_list + Faker::Markdown.unordered_list + Faker::Markdown.inline_code + Faker::Markdown.block_code + Faker::Markdown.table + Faker::Markdown.random
      )
    end
  end
end
