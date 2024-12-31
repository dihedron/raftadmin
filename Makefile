
.PHONY: build
build:
	go build ./cmd/raftadmin
	
.PHONY: proto
proto: proto/raftadmin.proto ## compile the protocol buffer files
	@rm -f proto/raftadmin.pb.go proto/raftadmin_grpc.pb.go
	@protoc --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative proto/raftadmin.proto
