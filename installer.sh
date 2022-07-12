#!$(which bash)

# This script should be run on a docker host system with bash.
# E.g. source installer.sh
#
# Expects the following environment variables:
# + CI_VR_REFERENCE_WEBSITE_URL
# + CI_VR_TEST_WEBSITE_URL
# + CI_VR_WORKING_FOLDER=/tmp/ci
# + CI_VR_DOCKER_NETWORK=host

CI_VR_TOOLS_DOCKER_TAG=1.0.1
CI_VR_WORKING_FOLDER="${CI_VR_WORKING_FOLDER:-/tmp/ci}"
CI_VR_DOCKER_NETWORK="${CI_VR_DOCKER_NETWORK:-host}"

# Create working directory.
mkdir -p $CI_VR_WORKING_FOLDER/bin

# Get the dockerized application
docker pull iqualch/ci-pocketknife:$CI_VR_TOOLS_DOCKER_TAG

# Create a cli shortcut for the glue commands
cat << EOF > ${CI_VR_WORKING_FOLDER}/bin/g
#!$(which bash)

docker run -e CI_VR_REFERENCE_WEBSITE_URL -e CI_VR_TEST_WEBSITE_URL -v ${CI_VR_WORKING_FOLDER}:/app/data  --network ${CI_VR_DOCKER_NETWORK} --rm iqualch/ci-pocketknife:${CI_VR_TOOLS_DOCKER_TAG} "\$@"

EOF

# Make the file executable
chmod +x ${CI_VR_WORKING_FOLDER}/bin/g

# Add it to the PATH
PATH=$PATH:${CI_VR_WORKING_FOLDER}/bin
