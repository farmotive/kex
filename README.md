The purpose of kex is to provide an opinionated executor into a kubernetes container.  Traditionally, if one wanted to exec into a kubernetes container, one had to `kubectl get pods --namespace foo`, visually identify the pod of interest, copy that pod to the buffer, and then `kubectl --namespace foo exec -it <paste_buffer> bash` to exec into the pod.  Moreover, if the pod has n+1 containers, one had to identify the container of interest and pass this variable with the -c flag.  This simple utility aims to provide a namespace-specific pod selector for quick execution.

# kex

```sh
kex(1)

NAME
    kex - Quick k8s pod exec utility.

REQUIRES
    kubectl(1)

SYNOPSIS
    kex [OPTIONS]

DESCRIPTION
    kex is a quick kubernetes (k8s) utility to exec into a pod. kex prompts for:
    - <NAMESPACE> (defaults to current ns. See kubens(1))
    - <POD> (defaults to "1")
    - <CONTAINER> (If the pod has only one container, this prompt is omitted, and the "COMAND" prompt is presented.  
        If the pod has multiple containers, you will be prompted to select one.)
    - <COMMAND> (defaults to bash)
  ENTER to use defaults.

OPTIONS
    -h, --help
        Show this help message

SEE ALSO
    kubectx(1), kubens(1)
```

### USAGE

```sh
$ kex
Namespace? (default qux):
    1 qux
    2 quux
    3 quuz
    4 corge
    5 grault
    6 garply
    7 waldo
    8 fred
    9 plugh
    10 xyzzy
    11 thud
4
Pod number? (default 1):
    1 foo-drupal: running
    2 bar-mariadb: running
    3 baz-alpine: pending
2
Container number? (default 1):
     1	mariadb
     2	sidecar
1
Command? (default bash)
mysql

Welcome to the MariaDB monitor.  Commands end with ; or \g.
MariaDB [NAME]>
```

## Installation

**Use the [Homebrew](https://brew.sh/) package manager:**
```sh
brew tap farmotive/k8s
brew install kex
```
**NOTE:** If using gcloud sdk to manage the installation and versioning of `kubectl`, install with the `--without-kubernetes-cli` flag to omit the brew dependency:
```sh
brew install kex --without-kubernetes-cli
```

See [farmotive homebrew k8s install section](https://github.com/farmotive/homebrew-k8s#install) for more options.

**Or simply grab the binary:**

- Download the `kex` script
- Add it somewhere in your PATH
- Make it executable (`chmod +x`)

-----

Thanks to [ahmetb](https://github.com/ahmetb) for the inspiration!
