GEARMAN=docker run --rm -it --network=gearmanexample_app artefactual/gearmand:latest gearman -h gearman-server

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
	${GEARMAN} -s -f date

test-ping:
	${GEARMAN} -s -f ping -- google.com

test-stock-quote:
	${GEARMAN} -s -f stock-quote -- GOOG

top:
	docker-compose top

stats:
	docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}" --no-stream

stats-stream:
	docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}"
