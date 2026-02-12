# GitHub Release Example

This example demonstrates how to use Makes to build cross-platform binaries
from YAMLScript programs and publish them as GitHub releases.

The Makefile for this example is:

```make
M := .cache/makes
$(shell [ -d $M ] || git clone -q https://github.com/makeplus/makes $M)
include $M/init.mk
include $M/gloat.mk
include $M/clean.mk
MAKES-CLEAN := dist
```

## What This Example Does

The [`dragon-curve.ys`](https://rosettacode.org/wiki/Dragon_curve#YAMLScript)
program generates a dragon curve fractal pattern.
This example shows how to compile it into native Go binaries for multiple
platforms and create a GitHub release with those binaries.

## Prerequisites

For authentication, one of:
- `GITHUB_TOKEN` environment variable (automatic in GitHub Actions)
- `GITHUB-TOKEN` make variable
- `~/.github-api-token` file containing your GitHub token
- Run `gh auth login` to authenticate interactively

## Building Binaries

To build cross-platform binaries without releasing:

```bash
make gloat-bin FILE=dragon-curve.ys
```

This creates binaries in the `dist/` directory:
- `dragon-curve-linux-amd64`
- `dragon-curve-linux-arm64`
- `dragon-curve-darwin-amd64`
- `dragon-curve-darwin-arm64`
- `dragon-curve-windows-amd64.exe`

## Creating a GitHub Release

To build binaries and create a GitHub release:

```bash
make gloat-github-release FILE=dragon-curve.ys VERSION=0.1.0
```

This will:
1. Build all platform binaries
2. Create a git tag `v0.1.0` (if it doesn't exist)
3. Create a GitHub release with auto-generated release notes
4. Upload all binaries to the release

## Customizing Platforms

To build for specific platforms, create `.makes/gloat.config`:

```yaml
platforms:
- linux/amd64
- darwin/arm64
```

This overrides the default platform list.

## Cleaning Up

To remove built binaries:

```bash
make clean
```
