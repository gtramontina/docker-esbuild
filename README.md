## Docker image for [`esbuild`](https://esbuild.github.io)

Package information: [pkgs/container/esbuild](https://github.com/gtramontina/docker-esbuild/pkgs/container/esbuild)

### _Running:_

```sh
docker run -i --rm -v $(pwd):/src ghcr.io/gtramontina/esbuild:<version> [esbuild-arguments]
```

The `/src` directory is where your source code will be mounted to.

### _Developing:_

```sh
make build    # Builds a new image
make test     # Runs/tests the image
make push     # Pushes the image up
make clean    # Removes any generated artifacts
make clobber  # Removes artifacts and generated images
```

---

<p align="right">
	<a href="https://github.com/gtramontina/docker-esbuild/actions/workflows/build.yml"><img height="20" alt="Build image" src="https://img.shields.io/github/workflow/status/gtramontina/docker-esbuild/Build%20image?label=%F0%9F%93%A6%20Build%20image&style=for-the-badge"></a>
</p>
