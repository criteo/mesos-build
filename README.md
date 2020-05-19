## SETUP
1. `echo "MESOS_SOURCES=/home/user/mesos-upstream/" > .env`
2. `docker-compose build`
3. `docker-compose up`


## TODO
 - [ ] Simplify env to put more of them in `/usr/bin/mesos-{agent, master}`
 - [ ] Remove extends to use 3.4 docker-compose only
 - [ ] Make a marathon image based on centos to leverage freshly built libmesos
