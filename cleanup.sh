#!/bin/bash
BLUE='\033[0;34m'
NC='\033[0m'

echo "${BLUE}Starting script...${NC}"
sleep 3

echo "${BLUE}Update${NC}"
apt-get update
sleep 3

echo "${BLUE}Upgrade${NC}"
apt-get upgrade
sleep 3


#This terminal command deletes all .deb files from /var/cache/apt/archives. It basically cleans up the apt-get cache.
echo "${BLUE}Starting with autoclean...${NC}"
apt-get autoclean
sleep 3

#This terminal command is used to free up the disk space by cleaning up downloaded .deb files from the local repository.
echo "${BLUE}Starting with clean...${NC}"
apt-get clean
sleep 3

#This terminal command used to remove packages that were automatically installed to satisfy dependencies for some package and no longer needed by those packages.
echo "${BLUE}Starting with autoremove...${NC}"
apt-get autoremove
sleep 3

#Here we move to the docker dir and stop the containers
echo "${BLUE}Stopping docker containers...${NC}"
cd ~/services/homeserver/ ; docker-compose down
sleep 3

#Here we restart the update the docker containers
echo "${BLUE}Pulling docker containers...${NC}"
cd ~/services/homeserver/ ; docker-compose pull
sleep 3

#Here we start the docker containers again
echo "${BLUE}Starting docker containers...${NC}"
cd ~/services/homeserver/ ; docker-compose up -d
sleep 3

echo "${BLUE}All done, goodbye!${NC}"