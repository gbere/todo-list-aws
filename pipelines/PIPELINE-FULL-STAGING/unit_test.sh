#!/bin/bash

source todo-list-aws/bin/activate
set -x
export PYTHONPATH="${PYTHONPATH}:$(pwd)"
echo "PYTHONPATH: $PYTHONPATH"
export DYNAMODB_TABLE=todoUnitTestsTable
python test/unit/TestToDo.py || exit 1
pip show coverage
coverage run --include=src/todoList.py test/unit/TestToDo.py
# The -m flag show line numbers of statements in each module that weren't executed
coverage report -m
coverage xml
