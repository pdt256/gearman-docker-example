logs:
	docker-compose logs -f

start:
	docker-compose up -d
	docker-compose ps

stop:
	docker-compose stop

status:
	docker-compose ps

restart: stop start

test-date:
	docker run --rm -it --network=gearmanexample_app artefactual/gearmand:latest gearman -h gearman-server -s -f date

test-ping:
	docker run --rm -it --network=gearmanexample_app artefactual/gearmand:latest gearman -h gearman-server -f ping -- google.com

test-stock-quote:
	docker run --rm -it --network=gearmanexample_app artefactual/gearmand:latest gearman -h gearman-server -f stock-quote -- GOOG

top:
	docker-compose top

stats:
	docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}" --no-stream

stats-stream:
	docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}"
