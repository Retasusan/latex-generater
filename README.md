# TeX-PDF-Converter

A lightweight and containerized LaTeX document compiler powered by [Docker](https://www.docker.com/) and [latexmk](https://ctan.org/pkg/latexmk).  
Designed for reproducible builds and clean outputs with support for Japanese documents using `uplatex` and `upbibtex`.

---

## 📦 Features

- 🐳 Containerized build using `texlive` (TeX Live 2025)
- 🧼 Auto-clean temporary files after compilation
- 🗂 Output PDFs to structured `/pdf/{docname}/` directories
- 📚 Bibliography support with `upbibtex`
- 📝 Supports `minted`, `listings`, `bxjsarticle`, and more
- 🚀 One-command compile with `make`

---

## 🛠 Requirements

- [Docker](https://www.docker.com/)
- [Make](https://www.gnu.org/software/make/)

---

## 🚀 Usage

### Compile a LaTeX document

```bash
make compile <docname>
```

This will:

Compile /tex/\<docname>/\<docname>.tex using latexmk

Output the final PDF to /pdf/\<docname>/\<docname>.pdf

Clean up temporary files (but keep the PDF)

Example:

```bash
make compile template
# Output: /pdf/template/template.pdf
```

## 📁 Project Structure

```project-template
.
├── pdf/
│   └── <docname>/
│       └── <docname>.pdf
├── tex/
│   └── <docname>/
│       ├── <docname>.tex
│       └── reference.bib (optional)
├── latexmkrc
├── compile.sh
├── Dockerfile
├── compose.yml
└── Makefile
```

## ⚙️ Configuration

All LaTeX compilation behavior is configured in latexmkrc.
It uses uplatex, dvipdfmx, and sets the output directory to /pdf/\<docname> based on an environment variable.

## 🧪 Example LaTeX Features

bxjsarticle class for Japanese

minted and listings for syntax highlighting

Bibliography via upbibtex and junsrt.bst

## 📄 License

MIT License
