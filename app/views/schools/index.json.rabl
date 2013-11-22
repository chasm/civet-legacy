collection @schools, root: :schools

attributes :id, :name, :location, :major, :enrolled_on, :left_on, :did_graduate

node :href do |school|
  @vitae ? vitae_schools_url(@vitae, school) : school_url(school)
end

node :links do |school|
  {
    vitaes: vitae_url(school.vitaes.map {|v| v.id }.join(","))
  }
end

node :linked do |school|
  {
    schools: @vitae ? vitae_schools_url(@vitae) : schools_url
  }
end if @filtered