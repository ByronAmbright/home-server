
# Commands
DOCKER_COMPOSE_COMMAND := docker compose
DOCKER_COMPOSE_ENV_FILE_FLAG := --env-file ./.env
DOCKER_VOLUME_CREATE_COMMAND := docker volume create
DOCKER_VOLUME_REMOVE_COMMAND := docker volume rm
DOCKER_NETWORK_CREATE_COMMAND := docker network create --driver bridge
DOCKER_NETWORK_REMOVE_COMMAND := docker network rm
DOCKER_DEBUG_COMMAND := docker exec -it
DOCKER_BASH_SHELL_COMMAND := bash
DOCKER_NETWORK_DEBUG_COMMAND := docker run -it --network
DOCKER_PULL_COMMAND := docker pull
MAKE_COMMAND := $(MAKE) --no-print-directory --silent
DOCKER_RUN_COMMAND := docker run --rm
TAR_ZIP_COMMAND := sudo tar -cvf

# Files and paths
DOCKER_COMPOSE_FILE := docker-compose.yml
CURRENT_DIR_ABS_PATH := ${CURDIR}

# Suffix For Targets
UP_SUFFIX := -up
DOWN_SUFFIX := -down
PULL_SUFFIX := -pull
LOG_SUFFIX := -log
STATUS_SUFFIX := -status
CREATE_SUFFIX := -create
REMOVE_SUFFIX := -remove
DEBUG_SUFFIX := -debug
UPDATE_AND_RESTART_SUFFIX := -update-and-restart
RESTART_SUFFIX := -restart
BACKUP_SUFFIX := -backup
BACKUP_AND_TAR_SUFFIX := -backup-and-tar

# Other Suffix
VOLUME_SUFFIX := -volume
CONFIG_SUFFIX := -config
VOLUME_CONFIG_SUFFIX := $(VOLUME_SUFFIX)$(CONFIG_SUFFIX)

# Container Names
NGINXPROXYMANAGER := nginx-proxy-manager
PORTAINER := portainer
GLUETUN := gluetun
QBITTORRENT := qbittorrent
JELLYFIN := jellyfin
JELLYSEERR := jellyseerr
SPEEDTEST_TRACKER := speedtest-tracker
SPEEDTEST_TRACKER_VPN := speedtest-tracker-vpn
RADARR := radarr
SONARR := sonarr
PROWLARR := prowlarr
BAZARR := bazarr
FLARESOLVERR := flaresolverr
ACTUAL := actual
FIREFLYIII := fireflyiii
PERSONAL_WEBSITE := personal-website
BOOKSTACK := bookstack
NEXTCLOUD := nextcloud
CALIBRE := calibre
CALIBRE_WEB := calibre-web
MINECRAFT := minecraft

# Networks
DOCKER_NET := docker-net
DOCKER_VPN_NET := docker-vpn-net

NETWORKS := $(DOCKER_NET) $(DOCKER_VPN_NET)

NETWORKS_CREATE := $(addsuffix $(CREATE_SUFFIX),$(NETWORKS))
NETWORKS_REMOVE := $(addsuffix $(REMOVE_SUFFIX),$(NETWORKS))
NETWORKS_DEBUGGABLE := $(addsuffix $(DEBUG_SUFFIX),$(NETWORKS))
NETWORKS_FILTER := $(addsuffix %,$(NETWORKS))

