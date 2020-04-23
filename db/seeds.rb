%w(Thiruvananthapuram Kollam Pathanamthitta Alappuzha Kottayam Idukki Ernakulam Thrissur Palakkad Malappuram Kozhikode Wayanad Kannur Kasaragod).each do |d|
  District.create!(name: d)
end

district = District.find_by(name: "Ernakulam")
["Rural 1", "Rural 2", "Urban 1", "Urban 2"].each do |d|
  Panchayat.create!(name: d, district_id: district.id)
end