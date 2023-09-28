#
docker network create mynet

docker run -d -p 9100:9100 --network mynet --name node-exporter prom/node-exporter

docker run -d -p 9090:9090 --network mynet --name prometheus -v /Users/natawut/git/data-eng-training-2023/docker/monitoring/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus

docker volume create grafana-vol
docker run -d -p 3000:3000 --network mynet -v grafana-vol:/var/lib/grafana --name grafana grafana/grafana
