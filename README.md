The purpose of kex is to provide an opinionated executor into a kubernetes container.  Traditionally, if one wanted to exec into a kubernetes container, one had to `kubectl get pods --namespace foo`, visually identify the pod of interest, copy that pod to the buffer, and then `kubectl --namespace foo exec -it <paste_buffer> bash` to exec in to the pod.  This simple utility aims to provide a namespace-specific pod selector for quick execution.

# kex

kex(1)

NAME
    kex - Quick k8s pod exec utility.

REQUIRES
    kubectl(1)

SYNOPSIS
    kex [-n <NUMBER>|1] [-c <COMMAND>|bash] [OPTIONS]

DESCRIPTION
    kex is a quick kubernetes (k8s) utility to exec into a pod.

OPTIONS

    -l, --list
        List available pods

    -n, --number
        Specify the pod number in the list to exec into. Default to "1"

    -c, --command
        Specify an alternative exec command. Defaults to "bash"
        
    -h, --help
        Show this help message

SEE ALSO
    kubectx(1), kubens(1)

### USAGE

```sh
$ kex -l
1           365bass-dt1nb
2           esp-echo-546159305-mh4gq
3           livewell-frontend-3514659123-hq60x
4           livewell-frontend-3514659123-jqdrq
5           livewell-frontend-3514659123-wm77l
6           livewell-redis-3260658712-rstr5
7           livewell-worker-715121025-7k6s9
8           livewell-worker-715121025-z90zs
9           minecraft-1545301362-rf1s5

$ kex
root@365bass-dt1nb:/#

$ kex -n 5
root@livewell-frontend-3514659123-wm77l:/app#

$ kex -n 9 -c uname
Linux
```

## Installation

**For macOS:**

Use the [Homebrew](https://brew.sh/) package manager:
```sh
brew tap farmotive/k8s
brew install kex
```
See [farmotive homebrew k8s install section](https://github.com/farmotive/homebrew-k8s#install) for more options.

**Other platforms:**

- Download the `kex` script
- Add it somewhere in your PATH
- Make it executable (`chmod +x`)

-----

Disclaimer: This is not an official Google product.

Thanks to [ahmetb](https://github.com/ahmetb) for the inspiration!
