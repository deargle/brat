# Brat Dockerfile

The entrypoint script creates `/work` and `/data` folders in `/shared` and symlinks them into the docker-container `/brat` dir.
The Dockerfile creates username:group brat:brat with ids 1001:1001 -- if you create the same on your system, then you can add
system users to that group, and they can add things to the `/work` and `/data` dirs.

After building and starting a container, you can run `copy-examples.sh` to get the examples into the brat datadir.

Add username:passwords to shared/brat-config.py
