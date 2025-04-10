json.id @survey.id
json.title @survey.title

json.categories @survey.categories do |cat|
  json.id cat.id
  json.name cat.name

  json.questions cat.questions do |q|
    json.id q.id
    json.text q.text
    json.category_id q.category_id

    json.options q.answer_options do |opt|
      json.id opt.id
      json.text opt.text
      json.score opt.score
    end
  end
end
