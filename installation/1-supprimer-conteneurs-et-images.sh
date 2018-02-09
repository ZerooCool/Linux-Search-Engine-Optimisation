#!/bin/bash
echo "  "
echo "  "

echo " ----- Arrêt des conteneurs ----- "
docker stop $(docker ps -a -q)
echo " ----- Suppression des conteneurs ----- "
docker rm $(docker ps -a -q)
echo " ----- Suppression des images ----- "
docker rmi $(docker images -q)
