object false

child @vitaes do

  attributes :id, :name, :objective, :code

  node :user_name do |vitae|
    vitae.user.name
  end

  node :href do |vitae|
    vitae_url(vitae)
  end

  node :links do |vitae|
    {
      jobs: @vitaes.length == 1 ? vitae.jobs.map {|job| job.id } : vitae_jobs_url(vitae),
      schools: @vitaes.length == 1 ? vitae.schools.map {|job| job.id } : vitae_schools_url(vitae),
      refs: @vitaes.length == 1 ? vitae.refs.map {|job| job.id } : vitae_refs_url(vitae),
    }
  end

  node :linked do |vitae|
    {
      vitaes: vitaes_url
    }
  end if @filtered

end

if @vitaes.length == 1
  child @jobs do
    attributes :id, :company, :location, :title, :hired_on, :left_on, :responsibilities
  end

  child @schools do
    attributes :id, :name, :location, :major, :enrolled_on, :left_on, :did_graduate
  end

  child @refs do
    attributes :id, :name, :title, :email, :phone, :relationship
  end
end