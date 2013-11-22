collection @jobs, root: :jobs

attributes :id, :company, :location, :title, :hired_on, :left_on, :responsibilities

node :href do |job|
  job_url(job)
end

node :links do |job|
  {
    vitaes: vitae_url(job.vitaes.map {|v| v.id }.join(","))
  }
end