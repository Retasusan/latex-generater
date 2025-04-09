#!/bin/sh

DOCNAME="$1"
if [ -z "$DOCNAME" ]; then
  echo "❌ Usage: compile.sh <document-name>"
  exit 1
fi

export DOCNAME

WORKDIR="/tex/$DOCNAME"
mkdir -p /pdf
cd "$WORKDIR" || {
  echo "❌ Failed to cd into $WORKDIR"
  exit 1
}

echo "✅ Compiling: $WORKDIR/$DOCNAME.tex"
latexmk \
  -r /tex/latexmkrc \
  -interaction=nonstopmode \
  "$DOCNAME.tex"

PDF="/pdf/${DOCNAME}.pdf"
if [ -f "$PDF" ]; then
  echo "✅ PDF generated at: $PDF"

  echo "🧹 Cleaning up temp files in /pdf (except .pdf)"
  find /pdf -type f ! -name "${DOCNAME}.pdf" -delete
else
  echo "❌ PDF not found at $PDF"
  exit 1
fi
