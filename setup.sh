#!/bin/bash

echo -n 'FROM ubuntu:20.04
WORKDIR /code
RUN apt-get update && apt-get install make -y
RUN apt-get install build-essential -y && apt-get install g++ -y
CMD ["/bin/bash"]' >| Dockerfile

docker build . -t=tester

rm -rf Dockerfile

mkdir -p ~/bin
echo -n '#!/bin/bash

res=$(docker ps -a | grep -o test_box);
if [ "$res" == "test_box" ]
then
	docker rm -f test_box
fi
docker run --name test_box -w /code -v $(pwd):/code -td tester
' > $HOME/bin/start_tester


echo -n '#!/bin/bash

res=$(docker ps -a | grep -o test_box);
if [ "$res" == "test_box" ]
then
	docker rm -f test_box
fi
' > $HOME/bin/stop_tester

chomd +x $HOME/bin/start_tester
chomd +x $HOME/bin/stop_tester

echo "export PATH='$HOME/bin:$PATH'" >> $HOME/.bashrc
echo "export PATH='$HOME/bin:$PATH'" >> $HOME/.zshrc
echo "alias tester='docker exec -it test_box '" >> $HOME/.bashrc
echo "alias tester='docker exec -it test_box '" >> $HOME/.zshrc