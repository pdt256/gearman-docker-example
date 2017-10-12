# Gearman Docker Example:

## Start server

```
 $ make start
docker-compose up -d
Creating gearmanexample_gearman-server_1 ... done
Creating gearmanexample_date-worker_1 ... done
docker-compose ps
             Name                            Command               State            Ports          
---------------------------------------------------------------------------------------------------
gearmanexample_date-worker_1      docker-entrypoint.sh gearm ...   Up      4730/tcp                
gearmanexample_gearman-server_1   docker-entrypoint.sh gearmand    Up      127.0.0.1:4730->4730/tcp
```

## Execute Job

```
$ make test-date 
docker run --rm -it --network=gearmanexample_app artefactual/gearmand:latest gearman -h gearman-server -s -f date
Thu Oct 12 04:10:05 UTC 2017
```

## Log output
```
$ make logs
docker-compose logs -f
Attaching to gearmanexample_date-worker_1, gearmanexample_gearman-server_1
gearman-server_1  | --queue-type=builtin
gearman-server_1  | --listen=0.0.0.0
gearman-server_1  | --port=4730
gearman-server_1  | --log-file=stderr
gearman-server_1  | --verbose=INFO
gearman-server_1  |    INFO 2017-10-12 04:09:23.046376 [  main ] Initializing Gear on port 4730 with SSL: false
gearman-server_1  |    INFO 2017-10-12 04:09:23.000000 [  main ] Starting up with pid 1, verbose is set to INFO
gearman-server_1  |    INFO 2017-10-12 04:09:23.000000 [  main ] Listening on 0.0.0.0:4730 (8)
gearman-server_1  |    INFO 2017-10-12 04:09:23.000000 [  main ] Adding event for listening socket (8)
gearman-server_1  |    INFO 2017-10-12 04:09:23.000000 [  main ] Accepted connection from 172.18.0.4:49562
gearman-server_1  |    INFO 2017-10-12 04:09:23.000000 [  main ] Accepted connection from 172.18.0.5:52268
gearman-server_1  |    INFO 2017-10-12 04:09:23.000000 [  main ] Accepted connection from 172.18.0.6:50192
gearman-server_1  |    INFO 2017-10-12 04:09:23.000000 [  main ] Accepted connection from 172.18.0.3:49396

gearman-server_1  |    INFO 2017-10-12 04:10:22.000000 [  main ] Accepted connection from 172.18.0.7:35358
gearman-server_1  |  NOTICE 2017-10-12 04:10:22.000000 [  proc ] accepted,date,443f89e8-af03-11e7-9a84-0242ac120007,0 -> libgearman-server/server.cc:317
gearman-server_1  |    INFO 2017-10-12 04:10:22.000000 [     3 ] Peer connection has called close()
gearman-server_1  |    INFO 2017-10-12 04:10:22.000000 [     3 ] Disconnected 172.18.0.7:35358
gearman-server_1  |    INFO 2017-10-12 04:10:22.000000 [     3 ] Gear connection disconnected: -:-
```
