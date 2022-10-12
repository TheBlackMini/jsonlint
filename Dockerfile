FROM node:18-alpine

ARG JSONLINT_VERSION
ENV npm_config_loglevel=silent

WORKDIR /data
RUN npm install -g @prantlf/jsonlint@"$JSONLINT_VERSION" ;\
	rm -rf ~/.npm

USER node
ENTRYPOINT [""]

