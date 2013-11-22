collection @refs, root: :refs

attributes :id, :name, :title, :email, :phone, :relationship

node :href do |ref|
  ref_url(ref)
end

node :links do |ref|
  {
    vitaes: vitae_url(ref.vitaes.map {|v| v.id }.join(","))
  }
end