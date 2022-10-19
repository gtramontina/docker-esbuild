FROM node:19-alpine as build

WORKDIR /opt

COPY package.json .
COPY yarn.lock .
RUN yarn --prod && \
		yarn autoclean --init && \
		yarn autoclean --force && \
		rm package.json yarn.lock .yarnclean

# ---

FROM scratch
COPY --from=build /opt/node_modules/.bin/esbuild /esbuild
WORKDIR /src
ENTRYPOINT ["/esbuild"]
CMD ["--help"]