# Volumes
NGINXPROXYMANAGER_CONFIG_VOLUME := $(NGINXPROXYMANAGER)$(VOLUME_CONFIG_SUFFIX)
NGINXPROXYMANAGER_LETSENCRYPT_CONFIG_VOLUME := $(NGINXPROXYMANAGER)-letsencrypt$(VOLUME_CONFIG_SUFFIX)
PORTAINER_CONFIG_VOLUME := $(PORTAINER)$(VOLUME_CONFIG_SUFFIX)
GLUETUN_CONFIG_VOLUME := $(GLUETUN)$(VOLUME_CONFIG_SUFFIX)
QBITTORRENT_CONFIG_VOLUME := $(QBITTORRENT)$(VOLUME_CONFIG_SUFFIX)
QBITTORRENT_DOWNLOAD_VOLUME := $(QBITTORRENT)$(VOLUME_SUFFIX)-downloads
SPEEDTEST_TRACKER_CONFIG_VOLUME := $(SPEEDTEST_TRACKER)$(VOLUME_CONFIG_SUFFIX)
SPEEDTEST_TRACKER_KEYS_VOLUME := $(SPEEDTEST_TRACKER)$(VOLUME_SUFFIX)-keys
SPEEDTEST_TRACKER_VPN_CONFIG_VOLUME := $(SPEEDTEST_TRACKER_VPN)$(VOLUME_CONFIG_SUFFIX)
SPEEDTEST_TRACKER_VPN_KEYS_VOLUME := $(SPEEDTEST_TRACKER_VPN)$(VOLUME_SUFFIX)-keys
JELLYFIN_CONFIG_VOLUME := $(JELLYFIN)$(VOLUME_CONFIG_SUFFIX)
JELLYFIN_CACHE_VOLUME := $(JELLYFIN)$(VOLUME_SUFFIX)-cache
JELLYSEERR_CONFIG_VOLUME := $(JELLYSEERR)$(VOLUME_CONFIG_SUFFIX)
RADARR_CONFIG_VOLUME := $(RADARR)$(VOLUME_CONFIG_SUFFIX)
SONARR_CONFIG_VOLUME := $(SONARR)$(VOLUME_CONFIG_SUFFIX)
PROWLARR_CONFIG_VOLUME := $(PROWLARR)$(VOLUME_CONFIG_SUFFIX)
BAZARR_CONFIG_VOLUME := $(BAZARR)$(VOLUME_CONFIG_SUFFIX)
ACTUAL_CONFIG_VOLUME := $(ACTUAL)$(VOLUME_CONFIG_SUFFIX)
FIREFLYIII_DB_VOLUME := $(FIREFLYIII)$(VOLUME_SUFFIX)-db
FIREFLYIII_UPLOAD_VOLUME := $(FIREFLYIII)$(VOLUME_SUFFIX)-upload
BOOKSTACK_CONFIG_VOLUME := $(BOOKSTACK)$(VOLUME_CONFIG_SUFFIX)
BOOKSTACK_MARIADB_CONFIG_VOLUME := $(BOOKSTACK)-mariadb$(VOLUME_CONFIG_SUFFIX)
NEXTCLOUD_CONFIG_VOLUME := $(NEXTCLOUD)$(VOLUME_CONFIG_SUFFIX)
NEXTCLOUD_DATA_VOLUME := $(NEXTCLOUD)$(VOLUME_SUFFIX)-data
NEXTCLOUD_MARIADB_DATA_VOLUME := $(NEXTCLOUD)-mariadb$(VOLUME_SUFFIX)-data
CALIBRE_CONFIG_VOLUME := $(CALIBRE)$(VOLUME_CONFIG_SUFFIX)
CALIBRE_WEB_CONFIG_VOLUME := $(CALIBRE_WEB)$(VOLUME_CONFIG_SUFFIX)
MINECRAFT_DATA_VOLUME := $(MINECRAFT)-vanilla$(VOLUME_SUFFIX)-data

