# Docker containers for the Sentinel Application Platform

 Fork from https://github.com/edwardpmorris/docker-snap

## Installation

  

1.  [Install Docker](https://docs.docker.com/engine/installation/).

1. ```docker build -t="snap6" github.com/jjylik/docker-snap```

  
  
## Usage

  

### SNAP containers

To run a container (choose the container flavour using the `:tag` option) and view the help for the SNAP command line API, `gpt`, open a terminal and type:

  

```

docker run --rm snap6 gpt -h

```

  

+ adding vmoptions:

```

docker run -it -v /home/user/snap/bin/gpt.vmoptions:/usr/local/snap/bin/gpt.vmoptions snap6

```