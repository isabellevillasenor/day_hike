Trip.destroy_all
Trail.destroy_all


t1 = Trip.create!(name: 'Trip 1', start_date: '2020-02-02 08:00:00', end_date: '2020-02-02 17:00:00')
t2 = Trip.create!(name: 'Trip 2', start_date: '2020-02-02 08:00:00', end_date: '2020-02-02 17:00:00')


cherry = Trail.create!(length: 40, name: 'Cherry Creek', address: 'Downtown Denver to Franktown')
falcon = Trail.create!(length: 10, name: 'Mount Falcon', address: 'Morrison')
chaut = Trail.create!(length: 6, name: 'Chautauqua Park', address: 'Boulder')
gods = Trail.create!(length: 8, name: 'Garden of the Gods', address: 'Colorado Springs')


TripTrail.create!(trail: cherry, trip: t1)
TripTrail.create!(trail: falcon, trip: t1)
TripTrail.create!(trail: chaut, trip: t2)
TripTrail.create!(trail: gods, trip: t2)
TripTrail.create!(trail: cherry, trip: t2)
