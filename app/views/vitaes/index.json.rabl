collection @vitaes

attributes :id, :name, :objective, :code

node :user_name do |vitae|
  vitae.user.name
end

node :href do |vitae|
  vitae_url(vitae)
end

node :linked do |vitae|
  {
    jobs: vitae_jobs_url(vitae),
    schools: vitae_schools_url(vitae),
    refs: vitae_refs_url(vitae),
    vitaes: vitaes_url
  }
end
