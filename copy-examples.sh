docker-compose exec brat cp -rp /brat/example-data/corpora /brat/data/examples
docker-compose exec brat cp -rp /brat/example-data/tutorials /brat/data/tutorials
docker-compose exec brat chmod -R 770 /brat/data/