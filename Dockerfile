FROM perl:5.24

WORKDIR /
ADD modules modules
ADD play play

#ENTRYPOINT perl /play $0 $@
