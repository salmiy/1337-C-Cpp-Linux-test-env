# 1337-C-Cpp-Linux-test-env
1337 School - C/C++ simple Linux test environment 

## Requirements
* `Docker` installed and running
  - install `Docker` and before starting it use `42School_configure_docker.sh` to configure it.

## Instalation
```sh
git clone git@github.com:salmiy/1337-C-Cpp-Linux-test-env.git linux-env
cd linux-env
bash setup.sh
```

##  Usage

  To test in a directory you have to start the tester as follows:
  ```sh
start_tester
```
every time you change the directory of testing you have to run that command again.
  After the tester has started you can test like you always have just put `tester`
before every command.

### Example:
```
make
./exec
```
becomes
```
tester make
tester ./exec
```
After testing is complete you can use `stop_tester` to stop the tester.
