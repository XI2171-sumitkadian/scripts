wget https://github.com/openshift/okd/releases/download/4.7.0-0.okd-2021-04-24-103438/openshift-client-linux-4.7.0-0.okd-2021-04-24-103438.tar.gz
tar -xvf openshift-client-linux-4.7.0-0.okd-2021-04-24-103438.tar.gz -C /usr/bin/ 

(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz" &&
  tar zxvf krew.tar.gz &&
  KREW=./krew-"${OS}_${ARCH}" &&
  "$KREW" install krew
)

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
