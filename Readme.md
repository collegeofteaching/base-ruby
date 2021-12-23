# Base Ruby

This contains a minimal ruby env together with database and basic build packages.

To build:

- Make your changes
- Build locally with `docker build . -t collegeofteaching/base-ruby:{your-tag-here}`
- Check if it builds
- You can go into the image and check everything's right with `docker run -i -t collegeofteaching/base-ruby:{your-tag-here} /bin/bash`

To release:

- Make sure you've built the lastest version of the dockerfile locally (see above)
- Make your changes
- Commit your changes into git
- Push to github
- Push the current build to Dockerhub with `docker push collegeofteaching/base-ruby:latest`

Dockerhub (https://hub.docker.com/repository/docker/collegeofteaching/base-ruby) will automatically build the image and make it available to use in our other projects.
