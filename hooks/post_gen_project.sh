#!/bin/sh

set -e

git init
cd app
exec pod install
exec synx --no-sort-by-name "{{ cookiecutter.project_name | replace(' ', '') }}.xcodeproj"



