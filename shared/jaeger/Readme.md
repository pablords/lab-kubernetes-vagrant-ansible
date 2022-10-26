while sleep 0.01; do curl http://dev.hotrod.com; done

autocannon -c 20 -d 30 -l http://dev.hotrod.com

kubectl top pod --containers