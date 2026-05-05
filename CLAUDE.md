# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

This is a **1C:Enterprise 7.7** configuration stored in decompiled text form for version control. The tool `gcomp` (v2.2.15, included in `gcomp_bin_2.2.15/`) decompiles the binary `1CV7.MD` metadata file into a directory tree of human-readable text files (`conf/`), enabling git-based collaboration.

The actual 1C database runs on Windows. Scripts are `.bat` files designed to run on the Windows machine where 1C is installed.

## Build / Compile Commands (Windows)

**Compile** — convert `conf/` into the binary `MD_compile/1Cv7.MD` (used to update the running 1C database):
```bat
compile.bat
```
Logs go to `log/compile.log`.

**Pull + compile** — pull latest from git then recompile:
```bat
pull_compile.bat
```

**Full round-trip (decompile → commit → compile → push)** — for committing changes made directly in the 1C designer:
```bat
compile_decompile_git_script.bat
```
This decompiles `1CV7.md` from the database path (`C:\1C_Base\repository\1c77_MNFC`), stages and commits all changes, then recompiles and pushes.

> `MD_compile/` and `log/` are gitignored; only `conf/` is version-controlled.

## Repository Structure

```
conf/                        # Decompiled 1C configuration (version-controlled)
  ГлобальныйМодуль.1s        # Global module — shared procedures and variables
  Документы/                 # ~134 business documents
  Справочники/               # ~119 reference catalogs
  Обработки/                 # ~99 data processors / utility forms
  Отчеты/                    # ~123 reports
  Регистры/                  # ~52 accounting registers
  Константы/                 # System-wide constants
  Перечисления/              # Enumerations
  ЖурналыДокументов/         # Document journals (views across document types)
  Права/                     # User roles and permissions
  gcomp.ini                  # gcomp settings (language: Rus)
gcomp_bin_2.2.15/            # gcomp binary and helper scripts
```

## Code Architecture

### File types inside `conf/`

Each object folder (document, catalog, report, etc.) contains:
- `МодульПроведения.1s` — posting/transaction logic (documents only)
- `МодульФормы.1s` — form/UI module
- `Структура.mdp` — metadata structure definition
- `Форма.frm` — form layout
- `.mxl` files — print layouts (invoices, receipts, reports)
- `Описание.txt` — description text

### Global module

`conf/ГлобальныйМодуль.1s` defines shared variables and procedures used across all documents and reports. Changes here affect the entire system.

### Naming conventions

- Documents with `УМК_` prefix belong to a related subsidiary/branch module.
- `Обработки/` (processors) are standalone utility forms — batch operations, data import/export, equipment integration, etc.
- Registers (`Регистры/`) store accounting-period data: mutual settlements (`Взаиморасчеты*`), stock movements, etc.

### Business domain

Food production and distribution company. Key functional areas:
- **Production**: `ВыпускПродукции`, `Бригада`, `НормыЗатрат`, `НезавершенноеПроизводство`
- **Warehouse / logistics**: `Перемещение`, `СписаниеТМЦ`, `ПриходнаяНакладная*`, `РасходнаяНакладная`
- **Sales / orders**: `Заказ`, `ЗаказКлиента`, `РасходнаяРозничная`, `УМК_ЗаказыКлиентов`
- **Purchasing**: `ЗаказПоставщику`, `ВозвратПоставщику`
- **Accounting**: `НалоговаяНакладная`, `СчетФактура`, `ПлатежноеПоручение`, `БанковскаяВыписка`

## Language

All code is in the 1C:Enterprise built-in language — a Russian-keyword procedural language. Variables, procedure names, and comments are in Russian (Cyrillic). The `gcomp.ini` setting `language: Rus` controls this.

## 1C 7.7 File Rules
All .1s, .frm, .mdp, .ord files use Windows-1251 encoding with CRLF line endings (\r\n).

### Editing workflow
1. Read: `iconv -f CP1251 -t UTF-8 <file> > /tmp/<file>_utf8`
2. Edit the UTF-8 temp file
3. Write back: `iconv -f UTF-8 -t CP1251 /tmp/<file>_utf8 | unix2dos > <original_file>`

Never write files with LF-only line endings — 1C 7.7 configurator requires CRLF.


### Comments
Add comments to all edits you make with the mark - // + claude
