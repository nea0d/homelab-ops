#!/usr/bin/env bash
set -e

usage="$(basename "$0") [-h] [-p POD] [-n NAMESPACE]
Force delete 'terminating' pod
where:
    -h  show this help text
    -p  pod name
    -n  pod namespace"

# constants
options=':hp:n:'
while getopts $options option; do
  case "$option" in
    h) echo "$usage"; exit;;
    p) POD=$OPTARG;;
    n) NAMESPACE=$OPTARG;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2; echo "$usage" >&2; exit 1;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2; echo "$usage" >&2; exit 1;;
  esac
done

# mandatory arguments
if [ ! "$POD" ] || [ ! "$NAMESPACE" ]; then
  echo "arguments -p and -n must be provided"
  echo "$usage" >&2; exit 1
fi

kubectl delete pod $POD --grace-period=0 --force --namespace $NAMESPACE
