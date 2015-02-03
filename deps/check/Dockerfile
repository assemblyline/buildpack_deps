FROM assemblyline/buildpack_deps:latest
RUN apt-get update && apt-get install -yq update-notifier-common
CMD ["/usr/lib/update-notifier/apt-check"]
