## SETUP
1. `echo "MESOS_SOURCES=/home/user/mesos-upstream/" > .env`
2. `docker build -f Dockerfile.automake --target builder -t builder-mesos .`
2. Then, from MESOS_SOURCES dir: `docker run -v $(pwd):/src/mesos builder-mesos`
3. Go back in mesosbuild and `docker-compose up`

After each source modification, just kill docker-compose, rebuild and `docker-compose up`


## TODO
 - [ ] Simplify env to put more of them in `/usr/bin/mesos-{agent, master}`
 - [ ] Remove extends to use 3.4 docker-compose only
 - [ ] Make a marathon image based on centos to leverage freshly built libmesos
