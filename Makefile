NAME =              prestashop
VERSION =           latest
VERSION_ALIASES =   1.6.1.4 1.6.1 1.6 1
TITLE =             Prestashop
DESCRIPTION =       Prestashop
SOURCE_URL =        https://github.com/scaleway-community/scaleway-prestashop
VENDOR_URL =        https://www.prestashop.com

IMAGE_VOLUME_SIZE =	50G
IMAGE_BOOTSCRIPT =	stable
IMAGE_NAME =		Prestashop 1.6.1.4



## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - https://j.mp/scw-builder | bash
-include docker-rules.mk
