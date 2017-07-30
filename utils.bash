pod_def(){
  kubectl get pods -o=jsonpath='{range .items[*].metadata.name}{@}{"\n"}{end}' | nl
  exit 0
}

pod_default(){
  kubectl get pods -o=jsonpath='{range .items[*].metadata.name}{@}{"\n"}{end}' | sed -n 1p
}

kube_def_bash(){
  kubectl exec -it $(pod_default) bash
}

kube_def_sh(){
  kubectl exec -it $(pod_default) sh
}