ADMIN_VOLUMES := $(NGINXPROXYMANAGER_CONFIG_VOLUME) $(NGINXPROXYMANAGER_LETSENCRYPT_CONFIG_VOLUME) $(PORTAINER_CONFIG_VOLUME)
MEDIA_VOLUMES := $(JELLYFIN_CONFIG_VOLUME) $(JELLYFIN_CACHE_VOLUME) $(JELLYSEERR_CONFIG_VOLUME) $(RADARR_CONFIG_VOLUME) $(SONARR_CONFIG_VOLUME) $(PROWLARR_CONFIG_VOLUME) $(BAZARR_CONFIG_VOLUME) $(CALIBRE_CONFIG_VOLUME) $(CALIBRE_WEB_CONFIG_VOLUME)
TORRENT_VOLUMES := $(QBITTORRENT_CONFIG_VOLUME) $(QBITTORRENT_DOWNLOAD_VOLUME)
VPN_VOLUMES := $(GLUETUN_CONFIG_VOLUME)
UTIL_VOLUMES := $(SPEEDTEST_TRACKER_CONFIG_VOLUME) $(SPEEDTEST_TRACKER_KEYS_VOLUME) $(SPEEDTEST_TRACKER_VPN_CONFIG_VOLUME) $(SPEEDTEST_TRACKER_VPN_KEYS_VOLUME)
FINANCIAL_VOLUMES := $(ACTUAL_CONFIG_VOLUME) $(FIREFLYIII_DB_VOLUME) $(FIREFLYIII_UPLOAD_VOLUME)
OTHER_VOLUMES := ${BOOKSTACK_CONFIG_VOLUME} ${BOOKSTACK_MARIADB_CONFIG_VOLUME} ${NEXTCLOUD_CONFIG_VOLUME} ${NEXTCLOUD_DATA_VOLUME} ${NEXTCLOUD_MARIADB_DATA_VOLUME} ${MINECRAFT_DATA_VOLUME}

VOLUMES := $(ADMIN_VOLUMES) $(MEDIA_VOLUMES) $(TORRENT_VOLUMES) $(VPN_VOLUMES) $(FINANCIAL_VOLUMES) $(UTIL_VOLUMES) $(OTHER_VOLUMES)

VOLUMES_CREATE := $(addsuffix $(CREATE_SUFFIX),$(VOLUMES))
VOLUMES_REMOVE := $(addsuffix $(REMOVE_SUFFIX),$(VOLUMES))
VOLUMES_BACKUP := $(addsuffix $(BACKUP_SUFFIX),$(VOLUMES))
VOLUMES_BACKUP_AND_TAR := $(addsuffix $(BACKUP_AND_TAR_SUFFIX),$(VOLUMES))
VOLUMES_FILTER := $(addsuffix %,$(VOLUMES))

# Services Groups
ADMIN_SERVICES := $(NGINXPROXYMANAGER) $(PORTAINER)
MEDIA_SERVICES := $(JELLYFIN) $(JELLYSEERR) $(RADARR) $(SONARR) $(PROWLARR) $(BAZARR) $(FLARESOLVERR) $(CALIBRE) $(CALIBRE_WEB)
TORRENT_SERVICES := $(QBITTORRENT)
VPN_SERVICES := $(GLUETUN)
FINANCIAL_SERVICES := $(ACTUAL) $(FIREFLYIII)
UTIL_SERVICES := $(SPEEDTEST_TRACKER) $(SPEEDTEST_TRACKER_VPN)
OTHER_SERVICES := $(PERSONAL_WEBSITE) $(BOOKSTACK) ${NEXTCLOUD} ${MINECRAFT} 

SERVICES := $(ADMIN_SERVICES) $(MEDIA_SERVICES) $(TORRENT_SERVICES) $(VPN_SERVICES) $(FINANCIAL_SERVICES) $(UTIL_SERVICES) $(OTHER_SERVICES)
NONDEBUGGABLE_SERVICES := $(PORTAINER)
SERVICES_UNDER_VPN_UNFILTERED = $(MEDIA_SERVICES) $(TORRENT_SERVICES) $(UTIL_SERVICES)
SERVICES_TO_FILTER_OUT_FROM_UNDER_VPN := $(JELLYFIN) $(SPEEDTEST_TRACKER) $(CALIBRE) $(CALIBRE_WEB)
SERVICES_UNDER_VPN := $(filter-out $(SERVICES_TO_FILTER_OUT_FROM_UNDER_VPN), $(SERVICES_UNDER_VPN_UNFILTERED))
DEBUGGABLE_SERVICES := $(filter-out $(NONDEBUGGABLE_SERVICES), $(SERVICES))

