ActiveRecord::Base.transaction do
  puts 'Deleting all Places...'
  InterestPlace.destroy_all

  puts 'Seeding Interest Places'
  InterestPlace.create(
    name: 'Praça',
    x: 12,
    y: 17
  )

  InterestPlace.create(
    name: 'Restalrante da Zulmira',
    x: 15,
    y: 23,
    opened: '10:00',
    closed: '16:00'
  )

  InterestPlace.create(
    name: 'Barbearia do Joaquim',
    x: 29,
    y: 17,
    opened: '08:00',
    closed: '18:00'
  )
end
