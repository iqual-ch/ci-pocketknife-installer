# CI Pocketknife Installer


This script should be run on a docker host system with bash.
```source installer.sh```

Expects the following environment variables:

- CI_VR_REFERENCE_WEBSITE_URL
- CI_VR_TEST_WEBSITE_URL
- CI_VR_WORKING_FOLDER=/tmp/ci
- CI_VR_DOCKER_NETWORK=host

Once the script has been `source`-d it provides a specified version of the [CI Pocketknife toolset](https://github.com/iqual-ch/ci-pocketknife). This toolset can then be further used via e.g. Github's actions. Or any other CI. Or even a developer on their local computer.