SERVICES_UP := $(addsuffix $(UP_SUFFIX),$(SERVICES))
SERVICES_DOWN := $(addsuffix $(DOWN_SUFFIX),$(SERVICES))
SERVICES_PULL := $(addsuffix $(PULL_SUFFIX),$(SERVICES))
SERVICES_LOG := $(addsuffix $(LOG_SUFFIX),$(SERVICES))
SERVICES_STATUS := $(addsuffix $(STATUS_SUFFIX),$(SERVICES))
SERVICES_UPDATE_AND_RESTART_SUFFIX := $(addsuffix $(UPDATE_AND_RESTART_SUFFIX),$(SERVICES))
SERVICES_RESTART := $(addsuffix $(RESTART_SUFFIX),$(SERVICES))
SERVICES_DEBUGGABLE := $(addsuffix $(DEBUG_SUFFIX), $(DEBUGGABLE_SERVICES))

ADMIN_SERVICES_FILTER := $(addsuffix %,$(ADMIN_SERVICES))
MEDIA_SERVICES_FILTER := $(addsuffix %,$(MEDIA_SERVICES))
TORRENT_SERVICES_FILTER := $(addsuffix %,$(TORRENT_SERVICES))
VPN_SERVICES_FILTER := $(addsuffix %,$(VPN_SERVICES))
SERVICES_UNDER_VPN_FILTER := $(addsuffix %,$(SERVICES_UNDER_VPN))
FINANCIAL_SERVICES_FILTER := $(addsuffix %,$(FINANCIAL_SERVICES))
UTIL_SERVICES_FILTER := $(addsuffix %,$(UTIL_SERVICES))
OTHER_SERVICES_FILTER := $(addsuffix %,$(OTHER_SERVICES))

# Templates:
up: ## Start c=<container name> container
	@echo "Starting container: $(c)"
	@$(DOCKER_COMPOSE_COMMAND) $(DOCKER_COMPOSE_ENV_FILE_FLAG) -f docker/$(c)/$(DOCKER_COMPOSE_FILE) up -d

down: ## Stop c=<container name> container
	@echo "Stopping container: $(c)"
	@$(DOCKER_COMPOSE_COMMAND) $(DOCKER_COMPOSE_ENV_FILE_FLAG) -f docker/$(c)/$(DOCKER_COMPOSE_FILE) down

pull: ## Pull latest image of c=<container name> container
	@echo "Pulling latest for container: $(c)"
	@$(DOCKER_COMPOSE_COMMAND) $(DOCKER_COMPOSE_ENV_FILE_FLAG) -f docker/$(c)/$(DOCKER_COMPOSE_FILE) pull

logs: ## Show logs of c=<container name> container
	@echo "Showing logs for container: $(c)"
	@$(DOCKER_COMPOSE_COMMAND) $(DOCKER_COMPOSE_ENV_FILE_FLAG) -f docker/$(c)/$(DOCKER_COMPOSE_FILE) logs --tail=100

status: ## Show status of c=<container name> container
	@echo "Pulling status for container: $(c)"
	@$(DOCKER_COMPOSE_COMMAND) $(DOCKER_COMPOSE_ENV_FILE_FLAG) -f docker/$(c)/$(DOCKER_COMPOSE_FILE) ps

clean: ## Clean all data of c=<container name> container
	@echo "Cleaning all data for container: $(c)"
	@$(DOCKER_COMPOSE_COMMAND) $(DOCKER_COMPOSE_ENV_FILE_FLAG) -f docker/$(c)/$(DOCKER_COMPOSE_FILE) down

