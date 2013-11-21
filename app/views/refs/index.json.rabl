collection @refs

attributes :id, :name, :title, :email, :phone, :relationship

node :href do |ref|
  ref_url(ref)
end

node :linked do |ref|
  {
    vitaes: filtered_vitaes_url(ref.vitaes.map {|v| v.id }.join(","))
  }
end