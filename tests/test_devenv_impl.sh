#!/bin/bash

echo "*** test file: $(basename ${BASH_SOURCE[0]})"

test_devenv_namemunge() {
  mypath=path1
  assertEquals "path1" "$mypath"
  . ${DEVENVROOT}/scripts/env.d/devenv_impl
  devenv_namemunge mypath path2
  assertEquals "path2:path1" "$mypath"
  devenv_namemunge mypath path3 after
  assertEquals "path2:path1:path3" "$mypath"
}

test_devenv_nameremove() {
  mypath=path2:path1:path3
  assertEquals "path2:path1:path3" "$mypath"
  . ${DEVENVROOT}/scripts/env.d/devenv_impl
  devenv_nameremove mypath path1
  assertEquals "path2:path3" "$mypath"
  devenv_nameremove mypath path2
  assertEquals "path3" "$mypath"
}

# Load and run shUnit2.
. ./shunit2/shunit2

# vim: set et nu nobomb fenc=utf8 ft=bash ff=unix sw=2 ts=2:
