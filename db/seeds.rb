Trail.destroy_all
Trip.destroy_all

cherry = Trail.create!(length: 40, name: 'Cherry Creek', address: 'Downtown Denver to Franktown')
falcon = Trail.create!(length: 10, name: 'Mount Falcon', address: 'Morrison')
chaut = Trail.create!(length: 6, name: 'Chautauqua Park', address: 'Boulder')
gods = Trail.create!(length: 8, name: 'Garden of the Gods', address: 'Colorado Springs')

t1 = Trip.create!(name: 'Trip 1', start_date: '2020-02-02 08:00:00', end_date: '2020-02-02 17:00:00')
t2 = Trip.create!(name: 'Trip 2', start_date: '2020-02-02 08:00:00', end_date: '2020-02-02 17:00:00')