restart: ## Restart c=<container name> container
	@echo "Restarting container: $(c)"
	@$(MAKE_COMMAND) down c=$(c)
	@$(MAKE_COMMAND) up c=$(c)

update-and-restart: ## Pull Image and Restart c=<container name> container
	@echo "Updating and restarting container: $(c)"
	@$(MAKE_COMMAND) pull c=$(c)
	@$(MAKE_COMMAND) restart c=$(c)

debug: ## "SSH" into c=<container name> container
	@echo "Debugging into container: $(c)"
	@$(DOCKER_DEBUG_COMMAND) $(c) bash

volume-create: ## Create v=<volume name> volume
	@echo "Creating volume: $(v)"
	@$(DOCKER_VOLUME_CREATE_COMMAND) $(v)

volume-remove: ## Remove v=<volume name> volume
	@echo "Removing volume: $(v)"
	@$(DOCKER_VOLUME_REMOVE_COMMAND) $(v)

volume-migrate: ## Copy v=<volume name> volume into d=<destination name> destination. d can be a path or a volume name
	@echo "Copying volume from: $(v) to $(v1)"
	@$(DOCKER_RUN_COMMAND) -v $(v):/original -v $(v1):/migration ubuntu bash -c "cp -R /original/* /migration/"

volume-migrate-and-delete: ## Copy v=<volume name> volume into v1=<volume name> volume and then delete original volume
	@$(MAKE_COMMAND) volume-migrate v=$(v) v1=$(v1)
	@$(MAKE_COMMAND) volume-remove v=$(v)

volume-backup: ## Backup v=<volume name> volume into $(pwd)/backups/$(v)-backup
	$(eval BACKUP_PATH := $(CURRENT_DIR_ABS_PATH)/backups/volumes/$(v)-backup)
	@echo "Backing up volume: $(v) to $(BACKUP_PATH)"
	@$(MAKE_COMMAND) volume-migrate v=$(v) v1=$(BACKUP_PATH)

volume-backup-and-tar: ## Backup and tar v=<volume name> volume into $(pwd)/backups/$(v)-backup/$(v)-backup.tar.gz
	$(eval BACKUP_PATH := $(CURRENT_DIR_ABS_PATH)/backups/volumes/$(v)-backup)
	$(eval TAR_GZ_PATH := $(CURRENT_DIR_ABS_PATH)/backups/$(v)-backup.tar.gz)
	@echo "Making a .tar.gz of volume: $(v) at $(TAR_GZ_PATH)"
	@$(MAKE_COMMAND) volume-migrate v=$(v) v1=$(BACKUP_PATH)
	@$(TAR_ZIP_COMMAND) $(TAR_GZ_PATH) $(BACKUP_PATH)

network-create: ## Create n=<network name> network
	@echo "Creating network: $(n)"
	@$(DOCKER_NETWORK_CREATE_COMMAND) $(n)

network-remove: ## Remove n=<network name> network
	@echo "Removing network: $(n)"
	@$(DOCKER_NETWORK_REMOVE_COMMAND) $(n)

debug-network: ## "SSH" into a alpine container with n=<network name> network
	@echo "Debugging into alpine container on network: $(n)"
	@$(DOCKER_NETWORK_DEBUG_COMMAND) --network $(n) ubuntu bash

pull-image: ## Pull i=<image name> image
	@echo "Pulling image: $(i)"
	@$(DOCKER_PULL_COMMAND) $(i)

# Individual Services Commands
$(SERVICES_UP):
	$(eval CONTAINER := $(patsubst %$(UP_SUFFIX), %, $@))
	@$(MAKE_COMMAND) up c=$(CONTAINER)

$(SERVICES_DOWN):
	$(eval CONTAINER := $(patsubst %$(DOWN_SUFFIX), %, $@))
	@$(MAKE_COMMAND) down c=$(CONTAINER)

$(SERVICES_PULL):
	$(eval CONTAINER := $(patsubst %$(PULL_SUFFIX), %, $@))
	@$(MAKE_COMMAND) pull c=$(CONTAINER)

