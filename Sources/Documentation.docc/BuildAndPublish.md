# Build and publish the guide

## Build locally

From the repository root, build the static site:

```sh
swift package --allow-writing-to-directory .build/docc \
  generate-documentation --target numio --output-path .build/docc \
  --symbol-graph-minimum-access-level public \
  --transform-for-static-hosting --hosting-base-path numio-cli
```

Preview the documentation while editing:

```sh
swift package --disable-sandbox preview-documentation --target numio \
  --symbol-graph-minimum-access-level public
```

## Publish with GitHub Pages

The Documentation workflow builds on pull requests and deploys after changes reach `main`. To enable publishing:

1. In repository **Settings > Pages**, set the build and deployment source to **GitHub Actions**.
2. In **Settings > Environments**, create `github-pages`.
3. Restrict the environment to the `main` branch. Add required reviewers if deployments should need approval.

The workflow uses the `github-pages` environment and grants deployment permissions only to the deployment job. GitHub Pages deployment settings are repository configuration and must be enabled by a maintainer.
