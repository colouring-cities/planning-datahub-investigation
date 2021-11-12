autopep8 --in-place --recursive .
pylint *.py --include-naming-hint=y --variable-rgx="^[a-z][a-z0-9]*((_[a-z0-9]+)*)?$" --argument-rgx="^[a-z][a-z0-9]*((_[a-z0-9]+)*)?$" --disable=C0103
