all: build up

YELLOW	=	\033[1;33m
RESET	=	\033[0m

build:
	@echo "${YELLOW}[mkdir /data/wordpress]${RESET}"
	@mkdir -p ~/data/wordpress
	@echo "${YELLOW}[mkdir /data/mariadb]${RESET}"
	@mkdir -p ~/data/mariadb
	@echo "${YELLOW}[docker-compose build]${RESET}"
	@sudo docker-compose -f ./srcs/docker-compose.yml build

up:
	@echo "${YELLOW}[docker-compose up]${RESET}"
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d

down:
	@echo "${YELLOW}[docker-compose down]${RESET}"
	@sudo docker-compose -f ./srcs/docker-compose.yml down

start:
	@echo "${YELLOW}[docker-compose start]${RESET}"
	@sudo docker-compose -f ./srcs/docker-compose.yml start

stop:
	@echo "${YELLOW}[docker-compose stop]${RESET}"
	@sudo docker-compose -f ./srcs/docker-compose.yml stop

logs:
	@echo "${YELLOW}[docker-compose logs]${RESET}"
	@sudo docker-compose -f ./srcs/docker-compose.yml logs

status:
	@echo "${YELLOW}[docker ps]${RESET}"
	@sudo docker ps
	@echo ""
	@echo "${YELLOW}[docker volume ls]${RESET}"
	@sudo docker volume ls
	@echo ""
	@echo "${YELLOW}[docker network ls]${RESET}"
	@sudo docker network ls
	@echo ""
	@echo "${YELLOW}[docker images]${RESET}"
	@sudo docker images

prune:	down
	@echo "${YELLOW}[rmdir data]${RESET}"
	@sudo rm -rf ~/data
	@echo "${YELLOW}[docker system prune]${RESET}"
	@sudo docker system prune -f
	@echo "${YELLOW}[docker volume rm]${RESET}"
	@if [ $(shell sudo docker volume ls -q | wc -l) -ne 0 ]; then \
		sudo docker volume rm $(shell sudo docker volume ls -q); \
	fi
	@echo "${YELLOW}[docker rmi]${RESET}"
	@if [ $(shell sudo docker images -q | wc -l) -ne 0 ]; then \
		sudo docker rmi $(shell sudo docker images -q); \
	fi

re:	prune all

.PHONY:	all build up down start stop logs status prune re
