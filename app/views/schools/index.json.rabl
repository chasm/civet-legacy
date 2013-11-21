collection @schools

attributes :id, :name, :location, :major, :enrolled_on, :left_on, :did_graduate

node :href do |school|
  school_url(school)
end

node :linked do |school|
  linked = {
    vitaes: filtered_vitaes_url(school.vitaes.map {|v| v.id }.join(","))
  }
  
  linked[:schools] = schools_url if @filtered
  
  linked
end