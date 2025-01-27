# [Mininet](http://mininet.org/) inside a Docker container

A Docker image for [Mininet](http://mininet.org/) forked from [iwaseyusuke/docker-mininet](https://github.com/iwaseyusuke/docker-mininet) to include Python3 and [Wireshark](https://www.wireshark.org/), among other utilities.

## Usage

Mininet Docker image can be built as `docker build -t mininet .` and run as

```console
docker run -it --rm --privileged -e DISPLAY \
             -v /tmp/.X11-unix:/tmp/.X11-unix \
             -v /lib/modules:/lib/modules \
             -v $(pwd):/data \
             mininet
```
Contents of the current working directory are then available in `/data`.

#### Open X Window applications in containers

If you could not open `xterm` or other X Window applications, or faced to the
following error message:

```console
root@26f36691a400:~# xterm
No protocol specified
Warning: This program is an suid-root program or is being run by the root user.
The full text of the error or warning message cannot be safely formatted
in this environment. You may get a more descriptive message by running the
program as a non-root user or by removing the suid bit on the executable.
xterm: Xt error: Can't open display: %s
```

Please, add `root` user to the local access control list of xhost on your
"Docker host" (not on your containers).

```console
$ xhost +si:localuser:root
localuser:root being added to access control list
```
