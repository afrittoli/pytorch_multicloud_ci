#!/bin/sh
#
TEX_FILENAME=${TEX_FILENAME:-collaborative_infra}
MODE=${1:-full}  # draft or full
ENGINE=${2:-lualatex}  # lualatex (default) or xelatex

if [ ! -d tikz-cache ]; then
  mkdir tikz-cache
fi

# Reproducible latex builds
if [ "$MODE" = "draft" ]; then
  OUTPUT=$(SOURCE_DATE_EPOCH=0 SOURCE_DATE_EPOCH_TEX_PRIMITIVES=1 \
    ${ENGINE} -shell-escape -interaction=nonstopmode "\def\DRAFTMODE{1}\input{${TEX_FILENAME}.tex}" 2>&1)
  EXIT_CODE=$?
else
  OUTPUT=$(SOURCE_DATE_EPOCH=0 SOURCE_DATE_EPOCH_TEX_PRIMITIVES=1 \
    ${ENGINE} -shell-escape -interaction=nonstopmode ${TEX_FILENAME}.tex 2>&1)
  EXIT_CODE=$?
fi

if [ ! $EXIT_CODE -eq 0 ]; then
  echo "${TEX_FILENAME}.tex cannot be compiled"
  echo "$OUTPUT"
  echo ""
  echo "Last 30 lines of log file:"
  tail -30 ${TEX_FILENAME}.log
  exit 1
fi
