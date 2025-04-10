
user = User.create!(name: "Test User", email: "test@example.com")

survey = Survey.create!(title: "Employee Engagement", description: "Quarterly engagement survey")

categories = [
  survey.categories.create!(name: "Work Environment"),
  survey.categories.create!(name: "Leadership")
]

questions = []
categories.each do |category|
  2.times do |i|
    q = category.questions.create!(text: "Question #{i + 1} for #{category.name}")
    questions << q

    # 5 answer options (1 to 5)
    q.answer_options.create!([
      { text: "Not at all", score: 1 },
      { text: "Slightly", score: 2 },
      { text: "Somewhat", score: 3 },
      { text: "Mostly", score: 4 },
      { text: "Completely", score: 5 }
    ])
  end
end

puts "Seeded: #{User.count} user, #{Survey.count} survey, #{categories.count} categories, #{questions.count} questions"
