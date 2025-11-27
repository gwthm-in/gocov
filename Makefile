.PHONY: build build-all clean test

# Default build for current platform
build:
	go build -o gocov ./gocov

# Build for all supported platforms
build-all:
	@echo "Building for all platforms..."
	@mkdir -p dist
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-s -w" -o dist/gocov-linux-amd64 ./gocov
	GOOS=linux GOARCH=arm64 CGO_ENABLED=0 go build -ldflags="-s -w" -o dist/gocov-linux-arm64 ./gocov
	GOOS=darwin GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-s -w" -o dist/gocov-darwin-amd64 ./gocov
	GOOS=darwin GOARCH=arm64 CGO_ENABLED=0 go build -ldflags="-s -w" -o dist/gocov-darwin-arm64 ./gocov
	GOOS=windows GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-s -w" -o dist/gocov-windows-amd64.exe ./gocov
	GOOS=windows GOARCH=arm64 CGO_ENABLED=0 go build -ldflags="-s -w" -o dist/gocov-windows-arm64.exe ./gocov
	@echo "Build complete! Binaries are in ./dist/"

# Run tests
test:
	go test ./...

# Clean build artifacts
clean:
	rm -rf dist gocov gocov.exe

# Install locally
install:
	go install ./gocov

