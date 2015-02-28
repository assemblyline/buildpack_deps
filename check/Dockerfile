FROM quay.io/assemblyline/buildpack_deps:14.04.2
RUN apt-get update && apt-get install -yq update-notifier-common
CMD apt-get clean && apt-get update && /usr/lib/update-notifier/apt-check
