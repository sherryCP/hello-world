# Use the offical Golang image to create a build artifact.
# https://hub.docker.com/_/golang
FROM golang as builder

# Copy local code to the container image.
WORKDIR /go/src/github.com/haseebh/hello-world
COPY . .

RUN go build -o helloworld-v1 main/helloworld-v1.go

# Use a Docker multi-stage build to create a lean production image.
# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
FROM alpine

COPY --from=builder /go/src/github.com/haseebh/hello-world-v1 /helloworld-v1

ENV PORT 8080

# Run the web service on container startup.
CMD ["/helloworld-v1"]