$(SERVICES_LOG):
	$(eval CONTAINER := $(patsubst %$(LOG_SUFFIX), %, $@))
	@$(MAKE_COMMAND) logs c=$(CONTAINER)

$(SERVICES_STATUS):
	$(eval CONTAINER := $(patsubst %$(STATUS_SUFFIX), %, $@))
	@$(MAKE_COMMAND) status c=$(CONTAINER)

$(SERVICES_DEBUGGABLE):
	$(eval CONTAINER := $(patsubst %$(DEBUG_SUFFIX), %, $@))
	@$(MAKE_COMMAND) debug c=$(CONTAINER)

$(SERVICES_UPDATE_AND_RESTART_SUFFIX):
	$(eval CONTAINER := $(patsubst %$(UPDATE_AND_RESTART_SUFFIX), %, $@))
	@$(MAKE_COMMAND) update-and-restart c=$(CONTAINER)

$(SERVICES_RESTART):
	$(eval CONTAINER := $(patsubst %$(RESTART_SUFFIX), %, $@))
	@$(MAKE_COMMAND) restart c=$(CONTAINER)

$(NETWORKS_CREATE):
	$(eval NETWORK := $(patsubst %$(CREATE_SUFFIX), %, $@))
	@$(MAKE_COMMAND) network-create n=$(NETWORK)

$(NETWORKS_REMOVE):
	$(eval NETWORK := $(patsubst %$(REMOVE_SUFFIX), %, $@))
	@$(MAKE_COMMAND) network-remove n=$(NETWORK)

$(NETWORKS_DEBUGGABLE):
	$(eval NETWORK := $(patsubst %$(DEBUG_SUFFIX), %, $@))
	@$(MAKE_COMMAND) debug-network n=$(NETWORK)

$(VOLUMES_CREATE):
	$(eval VOLUME := $(patsubst %$(CREATE_SUFFIX), %, $@))
	@$(MAKE_COMMAND) volume-create v=$(VOLUME)

$(VOLUMES_REMOVE):
	$(eval VOLUME := $(patsubst %$(REMOVE_SUFFIX), %, $@))
	@$(MAKE_COMMAND) volume-remove v=$(VOLUME)

$(VOLUMES_BACKUP):
	$(eval VOLUME := $(patsubst %$(BACKUP_SUFFIX), %, $@))
	@$(MAKE_COMMAND) volume-backup v=$(VOLUME)

$(VOLUMES_BACKUP_AND_TAR):
	$(eval VOLUME := $(patsubst %$(BACKUP_AND_TAR_SUFFIX), %, $@))
	@$(MAKE_COMMAND) volume-backup-and-tar v=$(VOLUME)


# Multiple Target Commands
all-up: $(SERVICES_UP)
all-down: $(SERVICES_DOWN)
all-pull: $(SERVICES_PULL)
all-update-and-restart: $(SERVICES_UPDATE_AND_RESTART_SUFFIX)
all-restart: $(SERVICES_RESTART)

admin-up: $(filter $(ADMIN_SERVICES_FILTER), $(SERVICES_UP))
admin-down: $(filter $(ADMIN_SERVICES_FILTER), $(SERVICES_DOWN))
admin-pull: $(filter $(ADMIN_SERVICES_FILTER), $(SERVICES_PULL))
admin-update-and-restart: $(filter $(ADMIN_SERVICES_FILTER), $(SERVICES_UPDATE_AND_RESTART_SUFFIX))
admin-restart: $(filter $(ADMIN_SERVICES_FILTER), $(SERVICES_RESTART))

vpn-up: $(filter $(VPN_SERVICES_FILTER), $(SERVICES_UP))
vpn-down: $(filter $(VPN_SERVICES_FILTER), $(SERVICES_DOWN))
vpn-pull: $(filter $(VPN_SERVICES_FILTER), $(SERVICES_PULL))
vpn-update-and-restart: $(filter $(VPN_SERVICES_FILTER), $(SERVICES_UPDATE_AND_RESTART_SUFFIX))
vpn-restart: $(filter $(VPN_SERVICES_FILTER), $(SERVICES_RESTART))

