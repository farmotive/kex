The purpose of kex is to provide an opinionated executor into a kubernetes container.  Traditionally, if one wanted to exec into a kubernetes container, one had to `kubectl get pods --namespace foo`, visually identify the pod of interest, copy that pod to the buffer, and then `kubectl --namespace foo exec -it <paste_buffer> bash` to exec in to the pod.  This simple utility aims to provide a namespace-specific pod selector for quick execution.

# kex

kex is a pod exec utility.

```
USAGE:
  kex             : exec in to the default pod
  kex ls,list     : list the available pods
  kex <NUM>       : exec into a specified pod
  kex -h,--help   : show this message
```

### USAGE

```sh
$ kex ls
NAME                                      SELECTOR
365bass-dt1nb                             1 [default]
esp-echo-546159305-mh4gq                  2
livewell-frontend-3514659123-hq60x        3
livewell-frontend-3514659123-jqdrq        4
livewell-frontend-3514659123-wm77l        5
livewell-redis-3260658712-rstr5           6
livewell-worker-715121025-7k6s9           7
livewell-worker-715121025-z90zs           8
minecraft-1545301362-rf1s5                9

$ kex
root@365bass-dt1nb:/#

$ kex 5
root@livewell-frontend-3514659123-wm77l:/app#
```

## Installation

**For macOS:**

TODO: kex in Homebrew!

> Use the [Homebrew](https://brew.sh/) package manager:
>
>     brew install kex
>
> this will also set up bash/zsh completion scripts automatically.

**Other platforms:**

- Download the `kex` script
- Add it somewhere in your PATH
- Make it executable (`chmod +x`)
- You can also install bash/zsh [completion scripts](completion/) manually.

-----

Disclaimer: This is not an official Google product.

Thanks to [ahmetb](https://github.com/ahmetb) for the inspiration!
