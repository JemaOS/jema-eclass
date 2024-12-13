# Copyright (c) 2022 Jema Technology .
# Distributed under the license specified in the root directory of this project.

IUSE="${IUSE} noarm64"
OPENJEMA_PREBUILT_PKGS_HOST_URL="${OPENJEMA_PREBUILT_PKGS_HOST_URL:-"https://os-binaries.oss-cn-beijing.aliyuncs.com/packages"}"
JEMABASE_URI="${OPENJEMA_PREBUILT_PKGS_HOST_URL}/${PN}"
AMD64_URI="${JEMABASE_URI}/${PN}-amd64-${PV}.tar.gz"
ARM_URI="${JEMABASE_URI}/${PN}-arm-${PV}.tar.gz"
ARM64_URI="${JEMABASE_URI}/${PN}-arm64-${PV}.tar.gz"

RESTRICT+=" mirror"

SRC_URI="amd64? ( ${AMD64_URI} )
        arm64? ( !noarm64? ( ${ARM64_URI} ) )
        arm64? ( noarm64? ( ${ARM_URI} ) )
        arm?   ( ${ARM_URI} )"

S="${WORKDIR}"