services-under-vpn-up: $(filter $(SERVICES_UNDER_VPN_FILTER), $(SERVICES_UP))
services-under-vpn-down: $(filter $(SERVICES_UNDER_VPN_FILTER), $(SERVICES_DOWN))
services-under-vpn-pull: $(filter $(SERVICES_UNDER_VPN_FILTER), $(SERVICES_PULL))
services-under-vpn-update-and-restart: $(filter $(SERVICES_UNDER_VPN_FILTER), $(SERVICES_UPDATE_AND_RESTART_SUFFIX))
services-under-vpn-restart: $(filter $(SERVICES_UNDER_VPN_FILTER), $(SERVICES_RESTART))

torrent-up: $(filter $(TORRENT_SERVICES_FILTER), $(SERVICES_UP))
torrent-down: $(filter $(TORRENT_SERVICES_FILTER), $(SERVICES_DOWN))
torrent-pull: $(filter $(TORRENT_SERVICES_FILTER), $(SERVICES_PULL))
torrent-update-and-restart: $(filter $(TORRENT_SERVICES_FILTER), $(SERVICES_UPDATE_AND_RESTART_SUFFIX))
torrent-restart: $(filter $(TORRENT_SERVICES_FILTER), $(SERVICES_RESTART))

media-up: $(filter $(MEDIA_SERVICES_FILTER), $(SERVICES_UP))
media-down: $(filter $(MEDIA_SERVICES_FILTER), $(SERVICES_DOWN))
media-pull: $(filter $(MEDIA_SERVICES_FILTER), $(SERVICES_PULL))
media-update-and-restart: $(filter $(MEDIA_SERVICES_FILTER), $(SERVICES_UPDATE_AND_RESTART_SUFFIX))
media-restart: $(filter $(MEDIA_SERVICES_FILTER), $(SERVICES_RESTART))

finance-up: $(filter $(FINANCIAL_SERVICES_FILTER), $(SERVICES_UP))
finance-down: $(filter $(FINANCIAL_SERVICES_FILTER), $(SERVICES_DOWN))
finance-pull: $(filter $(FINANCIAL_SERVICES_FILTER), $(SERVICES_PULL))
finance-update-and-restart: $(filter $(FINANCIAL_SERVICES_FILTER), $(SERVICES_UPDATE_AND_RESTART_SUFFIX))
finance-restart: $(filter $(FINANCIAL_SERVICES_FILTER), $(SERVICES_RESTART))

other-up: $(filter $(OTHER_SERVICES_FILTER), $(SERVICES_UP))
other-down: $(filter $(OTHER_SERVICES_FILTER), $(SERVICES_DOWN))
other-pull: $(filter $(OTHER_SERVICES_FILTER), $(SERVICES_PULL))
other-update-and-restart: $(filter $(OTHER_SERVICES_FILTER), $(SERVICES_UPDATE_AND_RESTART_SUFFIX))
other-restart: $(filter $(OTHER_SERVICES_FILTER), $(SERVICES_RESTART))

create-all-networks: $(NETWORKS_CREATE)
remove-all-networks: $(NETWORKS_REMOVE)

create-all-volumes: $(VOLUMES_CREATE)
remove-all-volumes: $(VOLUMES_REMOVE)
backup-all-volumes: $(VOLUMES_BACKUP)
backup-and-tar-all-volumes: $(VOLUMES_BACKUP_AND_TAR)

# Images
pull-ubuntu-image:
	@$(MAKE_COMMAND) pull-image i=ubuntu:latest

# General Setup
setup-repo: pull-ubuntu-image $(SERVICES_PULL) create-all-networks create-all-volumes
