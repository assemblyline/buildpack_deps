require 'pry'

task :pull do
  say 'pulling latest image'
  docker 'pull -xyz assemblyline/buildpack_deps:latest'
end

task build_check: [:pull] do
  say 'building check environment'
  docker 'build -t assemblyline/buildpack_deps:check ./check'
end

task trigger_build_if_needed: [:build_check] do
  token = ENV.fetch('DOCKER_TRIGGER_TOKEN')
  if packages_need_updating?
    say 'some packages are out of date triggering a build'
    sh "curl --data \"build=true\" -X POST https://registry.hub.docker.com/u/assemblyline/buildpack_deps/trigger/#{token}/"
  else
    say 'the lastest image is up to date and does not need updating'
  end
end

task :clean do
  say 'cleaning up'
  docker 'rmi assemblyline/buildpack_deps:check'
end

task default: [:trigger_build_if_needed, :clean]

def say(message)
  puts "==> " + message
end

def packages_need_updating?
  !system('docker run --rm -ti assemblyline/buildpack_deps:check')
end

def docker(command)
  output = `docker #{command}` == 0
  fail output unless $?.success?
end
