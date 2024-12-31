NAME := raftadmin
DESCRIPTION := Hashicorp Raft cluster administration tool.
COPYRIGHT := 2024 © Andrea Funtò
LICENSE := MIT
LICENSE_URL := https://opensource.org/license/mit/
VERSION_MAJOR := 0
VERSION_MINOR := 0
VERSION_PATCH := 1
VERSION=$(VERSION_MAJOR).$(VERSION_MINOR).$(VERSION_PATCH)
MAINTAINER=dihedron.dev@gmail.com
VENDOR=dihedron.dev@gmail.com
PRODUCER_URL=https://github.com/dihedron/
DOWNLOAD_URL=$(PRODUCER_URL)raftadmin
METADATA_PACKAGE=$$(grep "module .*" go.mod | sed 's/module //gi')/version

_RULES_MK_MINIMUM_VERSION=202412061025
_RULES_MK_ENABLE_CGO=1
_RULES_MK_ENABLE_GOGEN=1
_RULES_MK_ENABLE_RACE=1
#_RULES_MK_STATIC_LINK=1
#_RULES_MK_ENABLE_NETGO=1
#_RULES_MK_STRIP_SYMBOLS=1
#_RULES_MK_STRIP_DBG_INFO=1
#_RULES_MK_FORCE_DEP_REBUILD=1

include rules.mk

.PHONY: clean-cache ## remove all cached build entries
clean-cache:
	@go clean -x -cache
	
.PHONY: proto
proto: proto/raftadmin.proto ## compile the protocol buffer files
	@rm -f proto/raftadmin.pb.go proto/raftadmin_grpc.pb.go
	@protoc --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative proto/raftadmin.proto
