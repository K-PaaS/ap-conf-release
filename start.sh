bosh create-release --sha2 --force --tarball ./ap-conf-1.0.0.tgz --name ap-conf --version 1.0.0


bosh upload-release ./ap-conf-1.0.0.tgz
