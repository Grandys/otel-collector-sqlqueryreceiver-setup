download_ocb_if_missing:
	# Onlu intel macos
	test -f ocb || curl --proto '=https' --tlsv1.2 -fL -o ocb \
    https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/cmd%2Fbuilder%2Fv0.109.0/ocb_0.109.0_darwin_amd64 \
    && chmod +x ocb

build: download_ocb_if_missing
	./ocb --config builder-config.yaml \
	&& cp otelcol-dev/otel-collector-custom otel-collector-custom

start_compose:
	docker-compose up --detach

run: start_compose
	./otel-collector-custom --config otel-collector-config.yaml

run_rebuild: build run

run_contrib:
	docker-compose up --profiles otel-contrib

clean:
	docker-compose down -v && rm -f otel-collector-custom

clean_all: clean
	rm -f ocb && rm -rf otelcol-dev