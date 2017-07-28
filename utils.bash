get_pods() {
  kubectl get pods -o=jsonpath='{range .items[*].metadata.name}{@}{"\n"}{end}'
}
