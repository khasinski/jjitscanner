every 1.hour do
  runner "FetchJob.new.perform"
end
